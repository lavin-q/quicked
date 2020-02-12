

package com.quickd.message.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quickd.message.entity.SysMailTemplateEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 邮件模板
 */
@Mapper
public interface SysMailTemplateDao extends BaseMapper<SysMailTemplateEntity> {
	
}
