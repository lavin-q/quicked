package com.quickd.sys.service.impl;

import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.sys.entity.Job;
import com.quickd.sys.mapper.JobMapper;
import com.quickd.sys.service.IJobService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author quickd
 * @since 2019-10-01
 */
@Service
public class JobServiceImpl extends BaseServiceImpl<JobMapper, Job> implements IJobService {

}
