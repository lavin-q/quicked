package com.quickd.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.quickd.sys.entity.Config;
import com.quickd.sys.mapper.ConfigMapper;
import com.quickd.sys.service.IConfigService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 参数配置表 服务实现类
 * </p>
 *
 * @author quickd
 * @since 2019-09-29
 */
@Service
public class ConfigServiceImpl extends ServiceImpl<ConfigMapper, Config> implements IConfigService {
    @Override
    public Config getSysConfigByKey(String key) {
        Config config = this.getOne(new QueryWrapper<Config>().lambda().eq(Config::getConfigKey, key).eq(Config::getStatus, true));
        return config;
    }
}
