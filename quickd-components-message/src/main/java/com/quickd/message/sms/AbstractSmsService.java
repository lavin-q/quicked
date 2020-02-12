

package com.quickd.message.sms;

import com.quickd.core.config.SmsConfig;

import java.util.LinkedHashMap;

/**
 * 短信
 *
 * @author Mark sunlightcs@gmail.com
 */
public abstract class AbstractSmsService {

    /**
     * 短信配置信息
     */
    SmsConfig config;

    /**
     * 发送短信
     * @param mobile 手机号
     * @param params 参数
     * @param templateCode 短信模板
     */
    public abstract void sendSms(String mobile, LinkedHashMap<String, String> params,String templateCode);

    /**
     *
     * 发送短信
     * @param mobile 手机号
     * @param params 参数
     * @param signName  短信签名
     * @param templateCode 短信模板
     */
    public abstract void sendSms(String mobile, LinkedHashMap<String, String> params, String signName, String templateCode);
}
