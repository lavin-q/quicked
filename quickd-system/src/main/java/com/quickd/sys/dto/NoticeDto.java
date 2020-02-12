package com.quickd.sys.dto;

import com.quickd.core.annotation.DictAno;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import com.quickd.core.dto.BaseDto;
/**
 * <p>
 * 系统通告表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "系统通告表", description="系统通告表")
public class NoticeDto extends BaseDto {

    @ApiModelProperty(value = "标题")
    private String titile;

    @ApiModelProperty(value = "内容")
    private String msgContent;

    /**
     * 开始时间
     */
    @ApiModelProperty(value = "开始时间")
    private Date startTime;

    /**
     * 结束时间
     */
    @ApiModelProperty(value = "结束时间")
    private Date endTime;

    /**
     * 发布人
     */
    @ApiModelProperty(value = "发布人")
    private String sender;

    /**
     * 优先级（L低，M中，H高）
     */
    @ApiModelProperty(value = "优先级（L低，M中，H高）")
    @DictAno(dicCode = "priority")
    private String priority;

    /**
     * 消息类型1:通知公告2:系统消息
     */
    @ApiModelProperty(value = "消息类型1:通知公告2:系统消息")
    @DictAno(dicCode = "msg_category")
    private String msgCategory;

    /**
     * 通告对象类型（USER:指定用户，ALL:全体用户）
     */
    @ApiModelProperty(value = "通告对象类型（USER:指定用户，ALL:全体用户）")
    @DictAno(dicCode = "msg_type")
    private String msgType;

    /**
     * 发布状态（0未发布，1已发布，2已撤销）
     */
    @ApiModelProperty(value = "发布状态（0未发布，1已发布，2已撤销）")
    @DictAno(dicCode = "send_status")
    private String sendStatus;

    /**
     * 发布时间
     */
    @ApiModelProperty(value = "发布时间")
    private Date sendTime;

    /**
     * 撤销时间
     */
    @ApiModelProperty(value = "撤销时间")
    private Date cancelTime;


    /**
     * 指定用户
     */
    @ApiModelProperty(value = "指定用户")
    private String userIds;

    /**
     * 创建人
     */
    @ApiModelProperty(value = "创建人")
    private String createBy;

    /**
     * 乐观锁
     */
    @ApiModelProperty(value = "乐观锁")
    private int version;

    /**
     * 更新人
     */
    @ApiModelProperty(value = "更新人")
    private String updateBy;

    /**
     * 更新时间
     */
    @ApiModelProperty(value = "更新时间")
    private Date updateTime;


}
