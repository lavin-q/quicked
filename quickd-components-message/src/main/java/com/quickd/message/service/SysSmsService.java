

package com.quickd.message.service;

import com.quickd.core.service.BaseService;
import com.quickd.message.entity.SysSmsEntity;

import java.util.LinkedHashMap;

/**
 * 短信
 *
 * @author Mark sunlightcs@gmail.com
 */
public interface SysSmsService extends BaseService<SysSmsEntity> {

    /**
     * 发送短信
     * @param mobile   手机号
     * @param params   短信参数
     */
    void send(String mobile, String params,String templateCode);

    /**
     * 保存短信发送记录
     * @param mobile   手机号
     * @param params   短信参数
     * @param status   发送状态
     */
    void save(String mobile, LinkedHashMap<String, String> params, Integer status,String remarks);
}

