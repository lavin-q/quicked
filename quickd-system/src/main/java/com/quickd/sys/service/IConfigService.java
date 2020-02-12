package com.quickd.sys.service;

import com.quickd.sys.entity.Config;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 参数配置表 服务类
 * </p>
 *
 * @author quickd
 * @since 2019-09-29
 */
public interface IConfigService extends IService<Config> {
    /**
     * 根据key获取当前使用系统配置
     *
     * @param key 配置key
     * @return
     */
    Config getSysConfigByKey(String key);
}
