package com.neuedu.shop.mapper;

import java.util.List;

import com.neuedu.shop.pojo.CartItem;
import com.neuedu.shop.pojo.Salesorder;
import org.apache.ibatis.annotations.Param;

public interface IOrderMapper {
	List<Salesorder> findByPage(@Param("startIndex") int rownum , @Param("pagesize") int pagesize);

	void delete(Integer id);
	
	void add(Salesorder so);
	void addItem(@Param("list") List<CartItem> cartItems, @Param("key") int key);

	Salesorder findById(Integer id);

	int count();

	void update(Salesorder salesorder);
}
