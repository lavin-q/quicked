/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */

package com.quickd.gen.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.quickd.core.common.JsonResult;
import com.quickd.core.exception.BusinessException;
import com.quickd.core.util.DBUtil;
import com.quickd.gen.dto.DoGenerate;
import com.quickd.gen.entity.GenTableColumn;
import com.quickd.gen.mapper.TableMapper;
import com.quickd.gen.service.IGenTableColumnService;
import com.quickd.gen.utils.GenUtils;
import org.apache.commons.configuration.Configuration;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 代码生成器
 *
 * @author Mark sunlightcs@gmail.com
 */
@Service
public class SysGeneratorService {


    @Autowired
    private IGenTableColumnService genTableColumnService;
    @Autowired
    private TableMapper tableMapper;


    @Transactional
    public void generatorCode(DoGenerate doGenerate ) {

        String tableName =doGenerate.getTableName();
        String moduleName = tableName;
        String subModuleName = tableName;
        if (tableName.contains("_")) {
            moduleName = tableName.split("_")[0];
            String tablePrefix = moduleName + "_";
            subModuleName = tableName.replaceFirst(tablePrefix, "");
        }
        String templateName =doGenerate.getTemplateName();
        String genPath =doGenerate.getGenPath();
        String pathName =  moduleName + "/" + subModuleName;
        String urlPath =  moduleName + "_" + subModuleName;
        //先删除，后插入
        String sql = "select id from sys_menu where name='"+doGenerate.getName()+"'";
        try {
            List<Map<String, Object>> list =   DBUtil.query(sql);
            if(list.size()>0){
                String pid = (String)list.get(0).get("id");
                String deletePMenuSQL = "delete from sys_menu where id='"+pid+"'";
                String deleteSubMenuSQL = "delete from sys_menu where pid='"+pid+"'";
                DBUtil.executeUpdate(deletePMenuSQL);
                DBUtil.executeUpdate(deleteSubMenuSQL);
            }
        } catch (Exception e) {
           throw   new BusinessException("刪除菜单失败");
        }
        //-- 菜单初始SQL
        String pId = IdWorker.getIdStr();
        String menuSQL = " INSERT INTO `sys_menu`(`id`, `pid`, `name`, `url`, `component`, `redirect`, `type`, `permissions`, `perms_type`, `sort`, `always_show`, `icon`, `is_route`, `is_leaf`, `keep_alive`, `hidden`, " +
                "`remarks`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `version`) VALUES ("+ pId +", "+doGenerate.getPid()+", '"+doGenerate.getName()+"','"
                +urlPath+"', 'modules/"+pathName+"', NULL, 1, NULL, '0', 15, NULL, '"+doGenerate.getIcon()+"', 1, NULL, NULL, 0, NULL, 'system', now(), 'system', now(), '0', 0, NULL, 1);";
        String permissionSQL1 = "   INSERT INTO `sys_menu`(`id`, `pid`, `name`, `url`, `component`, `redirect`, `type`, `permissions`, `perms_type`, `sort`, `always_show`, `icon`, `is_route`, " +
                "`is_leaf`, `keep_alive`, `hidden`, `remarks`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `version`) VALUES ("+ IdWorker.getIdStr()+", "+pId+", '查看'," +
                " NULL, NULL, NULL, 2," +
                " '"+moduleName+":"+subModuleName+":page,"+moduleName+":"+subModuleName+":info', '0', 1, NULL, NULL, 1, NULL, NULL, 0, NULL, 'system', now(), 'system', now(), '0', 0, NULL, 1);";
        String permissionSQL2 = "  INSERT INTO `sys_menu`(`id`, `pid`, `name`, `url`, `component`, `redirect`, `type`, `permissions`, `perms_type`, `sort`, `always_show`, `icon`, " +
                "`is_route`, `is_leaf`, `keep_alive`, `hidden`, `remarks`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `version`) VALUES ("+ IdWorker.getIdStr()+", "+pId
                +", '新增', NULL, NULL, NULL, 2, " +
                "'"+moduleName+":"+subModuleName+":save', '0', 1, NULL, NULL, 1, NULL, NULL, 0, NULL, 'system', now(), 'system', now(),  '0', 0, NULL, 1);";
        String permissionSQL3 = "   INSERT INTO `sys_menu`(`id`, `pid`, `name`, `url`, `component`, `redirect`, `type`, `permissions`, `perms_type`, `sort`, `always_show`, `icon`, `is_route`, `is_leaf`, `keep_alive`, `hidden`, `remarks`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `version`) VALUES ("+
                IdWorker.getIdStr()+", "+pId+", '修改', NULL, NULL, NULL, 2," +
                " '"+moduleName+":"+subModuleName+":update', '0', 1, NULL, NULL, 1, NULL, NULL, 0, NULL, 'system', now(), 'system', now(),  '0', 0, NULL, 1);";
        String permissionSQL4 = "   INSERT INTO `sys_menu`(`id`, `pid`, `name`, `url`, `component`, `redirect`, `type`, `permissions`, `perms_type`, `sort`, `always_show`, `icon`, `is_route`, `is_leaf`, `keep_alive`, `hidden`, `remarks`, `create_by`, " +
                "`create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `version`) VALUES ("+ IdWorker.getIdStr()+", "+pId+", '删除', NULL, NULL, NULL, 2," +
                " '"+moduleName+":"+subModuleName+":delete', '0', 1, NULL, NULL, 1, NULL, NULL, 0, NULL, 'system', now(), 'system', now(),  '0', 0, NULL, 1);";
        String permissionSQL5 = "   INSERT INTO `sys_menu`(`id`, `pid`, `name`, `url`, `component`, `redirect`, `type`, `permissions`, `perms_type`, `sort`, `always_show`, `icon`, `is_route`, `is_leaf`, `keep_alive`, `hidden`, `remarks`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `version`) VALUES ("+
                IdWorker.getIdStr()+", "+pId+", '导出', NULL, NULL, NULL, 2, " +
                "'"+moduleName+":"+subModuleName+":export', '0', 1, NULL, NULL, 1, NULL, NULL, 0, NULL, 'system', now(), 'system', now(),  '0', 0, NULL, 1);";

        try {
            DBUtil.executeUpdate(menuSQL);
            DBUtil.executeUpdate(permissionSQL1);
            DBUtil.executeUpdate(permissionSQL2);
            DBUtil.executeUpdate(permissionSQL3);
            DBUtil.executeUpdate(permissionSQL4);
            DBUtil.executeUpdate(permissionSQL5);
        } catch (Exception e) {
            throw   new BusinessException("新增菜单失败");
        }
        //查询列信息
        List<GenTableColumn> columns = genTableColumnService.list(new QueryWrapper<GenTableColumn>().eq("table_name", tableName));
        if (columns.size() == 0) {
            throw new BusinessException("未找到需要生成的表");
        }
        List<Map> list = tableMapper.queryTable(tableName);

        if (list.size() == 0) {
            throw new BusinessException("未找到需要生成的表");
        }
        GenUtils.generatorCode((String) list.get(0).get("TABLE_COMMENT"), columns, templateName, genPath);
    }
}
