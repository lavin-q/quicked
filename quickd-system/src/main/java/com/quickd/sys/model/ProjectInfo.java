package com.quickd.sys.model;

import java.util.HashMap;

/**
 * 项目基础信息
 */
public class ProjectInfo extends HashMap<String, Object>{
	public ProjectInfo(String name,String group,String copyright,String author,String packageName) {
		this.put("name", name);
		this.put("group", group);
		this.put("copyright", copyright);
		this.put("author", author);
		this.put("packageName", packageName);
	}
}

