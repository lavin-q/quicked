package com.quickd.gen.controller;

import cn.org.rapid_framework.generator.util.FileHelper;
import com.quickd.core.common.JsonResult;
import com.quickd.core.controller.BaseController;
import com.quickd.gen.dto.GenProjectDto;
import com.quickd.gen.entity.GenProject;
import com.quickd.core.model.Components;
import com.quickd.core.model.DbInfo;
import com.quickd.core.model.ProjectInfo;
import com.quickd.core.util.ConvertUtils;
import com.quickd.core.util.DBUtil;
import com.quickd.core.util.ProcessUtil;
import com.quickd.core.validator.ValidatorUtils;
import com.quickd.core.validator.group.AddGroup;
import com.quickd.core.validator.group.DefaultGroup;
import com.quickd.gen.service.IGenProjectService;
import com.quickd.gen.utils.PathUtil;
import com.quickd.gen.utils.ZipUtil;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;

/**
 * <p>
 * 项目生成表 前端控制器
 * </p>
 *
 * @author quickd
 * @since 2019-08-29
 */
@Controller
@RequestMapping("/gen/project")
@Slf4j
@Api(tags = "生成项目")
public class GenProjectController extends BaseController<IGenProjectService, GenProject, GenProjectDto> {

    @RequestMapping(value = "/installSql", method = RequestMethod.POST)
    public JsonResult installSql(String components) {
        try {
            Connection connection = DBUtil.getFHCon();
            DBUtil.runSqlByScriptRunner(connection, "sql/mysql.sql");
            if (components!=null&&components.contains("activiti")) {
                DBUtil.runSqlByScriptRunner(connection, "sql/activiti/mysql.sql");
            }
            if (components!=null&&components.contains("quartz")) {
                DBUtil.runSqlByScriptRunner(connection, "sql/quartz/mysql.sql");
            }
            return new JsonResult().success("初始化数据成功");
        } catch (Exception ex) {
            return new JsonResult().error("初始化数据失败");
        }
    }

    @RequestMapping(value = "/gen-code", method = RequestMethod.POST)
    public void genProject(@RequestBody GenProjectDto genProjectDto) throws IOException {
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletResponse response = servletRequestAttributes.getResponse();
        ValidatorUtils.validateEntity(genProjectDto, AddGroup.class, DefaultGroup.class);
        //基本信息
        Map<String, Object> root = new HashMap<String, Object>();
        String packageName = genProjectDto.getGroupName().replaceAll("\\.", "\\/");
        genProjectDto.setPackageName(packageName);
        root.put("project", new ProjectInfo(genProjectDto.getSysName(), genProjectDto.getProject(), genProjectDto.getGroupName(),
                genProjectDto.getCopyright(), genProjectDto.getAuthor(), packageName));
        root.put("dbInfo", new DbInfo(genProjectDto.getDbUrl(), genProjectDto.getDbPort(),
                genProjectDto.getDbName(), genProjectDto.getDbUsername(), genProjectDto.getDbPassword()));


        //组件
        if (genProjectDto.getComponents() != null) {
            root.put("components", new Components(genProjectDto.getComponents().split(",")));
        }

        String outDir = genProjectDto.getGenPath();
        outDir = PathUtil.getOutDirPath(outDir);
        log.info("outDir:" + outDir);
        //do
        execute(root, outDir);
        GenProject entity = ConvertUtils.sourceToTarget(genProjectDto, getTClass());
        baseService.save(entity);
        //压缩
        ByteArrayOutputStream tmp = new ByteArrayOutputStream();
        ZipUtil.toZip(outDir, tmp, true);
        //response 压缩包
        response.getOutputStream().write(tmp.toByteArray());
    }


    private void execute(Map<String, Object> root, String outDir) {
        File templateBaseDir = null;
        try {
            Resource resource = new ClassPathResource("template");
            templateBaseDir = resource.getFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //获取所有的目录及文件的相对目录
        List<File> srcFiles = FileHelper.searchAllNotIgnoreFile(templateBaseDir);
        for (int i = 0; i < srcFiles.size(); i++) {
            File srcFile = srcFiles.get(i);
            //获取每一个file的相对路径
            String filePath = FileHelper.getRelativePath(templateBaseDir, srcFile);
            if (filePath.length() == 0 || filePath.indexOf("$") == -1) {
                continue;
            }
            //获取路径上所有的变量,并替替换成定义的值
            String filePathVariables[] = filePath.split(Matcher.quoteReplacement("$"));
            for (String filePathVariable : filePathVariables) {
                if (filePathVariable.indexOf("{") == -1) {
                    continue;
                }
                String columnName = filePathVariable.substring(filePathVariable.indexOf("{") + 1, filePathVariable.indexOf("}"));
                String[] columnNames = columnName.split("\\.");

                String value = null;
                //根据key获取value,ps:key可能是多级 begin
                Map<String, Object> focusMap = root;
                for (String focusColumnName : columnNames) {
                    Object get = focusMap.get(focusColumnName);
                    if (get instanceof String) {
                        value = get == null ? null : get.toString();
                        break;
                    } else if (get instanceof Map) {
                        focusMap = ((Map) get);
                    }
                }
                //根据key获取value,ps:key可能是多级 end
                //替换文件名,并去除无用字符
                filePath = filePath.replace(columnName, value);
                filePath = filePath.replace("{", "").replaceAll("}", "").replace("$", "");
            }

            //创建文件夹
            log.info(filePath);
            //是文件夹先创建,不是则渲染模板
            File tmp = new File(outDir + filePath);
            out:
            if (!tmp.exists()) {
                if (tmp.getName().indexOf(".") > -1) {
                    //属于文件
                    break out;
                }
                tmp.mkdirs();
            }
            if (tmp.isDirectory()) {
                continue;
            }
            //渲染
            if (filePath.endsWith(".iml") || filePath.endsWith(".jar") || filePath.endsWith(".vue") || filePath.endsWith(".png")
                    || filePath.endsWith(".jpg") || filePath.endsWith(".gif")) {
                try {
                    FileUtils.copyFile(srcFile, tmp);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else if (filePath.contains("-ui")) {
                if (filePath.contains("config\\index.js")
                        || filePath.contains("package.json")
                        || filePath.contains("index.html")
                        || filePath.contains("settings.js")) {
                    ProcessUtil.process(tmp, new File(srcFile.getPath().replace(tmp.getName(), "")), root);
                } else {
                    try {
                        FileUtils.copyFile(srcFile, tmp);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                ProcessUtil.process(tmp, new File(srcFile.getPath().replace(tmp.getName(), "")), root);
            }

        }
    }

}
