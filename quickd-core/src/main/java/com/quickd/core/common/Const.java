package com.quickd.core.common;

/**
 * @project: quickd
 * @description: 常量
 * @author: quickd
 * @create: 2019-08-15 16:44
 */
public class Const {

    /**
     * 禁用
     */
    public final static int DISABLED = 0;
    /**
     * 启用
     */
    public final static int ABLED = 1;



    /**
     * 操作失败
     */
    public final static int OPERATION_FAIL = 0;
    /**
     * 操作成功
     */
    public final static int OPERATION_SUCCESS = 1;

    /**
     * 用户登录
     */
    public final static int LOGIN_OPERATION_LOGIN = 0;
    /**
     * 用户退出
     */
    public final static int LOGIN_OPERATION_LOGOUT = 1;

    /**
     * 软删标志
     */
    public final static int DEL_FLAG_NORMAL = 0;

    /**
     * 管理员租户
     */
    public final static String ADMIN_TENANT_ID = "000000";



    /**
     * OK
     */
    public final static String OK = "OK";

    public final static String ok = "ok";
    /**
     * 系统管理员
     */
    public final static String SYS_ADMIN = "1";

    public final static int VERSION = 1;

    /**
     * 登录用户令牌缓存KEY前缀
     */
    public final static int TOKEN_EXPIRE_TIME = 3600;

    public final static String PREFIX_USER_TOKEN = "PREFIX_USER_TOKEN_";

    /** 登录用户拥有角色缓存KEY前缀 */
    public static String LOGIN_USER_CACHERULES_ROLE = "loginUser_cacheRules::Roles_";

    public static String LOGIN_USER_CACHERULES_DEPT = "loginUser_cacheRules::Depts_";
    /** 登录用户拥有权限缓存KEY前缀 */
    public static String LOGIN_USER_CACHERULES_PERMISSION  = "loginUser_cacheRules::Permissions_";
    /**
     * 未发布
     */
    public final static String UNPUBLISHED_STATUS_0 = "0";

    /**
     * 已发布
     */
    public final static String PUBLISHED_STATUS_1 = "1";

    /**
     * 撤销
     */
    public final static String REVOKE_STATUS_2 = "2";


    /**通告对象类型（USER:指定用户，ALL:全体用户）*/
    public static String MSG_TYPE_UESR  = "USER";
    public static String MSG_TYPE_ALL  = "ALL";

    /**发布状态（0未发布，1已发布，2已撤销）*/
    public static String NO_SEND  = "0";
    public static String HAS_SEND  = "1";
    public static String HAS_CANCLE  = "2";

    /**阅读状态（0未读，1已读）*/
    public static String HAS_READ_FLAG  = "1";
    public static String NO_READ_FLAG  = "0";

    /**优先级（L低，M中，H高）*/
    public static String PRIORITY_L  = "L";
    public static String PRIORITY_M  = "M ";
    public static String PRIORITY_H  = "H";

    /**
     * 删除标志
     */
    public static String DEL_FLAG_1 = "1";

    /**
     * 未删除
     */
    public static String DEL_FLAG_0 ="0";

    /**
     * 用于IP定位转换
     */
    public static final String REGION = "内网IP|内网IP";

    /**
     * 短信配置KEY
     */
    public static String SMS_CONFIG_KEY = "SMS_CONFIG_KEY";
    /**
     * 邮件配置KEY
     */
    public  static  String MAIL_CONFIG_KEY = "MAIL_CONFIG_KEY";
    /**
     * 个推配置KEY
     */
    public static String GETUI_CONFIG_KEY = "GETUI_CONFIG_KEY";
    /**
     * 云存储配置KEY
     */
    public  static  String CLOUD_STORAGE_CONFIG_KEY = "CLOUD_STORAGE_CONFIG_KEY";
    public  static  String LOCAL_STORAGE_CONFIG_KEY = "LOCAL_STORAGE_CONFIG_KEY";


    public  static  String ANDROID = "android";
    public  static  String IOS = "ios";

    /**
     * 顶级父节点id
     */
    public  static  Long TOP_PARENT_ID = 0L;
    /**
     * 顶级父节点名称
     */
    public  static String TOP_PARENT_NAME = "顶级";

    /**
     * 默认密码
     */
    public  static  String DEFAULT_PASSWORD = "123456";
}
