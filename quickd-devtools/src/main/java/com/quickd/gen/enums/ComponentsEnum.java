package com.quickd.gen.enums;

public enum ComponentsEnum {
	
	MONGO("mongo"),
	MQ("mq"),
	MYSQL("mysql"),
	REDIS("redis");
	
	
	String name;
	
	ComponentsEnum(String name){
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
