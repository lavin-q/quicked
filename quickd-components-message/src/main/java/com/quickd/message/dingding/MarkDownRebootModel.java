package com.quickd.message.dingding;
import lombok.Data;
/**
 * @project: quickd
 * @description: MarkDownRebootModel
 * @author: caochaofeng
 * @create: 2019-10-06 20:38
 */


@Data
public class MarkDownRebootModel {
    /**
     * 此消息类型为固定markdown
     */
    public String msgtype = "markdown";

    public MarkDownModel markdown;

    public AtMobiles at;
}
