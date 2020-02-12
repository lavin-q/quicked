

package com.quickd.core.config;


import cn.hutool.json.JSONUtil;
import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.quickd.core.common.Const;
import com.quickd.core.util.DBUtil;

import java.util.List;
import java.util.Map;

/**
 * 短信Factory
 *
 * @author Mark sunlightcs@gmail.com
 */
public class ConfigFactory {

    public static SmsConfig buildSmsConfig() {
        //获取短信配置信息Const.SMS_CONFIG_KEY
        String config = ConfigFactory.getConfig(Const.SMS_CONFIG_KEY);
        SmsConfig smsConfig =  JSON.parseObject(config,SmsConfig.class);
        if (smsConfig!=null) {
            return  smsConfig;
        }else{
            return null;
        }
    }
    public static LocalStorageConfig buildLocalConfig() {
        //获取短信配置信息Const.SMS_CONFIG_KEY
        String config = ConfigFactory.getConfig(Const.LOCAL_STORAGE_CONFIG_KEY);
        LocalStorageConfig localStorageConfig = JSON.parseObject(config,LocalStorageConfig.class);
        if (localStorageConfig != null) {
            return localStorageConfig;
        } else {
            return null;
        }
    }
    public static AliyunStorageConfig buildAliyunConfig() {
        //获取短信配置信息Const.SMS_CONFIG_KEY
        String config = ConfigFactory.getConfig(Const.CLOUD_STORAGE_CONFIG_KEY);
        AliyunStorageConfig aliyunConfig = JSON.parseObject(config,AliyunStorageConfig.class);
        if (aliyunConfig != null) {
            return aliyunConfig;
        } else {
            return null;
        }
    }
    public static String getConfig(String key) {
        //获取短信配置信息Const.SMS_CONFIG_KEY
        List<String> configs = null;
        try {
            configs = DBUtil.executeQueryStr("SELECT config_value FROM `sys_config` where config_key='"+key+"' and del_flag='0'");
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (configs.size() > 0) {
            String config = configs.get(0);
            return config;
        }else{
            return null;
        }
    }
    public static void updateConfig(String configKey,String configValue,String configName) {
        //获取短信配置信息Const.SMS_CONFIG_KEY

        try {
            String sql ="SELECT * FROM `sys_config` where config_key='"+configKey+"'";
            List<Map<String, Object>> list =    DBUtil.query(sql);
            if(list.size()>0){
                DBUtil.executeUpdate("update `sys_config` set config_value ='"+configValue+"'where config_key='"+configKey+"' and del_flag='0'");
            }else{
                String insertSql="INSERT INTO `sys_config`(`id`, `config_name`, `config_key`, `config_value`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remarks`, `del_flag`, `version`)" +
                        " VALUES ("+ IdWorker.getIdStr() +", '"+configName+"', '"+configKey+"', '"+configValue+"', '1', 'system', now(), NULL, NULL, NULL, '0', 1);";
                DBUtil.executeUpdate(insertSql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
