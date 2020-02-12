package com.quickd.sys.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
/**
 * @project: quickd-backend
 * @description: RedisDto
 * @author: quickd
 * @create: 2019-09-29 06:52
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RedisDto implements Serializable {

    @NotBlank
    private String key;

    @NotBlank
    private String value;
}