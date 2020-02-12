package com.quickd.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.core.util.ConvertUtils;
import com.quickd.core.util.TreeUtils;
import com.quickd.core.util.YouBianCodeUtil;
import com.quickd.sys.dto.DeptTreeDto;
import com.quickd.sys.entity.Dept;
import com.quickd.sys.mapper.DeptMapper;
import com.quickd.sys.service.IDeptService;
import io.jsonwebtoken.lang.Collections;
import io.netty.util.internal.StringUtil;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 组织机构表 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Service
public class DeptServiceImpl extends BaseServiceImpl<DeptMapper, Dept> implements IDeptService {


    /**
     * 查询部门树
     * @return
     */
    @Override
    public List<DeptTreeDto> queryIdTree() {
        List<Dept> deptList =  this.baseMapper.selectList(new QueryWrapper<Dept>());
        List<DeptTreeDto> departTree = ConvertUtils.sourceToTarget(deptList, DeptTreeDto.class);
        return TreeUtils.build(departTree);
    }

    @Override
    public void saveDeptData(Dept dept) {

        if (dept != null) {
            if (dept.getPid() == null) {
                dept.setPid("");
            }
            // 先判断该对象有无父级ID,有则意味着不是最高级,否则意味着是最高级
            // 获取父级ID
            String parentId = dept.getPid();
            String[] codeArray = generateOrgCode(parentId);
            dept.setOrgCode(codeArray[0]);
            String orgType = codeArray[1];
            dept.setOrgType(String.valueOf(orgType));
            baseMapper.insert(dept);
        }
    }

    /**
     * saveDepartData 的调用方法,生成部门编码和部门类型
     *
     * @param parentId
     * @return
     */
    private String[] generateOrgCode(String parentId) {
        //update-begin--Author:Steve  Date:20190201 for：组织机构添加数据代码调整
        LambdaQueryWrapper<Dept> query = new LambdaQueryWrapper<Dept>();
        LambdaQueryWrapper<Dept> query1 = new LambdaQueryWrapper<Dept>();
        String[] strArray = new String[2];
        // 创建一个List集合,存储查询返回的所有SysDepart对象
        List<Dept> departList = new ArrayList<>();
        // 定义新编码字符串
        String newOrgCode = "";
        // 定义旧编码字符串
        String oldOrgCode = "";
        // 定义部门类型
        String orgType = "";
        // 如果是最高级,则查询出同级的org_code, 调用工具类生成编码并返回                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
        if (StringUtil.isNullOrEmpty(parentId)) {
            // 线判断数据库中的表是否为空,空则直接返回初始编码
            query1.eq(Dept::getPid, "");
            query1.orderByDesc(Dept::getOrgCode);
            departList = this.list(query1);
            if(departList == null || departList.size() == 0) {
                strArray[0] = YouBianCodeUtil.getNextYouBianCode(null);
                strArray[1] = "1";
                return strArray;
            }else {
                Dept depart = departList.get(0);
                oldOrgCode = depart.getOrgCode();
                orgType = depart.getOrgType();
                newOrgCode = YouBianCodeUtil.getNextYouBianCode(oldOrgCode);
            }
        } else { // 反之则查询出所有同级的部门,获取结果后有两种情况,有同级和没有同级
            // 封装查询同级的条件
            query.eq(Dept::getPid, parentId);
            // 降序排序
            query.orderByDesc(Dept::getOrgCode);
            // 查询出同级部门的集合
            List<Dept> parentList = this.list(query);
            // 查询出父级部门
            Dept depart = (Dept)this.getById(parentId);
            // 获取父级部门的Code
            String parentCode = depart.getOrgCode();
            // 根据父级部门类型算出当前部门的类型
            orgType = String.valueOf(Integer.valueOf(depart.getOrgType()) + 1);
            // 处理同级部门为null的情况
            if (parentList == null || parentList.size() == 0) {
                // 直接生成当前的部门编码并返回
                newOrgCode = YouBianCodeUtil.getSubYouBianCode(parentCode, null);
            } else { //处理有同级部门的情况
                // 获取同级部门的编码,利用工具类
                String subCode = parentList.get(0).getOrgCode();
                // 返回生成的当前部门编码
                newOrgCode = YouBianCodeUtil.getSubYouBianCode(parentCode, subCode);
            }
        }
        // 返回最终封装了部门编码和部门类型的数组
        strArray[0] = newOrgCode;
        strArray[1] = orgType;
        return strArray;
        //update-end--Author:Steve  Date:20190201 for：组织机构添加数据代码调整
    }

    @Override
    public Dept getDeptById(String id) {
        QueryWrapper<Dept> queryWrapper = new QueryWrapper();
        queryWrapper.lambda().eq(Dept::getId, id);
        List<Dept> deptList = baseMapper.selectList(queryWrapper);
        if (Collections.isEmpty(deptList)) {
            return null;
        }
        return deptList.get(0);
    }
}
