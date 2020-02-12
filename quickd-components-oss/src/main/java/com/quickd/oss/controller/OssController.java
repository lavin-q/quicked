package com.quickd.oss.controller;


import com.alibaba.fastjson.JSONObject;
import com.quickd.core.annotation.LogOperationAno;
import com.quickd.core.common.Const;
import com.quickd.core.common.Status;
import com.quickd.core.config.AliyunStorageConfig;
import com.quickd.core.config.ConfigFactory;
import com.quickd.core.controller.BaseController;
import com.quickd.core.validator.ValidatorUtils;
import com.quickd.oss.dto.OssDto;
import com.quickd.oss.entity.Oss;
import com.quickd.oss.service.IOssService;
import com.quickd.oss.service.AliyunCloudStorageService;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.io.FilenameUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;


import com.quickd.core.common.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;


/**
 *
 * @author Administrator
 */
@RestController
@RequestMapping("/sys/oss")
public class OssController extends BaseController<IOssService, Oss, OssDto> {
    @Autowired
    private IOssService ossService;

    /**
     * @param uploadFile
     * @return
     * @throws Exception
     * @desc 文件上传到oss
     */
    @RequestMapping("/upload/multi")
    public JsonResult upload(@RequestParam("file") MultipartFile[] uploadFile) {
        AliyunStorageConfig config =   ConfigFactory.buildAliyunConfig();
        AliyunCloudStorageService aliyunCloudStorageService =  new AliyunCloudStorageService(config);
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
                url = aliyunCloudStorageService.uploadSuffix( uploadFile[i].getInputStream(), extension);
            } catch (IOException e) {
                e.printStackTrace();
            }
            //保存文件信息
            Oss ossEntity = new Oss();
            ossEntity.setUrl(url);
            ossEntity.setCreateTime(new Date());
            ossService.save(ossEntity);
            fileUploadResult[i]=url;
        }

        return new JsonResult().ok(fileUploadResult);
    }




    @PostMapping("/saveConfig")
    @ApiOperation(value = "保存云存储配置信息")
    @LogOperationAno("保存云存储配置信息")
    @RequiresPermissions("sys:oss:all")
    public JsonResult saveConfig(@RequestBody AliyunStorageConfig config){
        //校验类型
        ValidatorUtils.validateEntity(config);
        ConfigFactory.updateConfig(Const.CLOUD_STORAGE_CONFIG_KEY, JSONObject.toJSON(config).toString(),"云存储配置信息");
        return new JsonResult();
    }


}
