package com.neuedu.shop.entity;

import java.util.ArrayList;
import java.util.List;
/**
 * ���ﳵ ��
 * @author ������
 *
 */
public class Cart {
	private List<CartItem> cItems = new ArrayList<>();

	public List<CartItem> getcItems() {
		return cItems;
	}

	public void setcItems(List<CartItem> cItems) {
		this.cItems = cItems;
	}
	
	/**
	 * �����ﳵ����ӹ��ﳵ���add����
	 */
	public void add(CartItem cartItem) {
		cItems.add(cartItem);
	}
	
	/**
	 * �����ܼ�
	 */
	public double getTotals() {
		double total = 0;
		for(int i = 0; i < cItems.size(); i++) {
			CartItem citem = cItems.get(i);
			total += citem.getTotals();
		}
		return total;
	}

	@Override
	public String toString() {
		return "Cart [cItems=" + cItems + "]";
	}
	
	
}
