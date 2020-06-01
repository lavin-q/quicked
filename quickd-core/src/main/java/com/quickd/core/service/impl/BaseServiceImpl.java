/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package com.quickd.core.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.quickd.core.query.QueryViewVo;
import com.quickd.core.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;

/**
 * 基础服务类，所有Service都要继承
 *
 * @author Mark sunlightcs@gmail.com
 */
public abstract class BaseServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl implements BaseService<T> {

    @Resource
    protected M baseDao;

    @Override
    public IPage<T> queryPage(QueryViewVo<T> queryViewVo) {
        IPage<T> page = baseDao.selectPage(queryViewVo.getPageUtil(), queryViewVo.getWrapper());
        return page;
    }

}