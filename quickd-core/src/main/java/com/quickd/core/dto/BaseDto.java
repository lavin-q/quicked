package com.quickd.core.dto;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.quickd.core.validator.group.UpdateGroup;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * @project: jeedcp-example
 * @description: ${description}
 * @author: caochaofeng
 * @create: 2019-08-23 22:51
 */
@Data
public class BaseDto  implements Serializable {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "id")
    @NotNull(message="id不能为空", groups = UpdateGroup.class)
    private String id;

    @TableField(value="create_time",fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
}
