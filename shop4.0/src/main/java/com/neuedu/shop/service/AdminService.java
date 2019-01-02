package com.neuedu.shop.service;

import com.neuedu.shop.pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 杜晓鹏
 * @create 2018-12-22 9:37
 */
public interface AdminService {
    // 查询操作
    List<Admin> findByPage(@Param("startIndex") int startIndex, @Param("pageSize") int pagesize);

    // 添加操作
    void add(Admin admin);

    // 删除
    void delete(Integer id);

    // 更新
    void update(Admin admin);

    // 根据id查找管理员
    Admin findById(Integer id);

    /**
     * 通过名字进行查询  ，在登陆时使用
     */
    Admin findByName(String name);

    int count();
}
