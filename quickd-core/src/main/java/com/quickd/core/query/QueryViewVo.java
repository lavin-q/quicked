package com.quickd.core.query;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.io.Serializable;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;


/**
 * QueryViewVo data
 *
 * @author caochaofeng
 */
public class QueryViewVo<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    private Boolean _search;
    private Integer rows;//行数
    private Integer page = 1;//第几页
    private String sidx;//排序字段
    private String sord;
    private String order;
    private Integer limit = 10;
    private String filters;
    private GridQueryFilterVo gridQueryFilterVo = new GridQueryFilterVo();

    public Boolean get_search() {
        return this._search;
    }

    public void set_search(Boolean _search) {
        this._search = _search;
    }

    public Integer getRows() {
        return this.rows;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public Integer getPage() {
        return this.page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public String getSidx() {
        return this.sidx;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSord() {
        return this.sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

    public String getFilters() {
        return this.filters;
    }


    public void setFilters(String filters) throws IOException {
        if (StringUtils.isNotEmpty(filters)) {
            filters = URLDecoder.decode(filters, "utf-8");
            this.gridQueryFilterVo = JSON.parseObject(filters, GridQueryFilterVo.class);
        }
        this.filters = filters;
    }

    public GridQueryFilterVo getGridQueryFilterVo() {
        return this.gridQueryFilterVo;
    }

    public void setGridQueryFilterVo(GridQueryFilterVo gridQueryFilterVo) {
        this.gridQueryFilterVo = gridQueryFilterVo;
    }

    public IPage<T> getPageUtil() {
        if (limit > 1000) {
            limit = 1000;
        }

        //分页对象
        Page<T> pageVo = new Page<>(page, limit);
        String sidx = getSidx();
        String order = getOrder();
        List<OrderItem> orderItemList = new ArrayList<>();
        // 排序
        if (StringUtils.isNotBlank(sidx) && StringUtils.isNotBlank(order)) {
            OrderItem orderItem = new OrderItem();
            orderItem.setColumn(sidx);
            if ("ASC".equalsIgnoreCase(order)) {
                orderItem.setAsc(true);
            } else {
                orderItem.setAsc(false);
            }
            orderItemList.add(orderItem);
        }
        pageVo.setOrders(orderItemList);
        return pageVo;
    }

    public QueryWrapper<T> getWrapper() {
        QueryWrapper<T> wrapper = new QueryWrapper<T>();
        List<QueryFilter> rules = gridQueryFilterVo.getRules();
//        String groupOp = gridQueryFilterVo.getGroupOp();
        for (QueryFilter queryFilter : rules) {
//            switch (groupOp) {
//                case "AND":
//                    wrapper.and();
//                    break;
//                case "OR":
//                    wrapper.or();
//                    break;
//                default:
//                    break;
//            }
            queryFilter.setCriteria(wrapper);
        }
        return wrapper;
    }
}
