package com.quickd.sys.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quickd.sys.dto.NoticeReadDto;
import com.quickd.sys.entity.NoticeRead;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * 用户通告阅读标记表 Mapper 接口
 * </p>
 *
 * @author quickd
 * @since 2019-09-26
 */
@Mapper
public interface NoticeReadMapper extends BaseMapper<NoticeRead> {


    /**
     * @功能：获取我的消息
     * @param noticeSendDto
     * @param page
     * @return
     */
     List<NoticeReadDto> getMyNoticeSendList(Page<NoticeReadDto> page, NoticeReadDto noticeSendDto);
}
