package com.quickd.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;

import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统通告表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_notice")
public class Notice extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 标题
     */
    private String titile;

    /**
     * 内容
     */
    private String msgContent;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 发布人
     */
    private String sender;

    /**
     * 优先级（L低，M中，H高）
     */
    private String priority;

    /**
     * 消息类型1:通知公告2:系统消息
     */
    private String msgCategory;

    /**
     * 通告对象类型（USER:指定用户，ALL:全体用户）
     */
    private String msgType;

    /**
     * 发布状态（0未发布，1已发布，2已撤销）
     */
    private String sendStatus;

    /**
     * 发布时间
     */
    private Date sendTime;

    /**
     * 撤销时间
     */
    private Date cancelTime;


    /**
     * 指定用户
     */
    private String userIds;


}
