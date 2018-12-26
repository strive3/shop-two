package com.neuedu.shop.entity;

/**
 * ���ﳵ�� ��
 * 
 * @author ������
 *
 */

public class CartItem {
	private Product product;
	private int qty;
	

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "CartItem [product=" + product + ", qty=" + qty + "]";
	}

	/**
	 * �������ﳵ��С��
	 */
	public double getTotals() {
		return Math.round(this.product.getNormalprice() * this.qty * 100.00) / 100.00;
	}
}
