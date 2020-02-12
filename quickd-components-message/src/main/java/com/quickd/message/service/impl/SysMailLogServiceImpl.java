

package com.quickd.message.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.message.dao.SysMailLogDao;
import com.quickd.message.dto.SysMailLogDTO;
import com.quickd.message.entity.SysMailLogEntity;
import com.quickd.message.service.SysMailLogService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;


/**
 * @author Administrator
 */
@Service
public class SysMailLogServiceImpl extends BaseServiceImpl<SysMailLogDao, SysMailLogEntity> implements SysMailLogService {


    @Override
    public void save(String templateId, String from, String[] to, String[] cc, String subject, String content, Integer status) {
        SysMailLogEntity log = new SysMailLogEntity();
        log.setTemplateId(templateId);
        log.setMailFrom(from);
        log.setMailTo(JSON.toJSONString(to));
        if(cc != null){
            log.setMailCc(JSON.toJSONString(cc));
        }
        log.setSubject(subject);
        log.setContent(content);
        log.setStatus(status);
        this.save(log);
    }

}