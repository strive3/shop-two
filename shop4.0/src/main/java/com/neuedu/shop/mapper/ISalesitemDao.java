package com.neuedu.shop.mapper;
/**
 * ��Admin������Ӧ��crud
 * @author ������
 *
 */

import java.util.List;

import com.neuedu.shop.pojo.Salesitem;


public interface ISalesitemDao {
	// ��ѯ����
	List<Salesitem> findAll();

	// ��Ӳ���
	void add(Salesitem salesitem);

	// ɾ��
	void delete(Integer id);

	// ����
	void update(Salesitem salesitem);

	// ����id���ҹ���Ա
	Salesitem findById(Integer id);
}
