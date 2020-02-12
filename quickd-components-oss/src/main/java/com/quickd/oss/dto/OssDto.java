package com.quickd.oss.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.util.Date;

import com.quickd.core.dto.BaseDto;
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
public class OssDto extends BaseDto {

    /**
     * URL地址
     */
    private String url;


    /**
     * 创建人
     */
    private String createBy;


}
