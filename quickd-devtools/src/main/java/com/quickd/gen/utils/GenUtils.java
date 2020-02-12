
package com.quickd.gen.utils;

import cn.hutool.core.bean.BeanUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.quickd.gen.entity.GenTable;
import com.quickd.gen.entity.GenTableColumn;
import com.quickd.core.util.DateUtil;
import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.WordUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;

/**
 * 代码生成器   工具类
 */
public class GenUtils {

    public static List<String> getTemplates(String templateName, Boolean hasRefTable) {
        List<String> templates = new ArrayList<String>();
//        Model,Service,Mapper
        if (templateName.contains("backend")) {
            templates.add("template/backend/Entity.java.vm");
            templates.add("template/backend/Dao.java.vm");
//        templates.add("template/backend/Dao.xml.vm");
            templates.add("template/backend/Service.java.vm");
            templates.add("template/backend/ServiceImpl.java.vm");
            templates.add("template/backend/DTO.java.vm");
            templates.add("template/backend/Controller.java.vm");
            templates.add("template/backend/mysql.vm");
//            templates.add("template/backend/Excel.java.vm");
        }
        if (templateName.contains("View")) {
            templates.add("template/front/index.vue.vm");
            templates.add("template/front/index.js.vm");
            templates.add("template/front/add-or-update.vue.vm");
        }

        if (templateName.contains("uniapp")) {
            templates.add("template/uniapp/index.vue.vm");
            templates.add("template/uniapp/index.js.vm");
            templates.add("template/uniapp/add-or-update.vue.vm");
            templates.add("template/uniapp/info.vue.vm");
            if (hasRefTable) {
                templates.add("template/uniapp/fuzzy-search.vue.vm");
            }
            templates.add("template/uniapp/pages.json.vm");
        }

        if (templateName.contains("android")) {
            templates.add("template/android/Entity.java.vm");
            templates.add("template/android/entity_add.xml.vm");
            templates.add("template/android/entity_view.xml.vm");
            templates.add("template/android/EntityActivity.java.vm");
            templates.add("template/android/EntityAddActivity.java.vm");
            templates.add("template/android/EntityListAdapter.java.vm");
            templates.add("template/android/EntityListFragment.java.vm");
            templates.add("template/android/EntityViewActivity.java.vm");
        }
        return templates;
    }

    /**
     * 生成代码
     */
    public static void generatorCode(String tableComment, List<GenTableColumn> columsList, String templateName, String genPath) {
        //配置信息
        Configuration config = getConfig();
        boolean hasBigDecimal = false;
        //表信息
        GenTable genTable = new GenTable();
        genTable.setTableName(columsList.get(0).getTableName());
        genTable.setComments(tableComment);
        //表名转换成Java类名
        String tableName = genTable.getTableName();
        String moduleName = tableName;
        String subModuleName = tableName;
        if (tableName.contains("_")) {
            moduleName = tableName.split("_")[0];
            String tablePrefix = moduleName + "_";
            subModuleName = tableName.replaceFirst(tablePrefix, "");
        }
        String className = tableToJava(subModuleName);
        genTable.setClassName(className);
        genTable.setLowClassName(StringUtils.uncapitalize(className));

        //列信息
        Boolean hasRefTable = false;
        Boolean hasDict = false;
        for (GenTableColumn columnEntity : columsList) {
            //列名转换成Java属性名
            String attrName = columnToJava(columnEntity.getColName());
            columnEntity.setAttrName(attrName);
            columnEntity.setAttr(StringUtils.uncapitalize(attrName));
            //列的数据类型，转换成Java类型
            String attrType = columnEntity.getAttrType();
            columnEntity.setAttrType(attrType);
            if (!hasBigDecimal && attrType.equals("BigDecimal")) {
                hasBigDecimal = true;
            }
            if (columnEntity.getDictType() != null) {
                hasDict = true;
            }
            if (columnEntity.getRefTable() != null) {
                String refTableName = columnEntity.getRefTable();
                hasRefTable = true;
                String relModuleName = refTableName ;
                String relSubModuleName = refTableName ;
                if (refTableName.contains("_")) {
                    relModuleName = refTableName.split("_")[0];
                    String tablePrefix = relModuleName + "_";
                    relSubModuleName = refTableName.replaceFirst(tablePrefix, "");
                }

                String refClassName = tableToJava(relSubModuleName);
                columnEntity.setRefClassName(refClassName);
                columnEntity.setLowRefClassName(StringUtils.uncapitalize(refClassName));
                columnEntity.setRefPathName(relModuleName + File.separator + relSubModuleName);
            }
        }
        //设置velocity资源加载器
        Properties prop = new Properties();
        prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);

