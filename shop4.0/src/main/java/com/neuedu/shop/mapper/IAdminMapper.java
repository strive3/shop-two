package com.neuedu.shop.mapper;
/**
 * ��Admin������Ӧ��crud
 * @author ������
 *
 */

import java.util.List;

import com.neuedu.shop.pojo.Admin;
import org.apache.ibatis.annotations.Param;

public interface IAdminMapper {
	// ��ѯ����
	List<Admin> findByPage(@Param("startIndex") int startIndex, @Param("pageSize") int pagesize);

	// ��Ӳ���
	void add(Admin admin);

	// ɾ��
	void delete(Integer id);

	// ����
	void update(Admin admin);

	// ����id���ҹ���Ա
	Admin findById(Integer id);
	
	/**
	 * ͨ�����ֽ��в�ѯ  ���ڵ�½ʱʹ��
	 */
	Admin findByName(String name);

	int count();
}
