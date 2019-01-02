package com.neuedu.shop.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Timestamp;
@Data
@AllArgsConstructor
public class User {
	private Integer id;
	private String username;
	private String password;
	private String phone;
	private String addr;
	private Timestamp rdate;
	public User() {
		super();
	}
	public User(String username, String password, String phone, String addr) {
		super();
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.addr = addr;
	}


	
}
