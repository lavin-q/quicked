package com.quickd.sys.service;

import com.quickd.core.service.BaseService;
import com.quickd.sys.dto.DeptTreeDto;
import com.quickd.sys.entity.Dept;

import java.util.List;

/**
 * <p>
 * 组织机构表 服务类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
public interface IDeptService extends BaseService<Dept> {

    List<DeptTreeDto> queryIdTree();

    /**
     * 保存部门信息
     * @param dept
     * @return
     */
    void saveDeptData(Dept dept);

    public Dept getDeptById (String id);
}
