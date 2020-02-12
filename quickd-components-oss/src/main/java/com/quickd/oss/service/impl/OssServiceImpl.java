package com.quickd.oss.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.oss.entity.Oss;
import com.quickd.oss.mapper.OssMapper;
import com.quickd.oss.service.IOssService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文件上传 服务实现类
 * </p>
 *
 * @author quickd
 * @since 2019-10-06
 */
@Service
public class OssServiceImpl extends BaseServiceImpl<OssMapper, Oss> implements IOssService {

}
