package ${project.group}.${project.name}.user;

import com.idogfooding.backbone.network.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 登录结果
 *
 * @author elvis
 */
@EqualsAndHashCode(callSuper=false)
@Data
public class LoginResult extends BaseEntity {

    private String token;
    private User user;
    private long expireTime;

}
