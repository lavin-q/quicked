package com.quickd.message.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.gexin.rp.sdk.base.IPushResult;
import com.gexin.rp.sdk.base.impl.AppMessage;
import com.gexin.rp.sdk.base.impl.ListMessage;
import com.gexin.rp.sdk.base.impl.SingleMessage;
import com.gexin.rp.sdk.base.impl.Target;
import com.gexin.rp.sdk.base.payload.APNPayload;
import com.gexin.rp.sdk.exceptions.RequestException;
import com.gexin.rp.sdk.http.IGtPush;
import com.gexin.rp.sdk.template.LinkTemplate;
import com.gexin.rp.sdk.template.NotificationTemplate;
import com.gexin.rp.sdk.template.TransmissionTemplate;
import com.gexin.rp.sdk.template.style.Style0;
import com.quickd.core.common.Const;
import com.quickd.core.config.ConfigFactory;
import com.quickd.message.service.GetuiPushService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Administrator
 */
@Service
@Slf4j
public class GetuiPushServiceImpl implements GetuiPushService {
    /**
     * 默认离线有效时间，单位为毫秒
     */
    private static long DEFAULT_OFFLINE_EXPIRE_TIME = 24 * 3600 * 1000;

    /**
     * 默认网络环境：1为wifi，0为不限制网络环境
     */
    private static int DEFAULT_PUSH_NETWORK_TYPE = 0;


//    /**
//     * 通知栏显示logo地址
//     */
//    @Value("${getui.LogoUrl}")
//    private String logoUrl;

    @Override
    public String pushToSingle(String msgTitle, String msgText, String transContent, String clientId) {
        String config = ConfigFactory.getConfig(Const.GETUI_CONFIG_KEY);
        JSONObject jsonObject = JSONObject.parseObject(config);
        /**
         * 个推-AppID
         */
        String appId = jsonObject.getString("appId");

        /**
         * 个推-AppKey
         */
        String appKey = jsonObject.getString("appKey");

        /**
         * 个推-AppSecret
         */
        String masterSecret = jsonObject.getString("masterSecret");

        /**
         * 个推-SDK地址
         */
        String sdkUrl = jsonObject.getString("sdkUrl");
        // 检查数据合法性
        if (StringUtils.isBlank(msgTitle) || StringUtils.isBlank(msgText) || StringUtils.isBlank(transContent) || StringUtils.isBlank(clientId)) {
            throw new IllegalArgumentException("the required params can't be empty");
        }

        // 推送给单个用户
        SingleMessage message = new SingleMessage();
        message.setOffline(true);
        message.setOfflineExpireTime(DEFAULT_OFFLINE_EXPIRE_TIME); //离线有效时间，单位为毫秒，可选
        message.setPushNetWorkType(DEFAULT_PUSH_NETWORK_TYPE); //网络环境：1为wifi，0为不限制网络环境
        message.setData(getDefaultNotificationTemplate(appId, appKey, msgTitle, msgText, transContent)); // 设置内容模板

        // 指定对象
        Target target = new Target();
        target.setClientId(clientId);
        target.setAppId(appId);
        // 返回taskId信息
        IGtPush gtPush = new IGtPush(sdkUrl, appKey, masterSecret);

        IPushResult result = gtPush.pushMessageToSingle(message, target);
        if (null != result) {
            Map<String, Object> response = result.getResponse();
            //System.out.println(response.toString());
            if (null != response && "ok".equals(response.get("result"))) {
                return response.get("taskId").toString();
            }
        }

        return null;
    }

