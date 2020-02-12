package com.quickd.gen.utils;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 路径工具类
 * @project: quickd
 * @description: PathUtil
 * @author: quickd
 * @create: 2019-09-18 21:59
 */
public class PathUtil {

    /**
     * 获取模板路径
     * @param courseFile
     * @return
     */
    public static String getTemplatePath(String courseFile) {
        String templateDir = courseFile + "/template/";
        return templateDir;
    }

    /**
     * 获取输出路径
     * @param courseFile
     * @return
     */
    public static String getOutDirPath(String courseFile) {
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String outDir = courseFile + "/" + sdf.format(dt) + "/project_";
        String uuid = java.util.UUID.randomUUID().toString();
        outDir = outDir + uuid + "/";
        return outDir;
    }

    /**
     * 获取项目路径
     * @return
     * @throws IOException
     */
    public static String getProjectPath() throws IOException {
        //获取当前项目路径
        File directory = new File("");// 参数为空
        String courseFile = directory.getCanonicalPath();
        return courseFile;
    }
}
