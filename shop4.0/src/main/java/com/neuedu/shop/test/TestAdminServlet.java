package com.neuedu.shop.test;

import com.neuedu.shop.pojo.Admin;
import com.neuedu.shop.service.AdminService;
import com.neuedu.shop.service.impl.AdminServiceImpl;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author 杜晓鹏
 * @create 2018-12-22 11:25
 */
@WebServlet(name = "TestAdminServlet",urlPatterns = "/alladmins")
public class TestAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        WebApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
        AdminService mapper = (AdminServiceImpl) applicationContext.getBean("adminService");
        List<Admin> admins = mapper.findByPage(0, 10);

        response.getWriter().print(admins.toString());
    }
}
