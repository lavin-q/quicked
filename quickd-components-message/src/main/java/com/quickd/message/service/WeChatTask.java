package com.quickd.message.service;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;

import java.util.List;

/**
 * @project: quickd
 * @description: WeChatTaskImpl 微信消息推送
 * @author: caochaofeng
 * @create: 2019-10-07 15:24
 */
public interface WeChatTask {

    /**
     * 推送微信模板消息
     *
     * @param weChatOpenId
     * @return
     */
    void pushWeChatTemplateMessage(String weChatOpenId, List<WxMpTemplateData> template) throws WxErrorException;
}
