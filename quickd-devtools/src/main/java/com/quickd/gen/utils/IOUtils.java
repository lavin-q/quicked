package com.quickd.gen.utils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;

/**
 * @project: 100.quickd
 * @description: ${description}
 * @author: quickd
 * @create: 2019-07-16 15:19
 */
public class IOUtils {

    public static void createFiles(StringWriter writer, String fileName) throws IOException {
        File file = new File(fileName);
        if (!file.getParentFile().exists()) {
            if (file.getParentFile().mkdirs()) {
                file.createNewFile();
            }
        }
        FileOutputStream of = new FileOutputStream(file);
        of.write(writer.toString().getBytes("utf-8"));
        of.flush();
        of.close();
    }
}
