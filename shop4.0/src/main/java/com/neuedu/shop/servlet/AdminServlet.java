package com.neuedu.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.neuedu.shop.mapper.IAdminMapper;
import com.neuedu.shop.pojo.Admin;
import com.neuedu.shop.pojo.Paging;
import com.neuedu.shop.service.AdminService;
import com.neuedu.shop.service.impl.AdminServiceImpl;
import com.neuedu.shop.util.MybatisUtil;
import com.neuedu.shop.util.ServletUtil;
import com.neuedu.shop.util.VerifyCodeUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * Adminʵ�����е�����crud ʹ��ע���������@WebServlet ʹ��ͨ�����ɶ�Servlet����
 *
 * @author ������
 */
@WebServlet("*.admin")
public class AdminServlet extends HttpServlet {
    /**
     *
     */
    private static final long serialVersionUID = -2550332412219581465L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = ServletUtil.getPath(request, response);

        //servletContext   ��application�Ļ�������
//        ServletContext servletContext = request.getServletContext();
//        WebApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
//        AdminService mapper = (AdminServiceImpl) applicationContext.getBean("adminService");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        IAdminMapper mapper = sqlSession.getMapper(IAdminMapper.class);
        if (path.equals("/adminlist")) {
            int pageNumber = 1;
            int pagesize = 10;
            if (request.getParameter("pageNumber") != null && !request.getParameter("pageNumber").equals("")){
                pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            }
            Paging<Admin> paging = new Paging<>(pageNumber, pagesize, mapper.count());
            List<Admin> admins = mapper.findByPage(paging.getStartIndex(),pagesize);
            // �������Ľ��������Ӧ��jspҳ��������
            // 1.������󶨵�request������
            paging.setObjects(admins);
            request.setAttribute("paging",paging);
            // 2.��ȡһ��jsp��ת��������Ҫ�����ҳ�潻��˭����ʾ��
            RequestDispatcher rd = request.getRequestDispatcher("admin/admins.jsp");
            // 3.ת����������������ҳ����ʾ��
            rd.forward(request, response);
        } else if (path.equals("/add")) {
            // ��ǰ̨��ȡ���������
            String aname = request.getParameter("aname");
            String apwd = request.getParameter("apwd");
            mapper.add(new Admin(aname, apwd));
            sqlSession.commit();
            sqlSession.close();
            // ҳ����ת���ض���
            response.sendRedirect("adminlist.admin");
        } else if (path.equals("/load")) {
            // ��ǰ̨��ȡ�������е����� �������еģ��൱�� name ��id �൱�� name="id"
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = mapper.findById(id);

            request.setAttribute("admin", admin);
            request.getRequestDispatcher("admin/update_admin.jsp").forward(request, response);
        } else if (path.equals("/update")) {
            // ��ǰ̨��ȡ��������
            String newpwd = request.getParameter("newpwd");

            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = mapper.findById(id);
            admin.setApwd(newpwd);

            mapper.update(admin);
            sqlSession.commit();
            sqlSession.close();
            // �ض���list���
            response.sendRedirect("adminlist.admin");
        } else if (path.equals("/delete")) {
            int id = Integer.parseInt(request.getParameter("id"));

            mapper.delete(id);
            sqlSession.commit();
            sqlSession.close();
            response.sendRedirect("adminlist.admin");
        } else if (path.equals("/login")) {
            //����Ա��½
            String name = request.getParameter("name");
            String pwd = request.getParameter("pwd");
            String code = request.getParameter("code");
            HttpSession session = request.getSession();
            String vercode = (String) session.getAttribute("verCode");
            Admin admin = mapper.findByName(name);
            //�ж� �û��� ������ �ܲ��ܵ�½
            if (code.toLowerCase().equals(vercode)) {
                if (admin != null && admin.getApwd().equals(ServletUtil.getMD5(pwd))) {
                    //�����½�ɹ� ��admin�󶨵�session��
                    //Ŀ�����÷ǵ�½�Ĺ���Ա����ͨ��url��ֱַ�ӷ��ʵ�����ҳ��
                    session.setAttribute("admin", admin);
                    //��½�ɹ�
                    response.sendRedirect("index.jsp");
                } else {
                    ServletUtil.forwardPage("error_msg", "�û������������", "login.jsp", request, response);
                }

            } else {
                ServletUtil.forwardPage("error_msg_code", "��֤�����", "login.jsp", request, response);
            }

        } else if (path.equals("/code")) {
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/jpeg");
            //��������ִ�
            String verifyCode = VerifyCodeUtils.generateVerifyCode(4);

System.out.println("���ɵ���֤��" + verifyCode);
            //����Ựsession
            HttpSession session = request.getSession(true);
            //ɾ����ǰ��
            session.removeAttribute("verCode");
            session.setAttribute("verCode", verifyCode.toLowerCase());
System.out.println("sessionID: " + session.getId());
            //����ͼƬ
            int w = 100, h = 30;
            VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
        } else if (path.equals("/logout")) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("login.jsp");
        }
    }
}
