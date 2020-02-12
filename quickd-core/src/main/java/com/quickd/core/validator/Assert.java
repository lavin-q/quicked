package com.quickd.core.validator;
import com.quickd.core.exception.BusinessException;
import com.quickd.core.util.PatternUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.regex.Pattern;
/**
 * @project: jeedcp
 * @description: ${description}
 * @author: caochaofeng
 * @create: 2019-08-16 10:56
 */
public class Assert {

    /**************************************返回true || false**********************************************/

    /**
     * 是空字符串
     *
     * @param str
     */
    public static boolean isBlank(String str) {
        if (StringUtils.isBlank(str)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 判断是不是null
     *
     * @param object
     */
    public static boolean isNull(Object object) {
        if (object == null) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 判断是不是空字符串或null
     *
     * @param object
     */
    public static boolean isEmpty(Object object) {
        boolean flag = (null == object || (object instanceof String && StringUtils.isBlank((String) object)));
        return flag;
    }

    /**
     * 验证是否为给定长度范围的英文字母 、数字和下划线
     *
     * @param value
     * @param min   最小长度
     * @param max   最大长度
     */
    public static boolean isStrLength(String value, int min, int max) {
        String reg = "^\\w{" + min + "," + max + "}$";
        if (min < 0) {
            min = 0;
        }
        if (max <= 0) {
            reg = "^\\w{" + min + ",}$";
        }
        return validateMatchRegex(reg, value);
    }

    /**
     * 验证是否为数字
     *
     * @param value
     */
    public static boolean isNumbers(String value) {
        return validateMatchRegex(PatternUtils.NUMBERS, value);
    }

    /**
     * 验证手机号码
     *
     * @param value
     */
    public static boolean isMobile(String value) {
        return validateMatchRegex(PatternUtils.MOBILE, value);
    }

    /**
     * 验证邮箱
     *
     * @param value
     */
    public static boolean isEmail(String value) {
        return validateMatchRegex(PatternUtils.EMAIL, value);
    }

    /**
     * 验证车牌
     *
     * @param value
     */
    public static boolean isPlateNumber(String value) {
        return validateMatchRegex(PatternUtils.PLATE_NUMBER, value);
    }

    /**
     * 验证身份证
     *
     * @param value
     */
    public static boolean isCitizenId(String value) {
        return validateMatchRegex(PatternUtils.CITIZEN_ID, value);
    }

    /**
     * 通过正则表达式验证
     *
     * @param regex 正则表达式
     * @param value
     */
    public static boolean validateMatchRegex(String regex, String value) {
        if (!isEmpty(value)) {
            return Pattern.matches(regex, value);
        } else {
            return false;
        }
    }


    /**************************************抛出异常**********************************************/

    /**
     * 是空字符串
     *
     * @param str
     * @param message
     */
    public static void isBlank(String str, String message) {
        if (StringUtils.isBlank(str)) {
            throw new BusinessException(message);
        }
    }

    /**
     * 判断是不是null
     *
     * @param object
     * @param message
     */
    public static void isNull(Object object, String message) {
        if (object == null) {
            throw new BusinessException(message);
        }
    }

    /**
     * 判断是不是空字符串或null
     *
     * @param object
     * @param message
     */
    public static void isEmpty(Object object, String message) {
        boolean flag = (null == object || (object instanceof String && StringUtils.isBlank((String) object)));
        if (flag) {
            throw new BusinessException(message);
        }
    }

    /**
     * 验证是否为给定长度范围的英文字母 、数字和下划线
     *
     * @param value
     * @param min     最小长度
     * @param max     最大长度
     * @param message
     */
    public static void isStrLength(String value, int min, int max, String message) {
        String reg = "^\\w{" + min + "," + max + "}$";
        if (min < 0) {
            min = 0;
        }
        if (max <= 0) {
            reg = "^\\w{" + min + ",}$";
        }
        validateMatchRegex(reg, value, message);
    }

    /**
     * 验证是否为数字
     *
     * @param value
     * @param message
     */
    public static void isNumbers(String value, String message) {
        validateMatchRegex(PatternUtils.NUMBERS, value, message);
    }

    /**
     * 验证手机号码
     *
     * @param value
     * @param message
     */
    public static void isMobile(String value, String message) {
        validateMatchRegex(PatternUtils.MOBILE, value, message);
    }

    /**
     * 验证邮箱
     *
     * @param value
     * @param message
     */
    public static void isEmail(String value, String message) {
        validateMatchRegex(PatternUtils.EMAIL, value, message);
    }

    /**
     * 验证车牌
     *
     * @param value
     * @param message
     */
    public static void isPlateNumber(String value, String message) {
        validateMatchRegex(PatternUtils.PLATE_NUMBER, value, message);
    }

    /**
     * 验证身份证
     *
     * @param value
     * @param message
     */
    public static void isCitizenId(String value, String message) {
        validateMatchRegex(PatternUtils.CITIZEN_ID, value, message);
    }

    /**
     * 通过正则表达式验证
     *
     * @param regex   正则表达式
     * @param value
     * @param message
     */
    public static void validateMatchRegex(String regex, String value, String message) {
        isEmpty(value, message);
        if (false == Pattern.matches(regex, value)) {
            throw new BusinessException(message);
        }
    }


    /**
     * 检测文件是否是excel
     *
     * @param file
     */
    public static void isExcel(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            throw new BusinessException("上传excel不能为空");
        }
        String fileExt = FilenameUtils.getExtension(file.getOriginalFilename());
        if (!"xls".equalsIgnoreCase(fileExt) && !"xlsx".equalsIgnoreCase(fileExt)) {
            throw new BusinessException("文件类型不合法");
        }
    }


    public static void isArrayEmpty(Object[] array, String message) {
        if(array == null){
            throw new BusinessException(message);
        }

        if(ArrayUtils.isEmpty(array)){
            throw new BusinessException(message);
        }
    }

    public static void isListEmpty(List<?> list, String message) {
        if(list == null){
            throw new BusinessException(message);
        }

        if(list.size()==0){
            throw new BusinessException(message);
        }
    }


}
