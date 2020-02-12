package com.quickd.core.model;

import com.quickd.core.model.components.MQInfo;
import com.quickd.core.model.components.MongoInfo;
import com.quickd.core.model.components.MysqlInfo;
import com.quickd.core.model.components.RedisInfo;

import java.util.HashMap;

public class Components extends HashMap<String, Object> implements IComponent {
	public Components(String...component) {
		for (String c : component) {
			c = c.trim().toLowerCase();
			if(c.equals(MongoInfo.name())) {
				this.put(c, new MongoInfo());
			}else if(c.equals(MQInfo.name())){
				this.put(c, new MQInfo());
			}else if(c.equals(MysqlInfo.name())){
				this.put(c, new MysqlInfo());
			}else if(c.equals(RedisInfo.name())){
				this.put(c, new RedisInfo());
			}
		}
	}
}
