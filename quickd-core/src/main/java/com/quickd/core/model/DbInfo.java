package com.quickd.core.model;

import java.util.HashMap;

/**
 * 数据库信息
 */
public class DbInfo extends HashMap<String, Object>{
	public DbInfo(String dbUrl, String dbPort,String dbName, String dbUsername, String dbPassword) {
		this.put("dbUrl", dbUrl);
		this.put("dbPort", dbPort);
		this.put("dbName", dbName);
		this.put("dbUsername", dbUsername);
		this.put("dbPassword", dbPassword);
	}
}

