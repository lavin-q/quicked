

package com.quickd.message.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 邮件发送记录
 * 
 * @author Mark sunlightcs@gmail.com
 */
@Data
@EqualsAndHashCode(callSuper=false)
@TableName("sys_mail_log")
public class SysMailLogEntity extends BaseEntity {

	/**
	 * 邮件模板ID
	 */
	private String templateId;
	/**
	 * 发送者
	 */
	private String mailFrom;
	/**
	 * 收件人
	 */
	private String mailTo;
	/**
	 * 抄送者
	 */
	private String mailCc;
	/**
	 * 邮件主题
	 */
	private String subject;
	/**
	 * 邮件正文
	 */
	private String content;
	/**
	 * 发送状态  0：失败  1：成功
	 */
	private Integer status;

}