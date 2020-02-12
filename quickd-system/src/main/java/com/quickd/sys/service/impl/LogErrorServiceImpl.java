package com.quickd.sys.service.impl;

import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.sys.entity.LogError;
import com.quickd.sys.mapper.LogErrorMapper;
import com.quickd.sys.service.ILogErrorService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 异常日志 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Service
public class LogErrorServiceImpl extends BaseServiceImpl<LogErrorMapper, LogError> implements ILogErrorService {

}
