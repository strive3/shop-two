package com.neuedu.shop.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author ������
 * @create 2018-11-29 9:55
 * ������������ͨ��������jsp����session�л�ȡadmin�������ǰ�û�û��
 * ��½��������
 */
@WebFilter(filterName = "BackFilter", value = "*.jsp")
public class BackFilter implements Filter {
    public void destroy() {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
/*
        1��request.getRequestURL()
        ���ص���������url������HttpЭ�飬�˿ںţ�servlet���ֺ�ӳ��·�����������������������
        2��request.getRequestURI()
        �õ�����request URL�Ĳ���ֵ������web����û��decode����
        3��request.getContextPath()
        ���� the context of the request.
        4��request.getServletPath()
        ���ص���servlet�Ĳ���url.
        5��request.getQueryString()
        ����url·������Ĳ�ѯ�ַ���
*/
      /* String uri = request.getRequestURI();
        if (!uri.contains("back") || uri.contains("login")) {
            chain.doFilter(req, resp);
        } else {
            Admin admin = (Admin) session.getAttribute("admin");
            if (admin == null) {
                response.sendRedirect("login.jsp");
                return;
            }*/
            chain.doFilter(req, resp);
        /*}*/
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
