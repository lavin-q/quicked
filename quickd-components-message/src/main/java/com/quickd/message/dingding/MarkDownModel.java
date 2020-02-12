package com.quickd.message.dingding;
import lombok.Data;
/**
 * @project: quickd
 * @description: MarkDownModel
 * @author: caochaofeng
 * @create: 2019-10-06 20:38
 */


@Data
public class MarkDownModel {
    /**
     * 首屏会话透出的展示内容
     */
    private String title;

    /**
     * markdown格式的消息
     */
    private String text;
}
