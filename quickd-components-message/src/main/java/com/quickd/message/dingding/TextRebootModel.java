package com.quickd.message.dingding;

import lombok.Data;


/**
 * @project: quickd
 * @description: TextRebootModel
 * @author: caochaofeng
 * @create: 2019-10-06 20:37
 */
@Data
public class TextRebootModel {
    /**
     * 此消息类型为固定text
     */
    public String msgtype = "text";

    public ContentModel text;

    public AtMobiles at;
}
