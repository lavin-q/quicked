package com.quickd.message.dingding;
import com.alibaba.fastjson.JSON;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
/**
 * @project: quickd
 * @description: RebootUtil
 * @author: caochaofeng
 * @create: 2019-10-06 20:36
 */
public class RebootUtil {
    /**
     * 组装 发送的信息
     *
     * @param isAt       是否需要 @所有人
     * @param msgContent 要发送信息的主体
     * @param telList    要 @人的电话号码,如果@单独的几个人，就传一个空list，而不是 null
     * @return
     */
    public static String setMessage(boolean isAt, String msgContent, List<String> telList) {

        TextRebootModel model = new TextRebootModel();
        AtMobiles atMobiles = new AtMobiles();
        atMobiles.setIsAtAll(isAt);
        atMobiles.setAtMobiles(telList);

        ContentModel contentModel = new ContentModel();
        contentModel.setContent(msgContent);

        model.setAt(atMobiles);
        model.setText(contentModel);

        String toMsg = JSON.toJSONString(model);

        return toMsg;
    }

    /**
     * 组装 发送的信息
     *
     * @param isAt       是否需要 @所有人
     * @param title      标题
     * @param msgContent 要发送信息的主体
     * @param telList    要 @人的电话号码,如果@单独的几个人，就传一个空list，而不是 null
     * @return
     */
    public static String setMarkDown(boolean isAt, String title, String msgContent, List<String> telList) {

        MarkDownRebootModel model = new MarkDownRebootModel();
        AtMobiles atMobiles = new AtMobiles();
        atMobiles.setIsAtAll(isAt);
        atMobiles.setAtMobiles(telList);

        MarkDownModel markDownModel = new MarkDownModel();
        markDownModel.setTitle(title);
        markDownModel.setText(msgContent);

        model.setAt(atMobiles);
        model.setMarkdown(markDownModel);

        String message = JSON.toJSONString(model);

        return message;
    }

    /**
     * post 请求，发送给哪一个机器人
     *
     * @param reboot  机器人的token
     * @param message 发送的消息
     * @return result
     */
    public static String sendPost(String reboot, String message) {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost httppost = new HttpPost(reboot);
        httppost.addHeader("Content-Type", "application/json; charset=utf-8");

        String textMsg = message;
        StringEntity se = new StringEntity(textMsg, "utf-8");
        httppost.setEntity(se);
        String result = null;
        HttpResponse response = null;
        try {
            response = httpclient.execute(httppost);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                result = EntityUtils.toString(response.getEntity(), "utf-8");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                httpclient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return result;
    }


    /**
     * 查错机器人
     * @param message 封装的消息
     * @return
     * @throws Exception
     */
    public static String sendErrorReboot(String message) throws Exception {
        return sendPost("https://oapi.dingtalk.com/robot/send?access_token=d60bc7b210bc41e1ff4990e7056f5b242faa00304b269ab1a05e1bb29533350a", message);
    }

    public static void send(String content){
        String time = LocalDateTime.now().toString();
        String text2 = RebootUtil.setMarkDown(true, "消息提醒", content+time, Arrays.asList(""));
        try {
            RebootUtil.sendErrorReboot(text2);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


