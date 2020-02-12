package com.quickd.core.exception;

import com.quickd.core.common.Status;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @project: jeedcp
 * @description: 通用的业务异常类
 * @author: caochaofeng
 * @create: 2019-08-15 11:11
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BusinessException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    private int code;
    private String msg;

    public BusinessException(int code) {
        this.code = code;
        this.msg = Status.getMessage(code);
    }

    public BusinessException(int code, Throwable e) {
        super(e);
        this.code = code;
        this.msg = Status.getMessage(code);
    }

    public BusinessException(String msg) {
        super(msg);
        this.code = Status.FAIL_EXCEPTION.code();
        this.msg = msg;
    }

    public BusinessException(String msg, Throwable e) {
        super(msg, e);
        this.code = Status.FAIL_EXCEPTION.code();
        this.msg = msg;
    }

}
