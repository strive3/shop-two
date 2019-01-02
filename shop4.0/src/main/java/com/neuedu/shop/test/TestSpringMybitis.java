package com.neuedu.shop.test;

import com.neuedu.shop.pojo.Admin;
import com.neuedu.shop.service.AdminService;
import lombok.Data;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author 杜晓鹏
 * @create 2018-12-22 9:51
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
@Data
public class TestSpringMybitis {
    @Autowired
    @Qualifier("adminService")
    private AdminService adminService;

    @Test
    public void test(){
        List<Admin> byPage = adminService.findByPage(0, 10);
        System.out.println(byPage);
    }
}
