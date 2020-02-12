package com.quickd.sys.model.components;


import com.quickd.core.enums.ComponentsEnum;
import com.quickd.sys.model.IComponent;

import java.util.HashMap;

public class MongoInfo extends HashMap<String, Object> implements IComponent {
	public static String name() {
		return ComponentsEnum.MONGO.getName();
	}
	
}
