package com.quickd.gen.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.gen.entity.GenTableColumn;
import com.quickd.gen.mapper.GenTableColumnMapper;
import com.quickd.gen.mapper.TableMapper;
import com.quickd.gen.service.IGenTableColumnService;
import com.quickd.gen.utils.GenUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 业务表字段 服务实现类
 * </p>
 *
 * @author quickd
 * @since 2019-08-27
 */
@Service
public class GenTableColumnServiceImpl extends BaseServiceImpl<GenTableColumnMapper, GenTableColumn>
        implements IGenTableColumnService {
    @Autowired
    private TableMapper tableMapper;

    @Override
    public List<GenTableColumn> queryGenTableColumn(String tableName) {
        List<Map> tableColumn = tableMapper.listTableColumn(tableName);
        List<GenTableColumn> result = new ArrayList<>();
        List<GenTableColumn> genColumns = baseMapper.selectList(new QueryWrapper<GenTableColumn>().eq("table_name", tableName));
        if (genColumns.size() > 0) {
            result = genColumns;
        } else {
            int i=1;
            for (Map map : tableColumn) {
                GenTableColumn genTableColumn = new GenTableColumn();
                genTableColumn.setTableName((String) map.get("TABLE_NAME"));
                genTableColumn.setColName((String) map.get("COLUMN_NAME"));
                genTableColumn.setColType((String) map.get("DATA_TYPE"));
                genTableColumn.setFieldLabel((String) map.get("COLUMN_COMMENT"));
                genTableColumn.setSort(i);
                if (genTableColumn.getColName().equals("id")) {
                    genTableColumn.setPrimaryKey(true);
                    genTableColumn.setIsNotNull(false);
                } else {
                    genTableColumn.setPrimaryKey(false);
                }
                if ("YES".equals(map.get("IS_NULLABLE"))) {
                    genTableColumn.setIsNotNull(false);
                }else{
                    if (!genTableColumn.getColName().equals("id")) {
                        genTableColumn.setIsNotNull(true);
                        genTableColumn.setIsEdit(true);
                        genTableColumn.setIsList(true);
                        genTableColumn.setIsInsert(true);
                        genTableColumn.setIsQuery(true);
                    }
                }
                if(i<5&&i>1){
                    if(i==2) {
                        genTableColumn.setQueryType("cn");
                    }
                    genTableColumn.setIsEdit(true);
                    genTableColumn.setIsList(true);
                    genTableColumn.setIsInsert(true);
                    genTableColumn.setFormType("input");
                }
                //列名转换成Java属性名
                String attrName = GenUtils.columnToJava(genTableColumn.getColName());
                genTableColumn.setAttrName(attrName);
                genTableColumn.setAttr(StringUtils.uncapitalize(attrName));
                //列的数据类型，转换成Java类型
                String attrType = GenUtils.getConfig().getString(String.valueOf(map.get("DATA_TYPE")), "unknowType");
                genTableColumn.setAttrType(attrType);

                if ( !genTableColumn.getColName().equalsIgnoreCase("update_time")
                        && !genTableColumn.getColName().equalsIgnoreCase("update_by")
                        && !genTableColumn.getColName().equalsIgnoreCase("create_by")
                        && !genTableColumn.getColName().equalsIgnoreCase("del_flag")
                        && !genTableColumn.getColName().equalsIgnoreCase("version")) {
                    if("Date".equals(genTableColumn.getAttrType())){
                        genTableColumn.setFormType("dateselect");
                    }
                    result.add(genTableColumn);
                }
                i++;

            }
        }
        return result;
    }


}
