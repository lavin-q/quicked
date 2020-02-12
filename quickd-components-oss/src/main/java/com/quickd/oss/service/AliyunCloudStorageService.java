package com.quickd.oss.service;


import com.aliyun.oss.OSSClient;
import com.quickd.core.common.Status;
import com.quickd.core.config.AliyunStorageConfig;
import com.quickd.core.exception.BusinessException;

import java.io.*;

/**
 * <p>
 * 文件上传 服务实现类
 * </p>
 *
 * @author quickd
 * @since 2019-10-06
 */
public class AliyunCloudStorageService extends AbstractCloudStorageService {

    /** 云存储配置信息 */
    AliyunStorageConfig config;

    public AliyunCloudStorageService(AliyunStorageConfig config){
        this.config = config;
    }

    @Override
    public String upload(byte[] data, String path) {
        return upload(new ByteArrayInputStream(data), path);
    }

    @Override
    public String upload(InputStream inputStream, String path) {
        OSSClient client = new OSSClient(config.getAliyunEndPoint(), config.getAliyunAccessKeyId(),
                config.getAliyunAccessKeySecret());
        try {
            client.putObject(config.getAliyunBucketName(), path, inputStream);
            client.shutdown();
        } catch (Exception e){
            throw new BusinessException(Status.OSS_UPLOAD_FILE_ERROR.code(), e);
        }

        return config.getAliyunDomain() + "/" + path;
    }

    @Override
    public String uploadSuffix(byte[] data, String suffix) {
        return upload(data, getPath(config.getAliyunPrefix(), suffix));
    }

    @Override
    public String uploadSuffix(InputStream inputStream, String suffix) {
        return upload(inputStream, getPath(config.getAliyunPrefix(), suffix));
    }
}
