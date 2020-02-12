package com.quickd.oss.controller;

import com.quickd.core.common.JsonResult;
import com.quickd.core.common.Status;
import com.quickd.core.config.ConfigFactory;
import com.quickd.core.config.LocalStorageConfig;
import com.quickd.oss.service.LocalCloudStorageService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/sys/local")
public class LocalFileUploadController {

    /**
     * @param uploadFile
     * @return
     * @throws Exception
     * @desc 文件上传到本地
     */
    @RequestMapping("/upload")
    public JsonResult upload(@RequestParam("file") MultipartFile[] uploadFile) {
        LocalStorageConfig config = ConfigFactory.buildLocalConfig();
        LocalCloudStorageService localCloudStorageService =  new LocalCloudStorageService(config);
        if (uploadFile.length==0) {
            return new JsonResult().error(Status.UPLOAD_FILE_EMPTY.code());
        }
        String[] fileUploadResult = new String[uploadFile.length];
        for(int i = 0;i<uploadFile.length;i++) {
            String fileName = uploadFile[i].getOriginalFilename();
            //上传文件
            String extension = FilenameUtils.getExtension(fileName);
            String url = null;
            try {
                url = localCloudStorageService.uploadSuffix( uploadFile[i].getInputStream(), extension);
            } catch (IOException e) {
                e.printStackTrace();
            }
            fileUploadResult[i]=url;
        }

        return new JsonResult().ok(fileUploadResult);
    }

}
