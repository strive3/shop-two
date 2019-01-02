package com.neuedu.shop.pojo;

import lombok.Data;

@Data
public class Admin {
	private Integer id;
	private String aname;
	private String apwd;
	
	public Admin() {

	}

	public Admin(String aname, String apwd) {
		super();
		this.aname = aname;
		this.apwd = apwd;
	}
	public Admin(Integer id, String aname, String apwd) {
		this(aname, apwd);
		this.id = id;
	}


}
