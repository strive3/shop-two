package com.neuedu.shop.entity;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class Salesorder {
	private Integer id; 	//����
	private User user;		
	private Timestamp odate;	//�µ�ʱ��
	private Integer status;		//0��δ����  1���Ѹ���
	private Cart cart;
	private List<Salesitem> salesitems;  //�洢��ǰ���������ж�����
	public Salesorder() {
		super();
	}

	public Salesorder(Integer id, User user, Timestamp odate, Integer status, Cart cart) {
		super();
		this.id = id;
		this.user = user;
		this.odate = odate;
		this.status = status;
		this.cart = cart;
	}

	public Salesorder(User user, Integer status, Cart cart) {
		super();
		this.user = user;
		this.status = status;
		this.cart = cart;
	}


	
	
	
}
