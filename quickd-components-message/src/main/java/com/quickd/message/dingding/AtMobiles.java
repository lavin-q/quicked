package com.quickd.message.dingding;
import lombok.Data;
import java.util.List;
/**
 * @project: quickd
 * @description: AtMobiles
 * @author: caochaofeng
 * @create: 2019-10-06 20:39
 */
@Data
public class AtMobiles {

    /**
     * 被@人的手机号
     * @return
     */
    private List<String> atMobiles;

    /**
     * @所有人时:true,否则为:false
     */
    private Boolean isAtAll;
}