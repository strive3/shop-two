package com.neuedu.shop.entity;

import lombok.Data;

import java.util.List;
@Data
public class Category {
	private Integer id;
	private String name;
	private String descr;
	private Integer pid;
	private boolean leaf; //Ҷ�ӽ��Ϊ1����Ҷ�ӽ��Ϊ0
	private Integer grade;
	private List<Category> categoryList;
	public Category() {
		super();
	}
	public Category(String name, String descr, Integer pid, boolean leaf, Integer grade) {
		super();
		this.name = name;
		this.descr = descr;
		this.pid = pid;
		this.leaf = leaf;
		this.grade = grade;
	}
	public Category(Integer id, String name, String descr, Integer pid, boolean leaf, Integer grade) {
		this(name, descr, pid, leaf, grade);
		this.id = id;
	}
	
	public Category(String name, String descr) {
		super();
		this.name = name;
		this.descr = descr;
	}

}