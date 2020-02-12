

package com.quickd.message.service;

import com.quickd.core.service.BaseService;
import com.quickd.message.entity.SysMailLogEntity;

/**
 * 邮件发送记录
 */
public interface SysMailLogService extends BaseService<SysMailLogEntity> {


    /**
     * 保存邮件发送记录
     * @param templateId  模板ID
     * @param from        发送者
     * @param to          收件人
     * @param cc          抄送
     * @param subject     主题
     * @param content     邮件正文
     * @param status      状态
     */
    void save(String templateId, String from, String[] to, String[] cc, String subject, String content, Integer status);
}

