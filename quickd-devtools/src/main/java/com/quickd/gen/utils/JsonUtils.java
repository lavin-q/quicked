package com.quickd.gen.utils;


import java.io.*;

/**
 * @project: quickd
 * @description: JsonUtils
 * @author: quickd
 * @create: 2019-09-17 12:29
 */
public  class JsonUtils {

    /**
     * 读取json文件
     */
    public static String readJsonFile(String path){
        String laststrJson = "";
        try {
            InputStream inputStream = JsonUtils.class.getResourceAsStream(path);
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                laststrJson = laststrJson + tempString;
                line++;
            }
            reader.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        return laststrJson;
    }

    /**
     * 写出json文件
     */
    public static void writeJsonFile(String newJsonString, String path){
        try {
            FileWriter fw = new FileWriter(path);
            PrintWriter out = new PrintWriter(fw);
            out.write(newJsonString);
            out.println();
            fw.close();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static  void  main(String args[]){

        String jsonPath = "/template/uniapp/pages.json.vm";
        String jsonStr = JsonUtils.readJsonFile(jsonPath);
        System.out.println(jsonStr);
    }

}
