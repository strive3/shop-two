package com.neuedu.shop.service.impl;

import com.neuedu.shop.mapper.IAdminMapper;
import com.neuedu.shop.pojo.Admin;
import com.neuedu.shop.service.AdminService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 杜晓鹏
 * @create 2018-12-22 9:41
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private IAdminMapper mapper;

    @Override
    public List<Admin> findByPage(int startIndex, int pagesize) {
        return mapper.findByPage(startIndex,pagesize);
    }

    @Override
    public void add(Admin admin) {

    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public void update(Admin admin) {

    }

    @Override
    public Admin findById(Integer id) {
        return null;
    }

    @Override
    public Admin findByName(String name) {
        return null;
    }

    @Override
    public int count() {
        return 0;
    }
}
