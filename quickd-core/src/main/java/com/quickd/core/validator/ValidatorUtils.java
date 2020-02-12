package com.quickd.core.validator;
import com.quickd.core.exception.BusinessException;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Set;

/**
 * @project: jeedcp
 * @description: 数据校验
 * @author: caochaofeng
 *  * hibernate-validator校验工具类
 *  参考文档：http://docs.jboss.org/hibernate/validator/5.4/reference/en-US/html_single/
 * @create: 2019-08-16 10:57
 */
public class ValidatorUtils {

    private static Validator validator;

    static {
        validator = Validation.buildDefaultValidatorFactory().getValidator();
    }

    /**
     * 校验对象
     * @param object        待校验对象
     * @throws BusinessException  校验不通过，则报BusinessException异常
     */
    public static void validateEntity(Object object, Class<?>... groups)throws BusinessException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object, groups);
        if (!constraintViolations.isEmpty()) {
            ConstraintViolation<Object> constraint = constraintViolations.iterator().next();
            throw new BusinessException(constraint.getMessage());
        }
    }
}
