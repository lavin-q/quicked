package com.quickd.message.util;

import com.quickd.core.common.Const;
import com.quickd.core.util.DBUtil;
import com.quickd.message.service.GetuiPushService;
import com.quickd.message.service.impl.GetuiPushServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * @project: quickd
 * @description: MessagePushUtils 个推消息推送
 * @author: caochaofeng
 * @create: 2019-10-06 19:39
 */
@Slf4j
@Component
public class GetuiPushUtils {
    @Autowired
    private GetuiPushService messagePushService;

    public void pushMessage(String content, String username) {
        try {
            if (username == null) {
                return;
            }
            String sql = "select  client_type,client_id from sys_user where del_flag='0' and username='" + username+ "'";
            List<Map<String, Object>> userList = DBUtil.query(sql);
            if (userList.size() == 0) {
                return;
            }
            Object clientId = userList.get(0).get("client_id");
            Object clinetType = userList.get(0).get("clinet_type");

            if (clientId == null || clinetType == null) {
                return;
            }

            String pushToSingle = null;
            if (Const.ANDROID.equalsIgnoreCase((String) clinetType)) {
                pushToSingle = messagePushService.pushToSingle("任务提示", content, content, (String) clientId);
            } else if (Const.IOS.equalsIgnoreCase((String) clinetType)) {
                pushToSingle = messagePushService.sendSingleIos("任务提示", content, content, (String) clientId);
            }
            if (null == pushToSingle) {
                log.error(username + "发送推送失败");
            }

        } catch (Exception e) {
            log.error(username + "发送推送失败", e);
        }
    }

    public static void main(String[] args) {
        GetuiPushServiceImpl push = new GetuiPushServiceImpl();
//        push.setAppId("m11vLZFJb36TCdtk1YFHw2");
//        push.setAppKey("pR5FqKSTKg6OlCI76wZf73");
//        push.setMasterSecret("foChGfDVYP8xP2mFE8j7U5");
//        push.setSdkUrl("http://sdk.open.api.igexin.com/apiex.htm");
        String pushToSingle = push.sendSingleIos("提示", "任务信息", "您有一个任务", "c1897836c66beeeb9c6462ff72f998ea");
        System.out.println(pushToSingle);
    }
}