    @Override
    public String pushToList(String msgTitle, String msgText, String transContent, List<String> clientIdList) {
        // 检查数据合法性
        if (StringUtils.isBlank(msgTitle) || StringUtils.isBlank(msgText) || StringUtils.isBlank(transContent) || null == clientIdList || 0 == clientIdList.size()) {
            throw new IllegalArgumentException("the required params can't be empty");
        }
        String config = ConfigFactory.getConfig(Const.GETUI_CONFIG_KEY);
        JSONObject jsonObject = JSONObject.parseObject(config);
        /**
         * 个推-AppID
         */
        String appId = jsonObject.getString("appId");

        /**
         * 个推-AppKey
         */
        String appKey = jsonObject.getString("appKey");

        /**
         * 个推-AppSecret
         */
        String masterSecret = jsonObject.getString("masterSecret");

        /**
         * 个推-SDK地址
         */
        String sdkUrl = jsonObject.getString("sdkUrl");
        // 推送给一个用户集合
        ListMessage message = new ListMessage();
        message.setOffline(true);
        message.setOfflineExpireTime(DEFAULT_OFFLINE_EXPIRE_TIME); //离线有效时间，单位为毫秒，可选
        message.setPushNetWorkType(DEFAULT_PUSH_NETWORK_TYPE); //网络环境：1为wifi，0为不限制网络环境
        message.setData(getDefaultNotificationTemplate(appId, appKey, msgTitle, msgText, transContent)); // 设置内容模板

        // 指定对象集合
        Target target;
        List<Target> targetList = new ArrayList<>();
        for (String clientId : clientIdList) {
            target = new Target();
            target.setAppId(appId);
            target.setClientId(clientId);
            targetList.add(target);
        }

        // 返回taskId信息
        IGtPush gtPush = new IGtPush(sdkUrl, appKey, masterSecret);
        IPushResult result = gtPush.pushMessageToList(gtPush.getContentId(message), targetList);
        /*if (null != result) {
            Map<String, Object> response = result.getResponse();
            //System.out.println(response.toString());
            if (null != response && "ok".equals(response.get("result"))) {
                return response.get("contentId").toString();
            }
        }*/
        if (result != null) {
            return result.getResponse().toString();
        } else {
            return null;
        }

    }

    @Override
    public String pushToAll(String msgTitle, String msgText, String transContent) {
        // 检查数据合法性
        if (StringUtils.isBlank(msgTitle) || StringUtils.isBlank(msgText) || StringUtils.isBlank(transContent)) {
            throw new IllegalArgumentException("the required params can't be empty");
        }
        String config = ConfigFactory.getConfig(Const.GETUI_CONFIG_KEY);
        JSONObject jsonObject = JSONObject.parseObject(config);
        /**
         * 个推-AppID
         */
        String appId = jsonObject.getString("appId");

        /**
         * 个推-AppKey
         */
        String appKey = jsonObject.getString("appKey");

        /**
         * 个推-AppSecret
         */
        String masterSecret = jsonObject.getString("masterSecret");

        /**
         * 个推-SDK地址
         */
        String sdkUrl = jsonObject.getString("sdkUrl");
        // 推送给所有APP用户
        AppMessage message = new AppMessage();
        message.setOffline(true);
        message.setOfflineExpireTime(DEFAULT_OFFLINE_EXPIRE_TIME); //离线有效时间，单位为毫秒，可选
        message.setPushNetWorkType(DEFAULT_PUSH_NETWORK_TYPE); //网络环境：1为wifi，0为不限制网络环境
        message.setData(getDefaultNotificationTemplate(appId, appKey, msgTitle, msgText, transContent)); // 设置内容模板

        // 推送给App的目标用户需要满足的条件
        List<String> appIdList = new ArrayList<>();
        appIdList.add(appId);
        message.setAppIdList(appIdList);

        // 返回taskId信息
        IGtPush gtPush = new IGtPush(sdkUrl, appKey, masterSecret);
        IPushResult result = gtPush.pushMessageToApp(message);
        if (null != result) {
            Map<String, Object> response = result.getResponse();
            //System.out.println(response.toString());
            if (null != response && "ok".equals(response.get("result"))) {
                return response.get("contentId").toString();
            }
        }

        return null;
    }

