package com.quickd.oss.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 文件上传
 * </p>
 *
 * @author quickd
 * @since 2019-10-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_oss")
public class Oss extends BaseEntity {

    /**
     * URL地址
     */
    private String url;

}
