package com.quickd.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.util.Date;

import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 用户通告阅读标记表
 * </p>
 *
 * @author quickd
 * @since 2019-09-26
 */
@Setter
@Getter
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_notice_read")
public class NoticeRead extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 通告ID
     */
    private String anntId;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 阅读状态（0未读，1已读）
     */
    private String readFlag;

    /**
     * 阅读时间
     */
    private Date readTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 乐观锁
     */
    private Integer version;


}