    @Override
    public String pushLinkToAll(String msgTitle, String msgText, String skipToUrl) {
        // 检查数据合法性
        if (StringUtils.isBlank(msgTitle) || StringUtils.isBlank(msgText) || StringUtils.isBlank(skipToUrl)) {
            throw new IllegalArgumentException("the required params can't be empty");
        }
        String config = ConfigFactory.getConfig(Const.GETUI_CONFIG_KEY);
        JSONObject jsonObject = JSONObject.parseObject(config);
        /**
         * 个推-AppID
         */
        String appId = jsonObject.getString("appId");

        /**
         * 个推-AppKey
         */
        String appKey = jsonObject.getString("appKey");

        /**
         * 个推-AppSecret
         */
        String masterSecret = jsonObject.getString("masterSecret");

        /**
         * 个推-SDK地址
         */
        String sdkUrl = jsonObject.getString("sdkUrl");
        // 推送给所有APP用户
        AppMessage message = new AppMessage();
        message.setOffline(true);
        message.setOfflineExpireTime(DEFAULT_OFFLINE_EXPIRE_TIME); //离线有效时间，单位为毫秒，可选
        message.setPushNetWorkType(DEFAULT_PUSH_NETWORK_TYPE); //网络环境：1为wifi，0为不限制网络环境
        message.setData(getDefaultLinkTemplate(appId, appKey, msgTitle, msgText, skipToUrl)); // 设置内容模板

        // 推送给App的目标用户需要满足的条件
        List<String> appIdList = new ArrayList<>();
        appIdList.add(appId);
        message.setAppIdList(appIdList);

        // 返回taskId信息
        IGtPush gtPush = new IGtPush(sdkUrl, appKey, masterSecret);
        IPushResult result = gtPush.pushMessageToApp(message);
        if (null != result) {
            Map<String, Object> response = result.getResponse();
            //System.out.println(response.toString());
            if (null != response && Const.ok.equals(response.get("result"))) {
                return response.get("contentId").toString();
            }
        }

        return null;
    }

    @Override
    public boolean cancelPushTask(String taskId) {
        String config = ConfigFactory.getConfig(Const.GETUI_CONFIG_KEY);
        JSONObject jsonObject = JSONObject.parseObject(config);
        String appId = jsonObject.getString("appId");
        String appKey = jsonObject.getString("appKey");
        String masterSecret = jsonObject.getString("masterSecret");
        String sdkUrl = jsonObject.getString("sdkUrl");
        IGtPush gtPush = new IGtPush(sdkUrl, appKey, masterSecret);
        return gtPush.cancelContentId(taskId);
    }

    /**
     * 获得默认透传消息模板
     *
     * @param appId        AppID
     * @param appKey       AppKey
     * @param msgTitle     消息标题
     * @param msgText      消息内容
     * @param transContent 透传内容
     * @return
     */
    public NotificationTemplate getDefaultNotificationTemplate(String appId, String appKey, String msgTitle, String msgText, String transContent) {
        // 初始化模板对象
        NotificationTemplate template = new NotificationTemplate();
        template.setAppId(appId); //设置AppID与AppKey
        template.setAppkey(appKey);

        // 定义推送风格
        Style0 style = new Style0();
        style.setTitle(msgTitle);  //设置通知栏标题与内容
        style.setText(msgText);
        style.setLogo("icon.png"); //配置通知栏图标
        //style.setLogoUrl(logoUrl); //配置通知栏网络图标
        style.setRing(true); //设置通知是否响铃，震动，或者可清除
        style.setVibrate(true);
        style.setClearable(true);
        template.setStyle(style);

        // 透传消息设置，1为强制启动应用，客户端接收到消息后就会立即启动应用；2为等待应用启动
        template.setTransmissionType(2);
        template.setTransmissionContent(transContent);
        return template;
    }

