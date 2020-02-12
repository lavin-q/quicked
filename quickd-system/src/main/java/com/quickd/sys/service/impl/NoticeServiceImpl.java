package com.quickd.sys.service.impl;

import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.sys.dto.NoticeDto;
import com.quickd.sys.entity.Notice;
import com.quickd.sys.mapper.NoticeMapper;
import com.quickd.sys.service.INoticeService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统通告表 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Service
public class NoticeServiceImpl extends BaseServiceImpl<NoticeMapper, Notice> implements INoticeService {

}
