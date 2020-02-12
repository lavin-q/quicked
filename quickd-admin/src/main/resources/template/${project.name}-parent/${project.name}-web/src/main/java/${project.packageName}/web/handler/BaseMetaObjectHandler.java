package ${project.group}.web.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.quickd.core.common.Const;
import com.quickd.sys.jwt.JwtUtil;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @project: demo
 * @description: 填充创建时间，创建人，更新时间，更新人
 * @author: quickd
 * @create: 2019-08-17 14:09
 */
@Component
public class BaseMetaObjectHandler implements MetaObjectHandler {
    /**
     * 删除标记
     */
    public static final String DEL_FLAG = "delFlag";
    /**
     * 创建时间
     */
    public static final String CREATE_BY = "createBy";
    /**
     * 创建时间
     */
    public static final String CREATE_TIME = "createTime";
    /**
     * 创建时间
     */
    public static final String UPDATE_BY = "updateBy";
    /**
     * 更新时间
     */
    public static final String UPDATE_TIME = "updateTime";

    public static final String VERSION = "version";

    public static final String ID = "id";

    /**
     * 新增
     */
    @Override
    public void insertFill(MetaObject metaObject) {

        setFieldValByName(ID, IdWorker.getIdStr(), metaObject);
        // 创建用户
        if (SecureUtil.getCurrentUser() != null) {
            setFieldValByName(CREATE_BY, SecureUtil.getCurrentUser().getUsername(), metaObject);
        }

        // 创建时间
        setFieldValByName(CREATE_TIME, new Date(), metaObject);

        // 删除标记
        setFieldValByName(DEL_FLAG, Const.DEL_FLAG_NORMAL, metaObject);
        setFieldValByName(VERSION, Const.VERSION, metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 更新用户
        setFieldValByName(UPDATE_BY, SecureUtil.getCurrentUser().getUsername(), metaObject);
        // 更新用户
        setFieldValByName(UPDATE_TIME, new Date(), metaObject);
    }
}