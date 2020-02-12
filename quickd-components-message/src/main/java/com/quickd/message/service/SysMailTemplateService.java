

package com.quickd.message.service;

import com.quickd.core.service.BaseService;
import com.quickd.message.entity.SysMailTemplateEntity;

/**
 * 邮件模板
 *
 */
public interface SysMailTemplateService extends BaseService<SysMailTemplateEntity> {

    /**
     * 发送邮件
     * @param id           邮件模板ID
     * @param mailTo       收件人
     * @param mailCc       抄送
     * @param params       模板参数
     */
    boolean sendMail(String id, String mailTo, String mailCc, String params) throws Exception;
}