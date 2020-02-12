

package com.quickd.message.service.impl;

import com.alibaba.fastjson.JSON;
import com.quickd.core.common.Status;
import com.quickd.core.exception.BusinessException;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.message.dao.SysMailTemplateDao;
import com.quickd.message.email.EmailUtils;
import com.quickd.message.entity.SysMailTemplateEntity;
import com.quickd.message.service.SysMailTemplateService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author Administrator
 */
@Service
public class SysMailTemplateServiceImpl extends BaseServiceImpl<SysMailTemplateDao, SysMailTemplateEntity> implements SysMailTemplateService {
    @Autowired
    private EmailUtils emailUtils;

    @Override
    public boolean sendMail(String id, String mailTo, String mailCc, String params) throws Exception{
        Map<String, Object> map = null;
        try {
            if(StringUtils.isNotEmpty(params)){
                map = JSON.parseObject(params, Map.class);
            }
        }catch (Exception e){
            throw new BusinessException(Status.JSON_FORMAT_ERROR.code());
        }
        String[] to = new String[]{mailTo};
        String[] cc = StringUtils.isBlank(mailCc) ? null : new String[]{mailCc};

        return emailUtils.sendMail(id, to, cc, map);
    }
}
