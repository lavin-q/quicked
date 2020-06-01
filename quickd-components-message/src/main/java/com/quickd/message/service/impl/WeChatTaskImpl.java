package com.quickd.message.service.impl;

import com.quickd.message.service.WeChatTask;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.springframework.stereotype.Component;

import java.util.List;



/**
 * @project: quickd
 * @description: WeChatTaskImpl 微信消息推送核心类
 * @author: caochaofeng
 * @create: 2019-10-07 15:24
 */
@Component
@Slf4j
public class WeChatTaskImpl implements WeChatTask {

    /**
     * 微信公众号APPId
     */
    public final static String USR_APPID = "wx0e65a6ece91af37b";

    /**
     * 微信公众号APPSecret
     */
    public final static String USR_APPSECRET = "0a459e08da1f13bf96ffd08c52e91b90";

    /**
     * 微信公众号消息模板Id
     */
    public final static String USR_TEMPLATEID = "ktegt3tnR5Db4YZtX0CgaDJ8hTFC7xZuYJPJkW2pwJo";
    /**
     * 微信推送
     * <p>
     * // 1.根据用户等级去查询报警信息
     * // 2.获取组织模板消息
     * // 3.判断是否中性 然后推送消息获取结果
     * jar文档：https://binarywang.github.io/weixin-java-mp-javadoc/
     * @return
     * @throws Exception
     */
    public void pushWeChatTemplateMessage(String openId, List<WxMpTemplateData> data) throws WxErrorException {

        //配置
        WxMpInMemoryConfigStorage wxMpInMemoryConfigStorage = new WxMpInMemoryConfigStorage();
        wxMpInMemoryConfigStorage.setAppId(USR_APPID);
        wxMpInMemoryConfigStorage.setSecret(USR_APPSECRET);
        //授权
        WxMpService wxMpService = new WxMpServiceImpl();
        wxMpService.setWxMpConfigStorage(wxMpInMemoryConfigStorage);
        //组成模板消息
        WxMpTemplateMessage templateMessage = WxMpTemplateMessage.builder().templateId(USR_TEMPLATEID).toUser(openId).build();
        templateMessage.getData().addAll(data);
        wxMpService.getTemplateMsgService().sendTemplateMsg(templateMessage);

    }



}
