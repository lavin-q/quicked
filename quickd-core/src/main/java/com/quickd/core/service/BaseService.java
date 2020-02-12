package com.quickd.core.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.quickd.core.query.QueryViewVo;

/**
 * @project: jeedcp
 * @description: ${description}
 * @author: caochaofeng
 * @create: 2019-08-16 11:11
 */
public interface BaseService<T> extends IService{

    IPage<T> queryPage(QueryViewVo<T> queryViewVo);
}
