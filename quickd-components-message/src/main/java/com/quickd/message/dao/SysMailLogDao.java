

package com.quickd.message.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quickd.message.entity.SysMailLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 邮件发送记录
 * 
 */
@Mapper
public interface SysMailLogDao extends BaseMapper<SysMailLogEntity> {
	
}
