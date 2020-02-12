package com.quickd.gen.service.impl;

import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.gen.entity.GenProject;
import com.quickd.core.service.BaseService;
import com.quickd.gen.mapper.GenProjectMapper;
import com.quickd.gen.service.IGenProjectService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 项目生成表 服务实现类
 * </p>
 *
 * @author quickd
 * @since 2019-08-29
 */
@Service
public class GenProjectServiceImpl extends BaseServiceImpl<GenProjectMapper, GenProject> implements IGenProjectService {

}