    @Override
    public String sendSingleIos(String msgTitle, String msgText, String transContent, String clientId) {
        String config = ConfigFactory.getConfig(Const.GETUI_CONFIG_KEY);
        JSONObject jsonObject = JSONObject.parseObject(config);
        /**
         * 个推-AppID
         */
        String appId = jsonObject.getString("appId");

        /**
         * 个推-AppKey
         */
        String appKey = jsonObject.getString("appKey");

        /**
         * 个推-AppSecret
         */
        String masterSecret = jsonObject.getString("masterSecret");

        /**
         * 个推-SDK地址
         */
        String sdkUrl = jsonObject.getString("sdkUrl");
        IGtPush push = new IGtPush(sdkUrl, appKey, masterSecret);

        SingleMessage message = new SingleMessage();

        TransmissionTemplate template = new TransmissionTemplate();
        template.setAppId(appId);
        template.setAppkey(appKey);
        template.setTransmissionContent(msgTitle);
        // 透传消息设置，1为强制启动应用，客户端接收到消息后就会立即启动应用；2为等待应用启动
        template.setTransmissionType(2);
        APNPayload payload = new APNPayload();
        //在已有数字基础上加1显示，设置为-1时，在已有数字上减1显示，设置为数字时，显示指定数字
        payload.setAutoBadge("+1");
        payload.setContentAvailable(1);
        //ios 12.0 以上可以使用 Dictionary 类型的 sound
        payload.setSound("default");
        payload.setCategory("$由客户端定义");
        //简单模式APNPayload.SimpleMsg
        //payload.setAlertMsg(new APNPayload.SimpleAlertMsg(""+map.get("content")));
        //字典模式使用下者
        APNPayload.DictionaryAlertMsg alertMsg = new APNPayload.DictionaryAlertMsg();
        alertMsg.setBody(msgText);
        alertMsg.setLocKey(transContent);
        alertMsg.setActionLocKey("ActionLockey");
        alertMsg.addLocArg("loc-args");
        alertMsg.setLaunchImage("launch-image");
        // IOS8.2以上版本支持
        alertMsg.setTitle(msgTitle);
        alertMsg.setTitleLocKey(msgTitle);
        alertMsg.addTitleLocArg("TitleLocArg");
        payload.setAlertMsg(alertMsg);
        template.setAPNInfo(payload);

        message.setData(template);

        message.setOffline(true);
        //离线有效时间，单位为毫秒，可选
        message.setOfflineExpireTime(24 * 1000 * 3600);
        // 可选，1为wifi，0为不限制网络环境。根据手机处于的网络情况，决定是否下发
        message.setPushNetWorkType(0);
        Target target = new Target();
        target.setAppId(appId);
        target.setClientId(clientId);
        IPushResult ret = null;
        try {
            ret = push.pushMessageToSingle(message, target);
        } catch (RequestException e) {
            e.printStackTrace();
            ret = push.pushMessageToSingle(message, target, e.getRequestId());
        }
        if (ret != null) {
            return ret.getResponse().toString();
        } else {
//			log.error("【IOS】个推，服务器异常");
            return null;
        }
    }

    /**
     * 获得默认链接消息模板
     *
     * @param appId     AppID
     * @param appKey    AppKey
     * @param msgTitle  消息标题
     * @param msgText   消息内容
     * @param skipToUrl 跳转地址
     * @return
     */
    private LinkTemplate getDefaultLinkTemplate(String appId, String appKey, String msgTitle, String msgText, String skipToUrl) {
        // 初始化模板对象
        LinkTemplate template = new LinkTemplate();
        template.setAppId(appId); //设置AppID与AppKey
        template.setAppkey(appKey);

        // 定义推送风格
        Style0 style = new Style0();
        template.setTitle(msgTitle); //设置通知栏标题与内容
        template.setText(msgText);
        template.setLogo("icon.png"); //配置通知栏图标
        //template.setLogoUrl(logoUrl); // 配置通知栏网络图标
        template.setIsRing(true); //设置通知是否响铃，震动，或者可清除
        template.setIsVibrate(true);
        template.setIsClearable(true);

        // 设置打开的网址地址
        template.setUrl(skipToUrl);
        return template;
    }


}
