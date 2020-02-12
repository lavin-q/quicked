package com.quickd.oss.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.quickd.core.service.BaseService;
import com.quickd.oss.entity.Oss;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.OutputStream;

/**
 * <p>
 * 文件上传 服务类
 * </p>
 *
 * @author quickd
 * @since 2019-10-06
 */
public interface IOssService extends BaseService<Oss> {
}
