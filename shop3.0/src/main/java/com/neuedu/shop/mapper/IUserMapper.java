package com.neuedu.shop.mapper;
/**
 * ��Admin������Ӧ��crud
 * @author ������
 *
 */

import java.util.List;
import java.util.Map;

import com.neuedu.shop.entity.Paging;
import com.neuedu.shop.entity.User;
import org.apache.ibatis.annotations.Param;

public interface IUserMapper {
	// ��ѯ����
	List<User> findByPage(@Param("startIndex") int startIndex, @Param("pageSize") int pagesize);
	List<User> findAll(Map<String,Object> map);
	// ��Ӳ���
	void add(User user);

	// ɾ��
	void delete(Integer id);

	// ����
	void update(User user);

	// ����id���ҹ���Ա
	User findById(Integer id);

	//����name���ҹ���Ա
	User findByName(String name);

	int count();
}