        //封装模板数据
        Map<String, Object> map = new HashMap<>();
        map = BeanUtil.beanToMap(genTable);
        map.put("pk", "id");
        map.put("className", genTable.getClassName());
        map.put("classname", genTable.getLowClassName());
//        map.put("lowClassName", genTable.getLowClassName().toLowerCase());
        map.put("pathName", moduleName + File.separator + genTable.getLowClassName());
        map.put("columns", columsList);
        map.put("hasBigDecimal", hasBigDecimal);
        map.put("version", config.getString("version"));
        map.put("package", config.getString("package"));
        map.put("moduleName", moduleName);
        map.put("author", config.getString("author"));
        map.put("email", config.getString("email"));
        map.put("hasRefTable", hasRefTable);
        map.put("hasDict", hasDict);
        map.put("datetime", DateUtil.format(new Date(), DateUtil.DATE_TIME_PATTERN));
        map.put("date", DateUtil.format(new Date(), DateUtil.DATE_PATTERN));

        for (int i = 0; i <= 10; i++) {
            map.put("id" + i, IdWorker.getId());
        }

        VelocityContext context = new VelocityContext(map);

        //获取模板列表
        List<String> templates = getTemplates(templateName, hasRefTable);
        for (String template : templates) {
            //直接生成json文件
            if (template.contains("pages.json")) {
                String path = genPath + config.getString("output.path.uniPagejson");
//                createJsonFile(StringUtils.lowerCase(className), path, hasRefTable);
            } else {
                //渲染模板
                StringWriter sw = new StringWriter();
                Template tpl = Velocity.getTemplate(template, "UTF-8");
                tpl.merge(context, sw);

                try {
                    String fileName = getFileName(template, genTable.getClassName(), genPath, moduleName);
                    IOUtils.createFiles(sw, fileName);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
    }


    /**
     * 列名转换成Java属性名
     */
    public static String columnToJava(String columnName) {
        return WordUtils.capitalizeFully(columnName, new char[]{'_'}).replace("_", "");
    }

    /**
     * 表名转换成Java类名
     */
    public static String tableToJava(String tableName) {
        return columnToJava(tableName);
    }

    /**
     * 获取配置信息
     */
    public static Configuration getConfig() {
        try {
            return new PropertiesConfiguration("quickd.properties");
        } catch (ConfigurationException e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * 获取文件名
     */
    public static String getFileName(String template, String className, String basePath, String moduleName) {
        Configuration config = getConfig();
//        String basePath = GenUtils.class.getResource("/").getPath().toString();
//        basePath = basePath.substring(0, basePath.indexOf("parent"));
        String entityPath = basePath + config.getString("output.path.entity");
//        String excelPath =   basePath+config.getString("output.path.excel");
        String dtoPath = basePath + config.getString("output.path.dto");
        String servicePath = basePath + config.getString("output.path.service");
        String daoPath = basePath + config.getString("output.path.dao");
        String controllerPath = basePath + config.getString("output.path.controller");
        String viewPath = basePath + config.getString("output.path.view");
        String apijsPath = basePath + config.getString("output.path.apijs");

        String univiewPath = basePath + config.getString("output.path.uniview");
        String uniapijsPath = basePath + config.getString("output.path.uniapijs");

        String androidXmlPath = basePath + config.getString("output.path.androidXmlPath");
        String androidSrcPath = basePath + config.getString("output.path.androidSrcPath");

        String sqlPath = basePath + config.getString("output.path.sql");
        if (template.contains("template/backend/Entity.java.vm")) {
            return entityPath + File.separator + moduleName + File.separator + className + ".java";
        }

//        if (template.contains("template/backend/Excel.java.vm")) {
//            return excelPath + className + "Excel.java";
//        }

        if (template.contains("template/backend/Dao.java.vm")) {
            return daoPath + File.separator + moduleName + File.separator + className + "Mapper.java";
        }

        if (template.contains("template/backend/Service.java.vm")) {
            return servicePath + File.separator + moduleName + File.separator + "I" + className + "Service.java";
        }

        if (template.contains("template/backend/ServiceImpl.java.vm")) {
            return servicePath + File.separator + moduleName + File.separator + "impl" + File.separator + className + "ServiceImpl.java";
        }

        if (template.contains("template/backend/Controller.java.vm")) {
            return controllerPath + File.separator + moduleName + File.separator + className + "Controller.java";
        }

//        if (template.contains("Dao.xml.vm")) {
//            return "main" + File.separator + "resources" + File.separator + "mapper" + File.separator + moduleName + File.separator + className + "Dao.xml";
//        }

        if (template.contains("template/backend/DTO.java.vm")) {
            return dtoPath + File.separator + moduleName + File.separator + className + "DTO.java";
        }

        if (template.contains("template/front/index.vue.vm")) {
            return viewPath + File.separator + moduleName + File.separator + className.toLowerCase() + ".vue";
        }

        if (template.contains("template/front/add-or-update.vue.vm")) {
            return viewPath + File.separator + moduleName  + File.separator + className.toLowerCase() + "-add-or-update.vue";
        }

        if (template.contains("template/front/index.js.vm")) {
            return apijsPath + File.separator + moduleName + File.separator + className.toLowerCase() + ".js";
        }

//        if (template.contains("template/backend/mysql.vm")) {
//            return sqlPath + File.separator + moduleName + File.separator + className.toLowerCase() + ".mysql.sql";
//        }

        //Uniapp
        if (template.contains("template/uniapp/index.vue.vm")) {
            return univiewPath  + File.separator + className.toLowerCase() + File.separator + "index.vue";
        }
        if (template.contains("template/uniapp/add-or-update.vue.vm")) {
            return univiewPath  + File.separator + className.toLowerCase() + File.separator + "add-or-update.vue";
        }
        if (template.contains("template/uniapp/info.vue.vm")) {
            return univiewPath+ File.separator + className.toLowerCase() + File.separator + "info.vue";
        }
        if (template.contains("template/uniapp/fuzzy-search.vue.vm")) {
            return univiewPath  + File.separator + className.toLowerCase() + File.separator + "fuzzy-search.vue";
        }
        if (template.contains("template/uniapp/index.js.vm")) {
            return uniapijsPath + File.separator + moduleName + File.separator + className.toLowerCase() + ".js";
        }


        //Android

        if (template.contains("template/android/entity_add.xml.vm")) {
            return androidXmlPath + File.separator + className.toLowerCase() + "_add.xml";
        }
        if (template.contains("template/android/entity_view.xml.vm")) {
            return androidXmlPath + File.separator + className.toLowerCase() + "_view.xml";
        }

        if (template.contains("template/android/Entity.java.vm")) {
            return androidSrcPath + File.separator + className.toLowerCase() + File.separator + className + ".java";
        }
        if (template.contains("template/android/EntityActivity.java.vm")) {
            return androidSrcPath + File.separator + className.toLowerCase() + File.separator + className + "Activity.java";
        }
        if (template.contains("template/android/EntityAddActivity.java.vm")) {
            return androidSrcPath + File.separator + className.toLowerCase() + File.separator + className + "AddActivity.java";
        }
        if (template.contains("template/android/EntityListAdapter.java.vm")) {
            return androidSrcPath + File.separator + className.toLowerCase() + File.separator + className + "ListAdapter.java";
        }
        if (template.contains("template/android/EntityListFragment.java.vm")) {
            return androidSrcPath + File.separator + className.toLowerCase() + File.separator + className + "ListFragment.java";
        }
        if (template.contains("template/android/EntityViewActivity.java.vm")) {
            return androidSrcPath + File.separator + moduleName + File.separator + className.toLowerCase() + File.separator + className + "ViewActivity.java";
        }


        return null;
    }


    private static void createJsonFile(String module, String genPath, boolean hasRefTable) {
        //TODO 如何动态添加
        String jsonPath = genPath + "pages.json";
        String jsonStr = JsonUtils.readJsonFile(jsonPath);
        System.out.println(jsonStr);
        JSONObject jsonObject = JSONObject.parseObject(
                jsonStr);
        JSONArray jsonArray = jsonObject.getJSONArray("pages");

        JSONObject newjson = new JSONObject();
        newjson.put("path", "pages/list/" + module + "/add-or-update");
        newjson.put("style", new JSONObject());
        if (!jsonArray.contains(newjson)) {
            jsonArray.add(newjson);
        }

        newjson = new JSONObject();
        newjson.put("path", "pages/list/" + module + "/index");
        newjson.put("style", new JSONObject());
        if (!jsonArray.contains(newjson)) {
            jsonArray.add(newjson);
        }

        newjson = new JSONObject();
        newjson.put("path", "pages/list/" + module + "/info");
        newjson.put("style", new JSONObject());
        if (!jsonArray.contains(newjson)) {
            jsonArray.add(newjson);
        }

        if (hasRefTable) {
            newjson = new JSONObject();
            newjson.put("path", "pages/list/" + module + "/fuzzy-search");
            newjson.put("style", new JSONObject());
            if (!jsonArray.contains(newjson)) {
                jsonArray.add(newjson);
            }
        }

        JsonUtils.writeJsonFile(jsonObject.toJSONString(), genPath + "pages.json");
    }


    public  static  void main(String args[]){
        String tableName = "wms_inventory_bin";
        String moduleName = tableName;
        String subModuleName = tableName;
        if (tableName.contains("_")) {
            moduleName = tableName.split("_")[0];
            String tablePrefix = moduleName + "_";
            subModuleName = tableName.replaceFirst(tablePrefix, "");
        }
        String className = tableToJava(subModuleName);
        System.out.println(moduleName);
        System.out.println(subModuleName);
        System.out.println(className);
    }

}
