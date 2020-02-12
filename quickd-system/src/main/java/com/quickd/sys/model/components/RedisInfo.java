package com.quickd.sys.model.components;

import com.quickd.sys.model.IComponent;

import java.util.HashMap;

public class RedisInfo extends HashMap<String, Object> implements IComponent{
	public static String name() {
		return "redis";
	}
}
