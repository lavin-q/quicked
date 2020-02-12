package com.quickd.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.util.Date;

import com.quickd.core.entity.BaseEntity;
import com.quickd.core.validator.group.AddGroup;
import com.quickd.core.validator.group.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 参数配置表
 * </p>
 *
 * @author quickd
 * @since 2019-09-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_config")
public class Config extends BaseEntity {

    /**
     * 名称
     */
    private String configName;

    /**
     * 配置key
     */
    @NotBlank(message = "配置key不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String configKey;

    /**
     * 配置value
     */
    @NotBlank(message = "配置value不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String configValue;

    /**
     * 状态
     */
    private Boolean status;




}
