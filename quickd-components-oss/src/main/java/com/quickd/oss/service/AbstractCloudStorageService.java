package com.quickd.oss.service;


import com.quickd.core.util.DateUtil;
import org.apache.commons.lang3.StringUtils;

import java.io.InputStream;
import java.util.Date;
import java.util.UUID;

/**
 * @project: quickd
 * @description: AbstractCloudStorageService
 * @author: caochaofeng
 * @create: 2019-10-06 14:27
 */
public abstract class AbstractCloudStorageService {
    /**
     * 文件路径
     * @param prefix 前缀
     * @param suffix 后缀
     * @return 返回上传路径
     */
    public String getPath(String prefix, String suffix) {
        //生成uuid
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        //文件路径
        String path = DateUtil.format(new Date(), "yyyyMMdd") + "/" + uuid;

        if(StringUtils.isNotBlank(prefix)){
            path = prefix + "/" + path;
        }
        return path + "." + suffix;
    }

    /**
     * 文件上传
     * @param data    文件字节数组
     * @param path    文件路径，包含文件名
     * @return        返回http地址
     */
    public abstract String upload(byte[] data, String path);

    /**
     * 文件上传
     * @param data     文件字节数组
     * @param suffix   后缀
     * @return         返回http地址
     */
    public abstract String uploadSuffix(byte[] data, String suffix);

    /**
     * 文件上传
     * @param inputStream   字节流
     * @param path          文件路径，包含文件名
     * @return              返回http地址
     */
    public abstract String upload(InputStream inputStream, String path);

    /**
     * 文件上传
     * @param inputStream  字节流
     * @param suffix       后缀
     * @return             返回http地址
     */
    public abstract String uploadSuffix(InputStream inputStream, String suffix);

}

