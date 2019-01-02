package com.neuedu.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 杜晓鹏
 * @create 2018-12-17 18:36
 */
@Controller
public class AdminController {
    @RequestMapping("/list.admin")
    public String getAdmins(){
        System.out.println("==============================================");
        return "admin/admins.jsp";
    }
}
