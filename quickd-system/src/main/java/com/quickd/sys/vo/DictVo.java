package com.quickd.sys.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @project: jeedcp
 * @description: ${description}
 * @author: caochaofeng
 * @create: 2019-08-16 21:35
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class DictVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 字典value
     */
    private String value;
    /**
     * 字典文本
     */
    private String label;

    /**
     * 特殊用途： JgEditableTable
     * @return
     */
    public String getTitle() {
        return this.label;
    }
}
