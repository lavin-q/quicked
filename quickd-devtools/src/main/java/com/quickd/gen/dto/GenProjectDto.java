package com.quickd.gen.dto;

import com.quickd.core.dto.BaseDto;
import com.quickd.core.validator.group.DefaultGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import java.util.Date;

/**
 * <p>
 * 项目生成表
 * </p>
 *
 * @author quickd
 * @since 2019-08-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@ApiModel(value = "项目生成表")
public class GenProjectDto extends BaseDto {

    /**
     * 项目名称
     */
    @ApiModelProperty(value = "项目名称")
    @NotBlank(message="项目名称不能为空", groups = DefaultGroup.class)
    private String project;

    /**
     * 项目中文标题
     */
    @ApiModelProperty(value = "项目中文标题")
    @NotBlank(message="项目中文标题不能为空", groups = DefaultGroup.class)
    private String sysName;
    /**
     * 项目分组
     */
    @ApiModelProperty(value = "项目分组")
    @NotBlank(message="项目分组不能为空", groups = DefaultGroup.class)
    private String groupName;

    /**
     * 项目包名
     */
    @ApiModelProperty(value = "项目包名")

    private String packageName;

    /**
     * 项目版权
     */
    @ApiModelProperty(value = "项目版权")
    private String copyright;

    /**
     * 项目作者
     */
    @ApiModelProperty(value = "项目作者")
    private String author;

    /**
     * 数据库地址
     */
    @ApiModelProperty(value = "mysql数据库地址")
    @NotBlank(message="mysql数据库地址不能为空", groups = DefaultGroup.class)
    private String dbUrl;

    /**
     * 数据库端口
     */
    @ApiModelProperty(value = "数据库端口")
    @NotBlank(message="mysql数据库端口不能为空", groups = DefaultGroup.class)
    private String dbPort;

    /**
     * 数据库名
     */
    @ApiModelProperty(value = "数据库名")
    @NotBlank(message="数据库名不能为空", groups = DefaultGroup.class)
    private String dbName;

    /**
     * 数据库用户名
     */
    @ApiModelProperty(value = "数据库用户名")
    @NotBlank(message="数据库用户名不能为空", groups = DefaultGroup.class)
    private String dbUsername;

    /**
     * 数据库密码
     */
    @ApiModelProperty(value = "数据库密码")
    @NotBlank(message="数据库密码不能为空", groups = DefaultGroup.class)
    private String dbPassword;

    /**
     * 创建者
     */
    @ApiModelProperty(value = "创建者")
    private String createBy;



    /**
     * 组件列表，逗号分隔
     */
    @ApiModelProperty(value = "组件列表，逗号分隔")
    private String components;

    @ApiModelProperty(value = "生成代码路径")
    private String genPath;

    @ApiModelProperty(value = "是否初始化数据库和表")
    private Boolean isInitDb;

}
