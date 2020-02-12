package com.quickd.core.util;

/**
 * @project: jeedcp
 * @description: ${description}
 * @author: caochaofeng
 * @create: 2019-07-08 14:49
 */
import java.io.File;

public class TakeFilePathAndName {

    public static void main(String[] args) {
        // This is the path where the file's name you want to take.
        String path = "C:\\jeedcp\\devtools\\src\\main\\resources\\template\\${project.name}-parent\\${project.name}-service\\src\\main\\java\\${project.packageName}\\${project.name}\\service";
        getFile(path);
    }

    private static void getFile(String path) {
        // get file list where the path has
        File file = new File(path);
        // get the folder list
        File[] array = file.listFiles();

        for (int i = 0; i < array.length; i++) {
            System.out.println("^^^^^" + array[i].getName());
        }
    }
}