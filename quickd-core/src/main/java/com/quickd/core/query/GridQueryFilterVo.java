package com.quickd.core.query;

import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * {"groupOp":"AND","rules":[{"field":"Country.Code","op":"eq","data":"AGO"}]}
 * {"groupOp":"OR","rules":[{"field":"a","op":"eq","data":"1"},{"field":"b","op":"eq","data":"2"}],"groups":[]}
 */
public class GridQueryFilterVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private String groupOp;
    private List<QueryFilter> rules = new ArrayList<>();

    public String getGroupOp() {
        return this.groupOp;
    }

    public void setGroupOp(String groupOp) {
        this.groupOp = groupOp;
    }

    public List<QueryFilter> getRules() {
        return this.rules;
    }

    public void setRules(List<QueryFilter> rules) {
        for (int i = 0; i < rules.size(); i++) {
            if (StringUtils.isEmpty(rules.get(i).getData().toString())) {
                rules.remove(i);
            }
        }
        this.rules = rules;
    }

}
