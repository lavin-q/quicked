package com.quickd.gen.service;

import com.quickd.core.service.BaseService;
import com.quickd.gen.entity.GenTableColumn;

import java.util.List;

/**
 * <p>
 * 业务表字段 服务类
 * </p>
 *
 * @author quickd
 * @since 2019-08-27
 */
public interface IGenTableColumnService extends BaseService<GenTableColumn> {

    /**
     * 根据表名查询表的列信息
     * @param tableName  表
     * @return
     */
    List<GenTableColumn> queryGenTableColumn(String tableName);

}
