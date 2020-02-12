package com.quickd.message.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.api.R;
import com.quickd.core.common.JsonResult;
import com.quickd.message.service.WeChatTask;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.kefu.WxMpKefuMessage;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @project: quickd
 * @description: MessageController
 * @author: caochaofeng
 * @create: 2019-10-07 15:24
 */
@RestController
@RequestMapping("/message")
@Slf4j
public class MessageController {
    @Autowired
    private WeChatTask weChatTask;
//    @Autowired
//    private WxMpService wxMpService;
    /*
     * 发送客服消息，客服消息有时间限制，微信用户如果48小时之内未与微信公众号互动过，则公众号无法向该微信用户发送客服消息。
     * @RequestParam("wechatId") 微信用户OPENID，必需
     * @RequestParam("msg") 信息内容，必需
     */
//    @RequestMapping(value = "/customer", method = RequestMethod.POST)
//    public JsonResult customerMsg(String openId, String msg) {
//        try {
//            WxMpKefuMessage message = WxMpKefuMessage
//                    .TEXT()
//                    .toUser(openId)
//                    .content(msg)
//                    .build();
//            wxMpService.getKefuService().sendKefuMessage(message);
//            return new JsonResult();
//        } catch (Exception e) {
//            log.warn("发送客服文本消息失败", e);
//            return new JsonResult().error("发送客服文本消息失败");
//        }
//    }

    /*
     * 发送模板消息
     * @RequestParam("openId") 微信用户OPENID，必需
     * @RequestParam("jsonData") Json数据，替换模板中的参数，必需
     */
    @RequestMapping(value = "/template", method = RequestMethod.POST)
    public JsonResult templateMsg(String openId, String jsonData) throws WxErrorException {
        List<WxMpTemplateData> wechatMsg  = new ArrayList<>();
        //        String title =  String.format("%s设备下的%s号从机, 数据点[%s]%s", deviceInfo.getName(), trigger.getSlaveIndex(), dataPointInfo.getName(), alarmInfoDTO.isAlarmState() ? "触发报警" : "恢复正常");
        //        dataList.add(new WxMpTemplateData("first", title, alarmInfoDTO.isAlarmState()?"#FF3333":"#2ca175"));
        //
        //        dataList.add(new WxMpTemplateData("keyword1", deviceInfo.getName(), "#000000"));
        //        dataList.add(new WxMpTemplateData("keyword2", dataPointInfo.getName(), "#000000"));
        //        dataList.add(new WxMpTemplateData("keyword3", trigger.getInputValue().toString(), "#000000"));
        //        dataList.add(new WxMpTemplateData("keyword4", getPlainContent(trigger, alarmInfoDTO.isAlarmState()), "#000000"));
        JSONObject jo = JSONObject.parseObject(jsonData);
        for (Map.Entry<String, Object> entry : jo.entrySet()) {
            String name =entry.getKey();
            String value=((JSONObject)entry.getValue()).get("value").toString();
            String color=((JSONObject)entry.getValue()).get("color").toString();
            wechatMsg .add(new WxMpTemplateData(name, value, color));
        }
        weChatTask.pushWeChatTemplateMessage(openId, wechatMsg);
        return new JsonResult();
    }
}
