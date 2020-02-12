
package com.quickd.message.service.impl;

import cn.hutool.core.map.MapUtil;
import com.alibaba.fastjson.JSON;

import com.quickd.core.common.Status;
import com.quickd.core.config.ConfigFactory;
import com.quickd.core.config.SmsConfig;
import com.quickd.core.exception.BusinessException;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.message.dao.SysSmsDao;
import com.quickd.message.entity.SysSmsEntity;
import com.quickd.message.service.SysSmsService;
import com.quickd.message.sms.AbstractSmsService;
import com.quickd.message.sms.AliyunSmsService;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;

/**
 * @project: quickd
 * @description: SysSmsServiceImpl 短信服务
 * @author: caochaofeng
 * @create: 2019-10-07 15:24
 */
@Service
public class SysSmsServiceImpl extends BaseServiceImpl<SysSmsDao, SysSmsEntity> implements SysSmsService {



    @Override
    public void send(String mobile, String params,String templateCode) {
        LinkedHashMap<String, String> map;
        try {
            map = JSON.parseObject(params, LinkedHashMap.class);
        }catch (Exception e){
            throw new BusinessException(Status.JSON_FORMAT_ERROR.code());
        }

        //短信服务
       SmsConfig smsConfig = ConfigFactory.buildSmsConfig();
        if(smsConfig == null){
            throw new BusinessException(Status.SMS_CONFIG_ERROR.code());
        }
        AliyunSmsService service = new AliyunSmsService(smsConfig);
        //发送短信
        service.sendSms(mobile, map,templateCode);
    }

    @Override
    public void save( String mobile, LinkedHashMap<String, String> params, Integer status,String remarks) {
        SysSmsEntity sms = new SysSmsEntity();
        sms.setMobile(mobile);
        sms.setRemarks(remarks);
        //设置短信参数
        if(MapUtil.isNotEmpty(params)){
            int index = 1;
            for(String value : params.values()){
                if(index == 1){
                    sms.setParams1(value);
                }else if(index == 2){
                    sms.setParams2(value);
                }else if(index == 3){
                    sms.setParams3(value);
                }else if(index == 4){
                    sms.setParams4(value);
                }
                index++;
            }
        }

        sms.setStatus(status);

        this.save(sms);
    }
}
