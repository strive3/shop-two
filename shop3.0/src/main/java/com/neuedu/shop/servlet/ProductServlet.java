package com.neuedu.shop.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neuedu.shop.mapper.ICategoryMapper;
import com.neuedu.shop.mapper.IProductMapper;
import com.neuedu.shop.entity.Category;
import com.neuedu.shop.entity.Paging;
import com.neuedu.shop.entity.Product;
import com.neuedu.shop.util.MybatisUtil;
import com.neuedu.shop.util.ServletUtil;
import org.apache.ibatis.session.SqlSession;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("*.product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = ServletUtil.getPath(request, response);
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		IProductMapper pmapper = sqlSession.getMapper(IProductMapper.class);
		ICategoryMapper cmapper = sqlSession.getMapper(ICategoryMapper.class);
		HttpSession session = request.getSession();
		//һҳ����������
		int pagesize = 10;
		//Ĭ��Ϊ��һҲҳ
		int pageNumber = 1;
        //�ж����pageNumber���ǿյĻ�������ǰ̨��ȡ����ֵ������
		if (request.getParameter("pageNumber") != null && !request.getParameter("pageNumber").equals("")){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}

		//��ʼ�ж�·�����Բ�ͬ��·������ͬ�Ĵ���
		if (path.equals("/list")) {
			List<Category> categories = cmapper.findAll();
			Paging<Product> paging = new Paging<>(pageNumber,pagesize,pmapper.countAll());
			Map<String,Object> map = new HashMap<>();
			map.put("startIndex",paging.getStartIndex());
			map.put("pagesize",paging.getPageSize());
			List<Product> products = pmapper.findLastByPagings(map);
			paging.setObjects(products);
            //ServletUtil.forwardPage("products", products, "product/products.jsp", request, response);
			request.setAttribute("paging",paging);
			request.setAttribute("categories",categories);
			request.getRequestDispatcher("product/products.jsp").forward(request,response);
		} else if (path.equals("/add_product")) {
			//��ѡ��
			List<Category> categories = cmapper.findAll();
			//����ת��add��ҳ��
			ServletUtil.forwardPage("categories", categories, "product/add_product.jsp", request, response);

		} else if (path.equals("/add")) {

			String name = request.getParameter("name");
			String descr = request.getParameter("descr");
			Double normalprice = Double.valueOf(request.getParameter("normalprice"));
			Double memberprice = Double.valueOf(request.getParameter("memberprice"));
			Category category = cmapper.findById(Integer.valueOf(request.getParameter("categoryid")));

			pmapper.add(new Product(name, descr, normalprice, memberprice,category));
			sqlSession.commit();
			sqlSession.close();
			response.sendRedirect("list.product");
		} else if (path.equals("/simple_search")) {
            String keywords = request.getParameter("keywords");
            //���keywords��Ϊ�� �ͽ����浽session��
            if (keywords != null && !keywords.equals("")){
                session.setAttribute("keywords",keywords);
            }
            Paging<Product> paging = new Paging<>(pageNumber,pagesize,pmapper.countSimple((String) session.getAttribute("keywords") ));
            List<Product> products = pmapper.findByKeywords((String) session.getAttribute("keywords") , paging.getStartIndex() , pagesize);
			paging.setObjects(products);
            request.setAttribute("paging",paging);
            //keywords = URLEncoder.encode(keywords, "utf-8");
			//keywords = URLDecoder.decode(keywords, "utf-8");
			//ServletUtil.forwardPage("products", products, "product/search_product_simple.jsp", request, response);
			//�󶨵�request
//System.out.println("ִ��get");
			//request.setAttribute("keywords", keywords);
			//��   ת��   ʵ�ַ�ҳ��ѯ
            request.getRequestDispatcher("product/search_product_simple.jsp").forward(request,response);
        } else if (path.equals("/complex_search")) {
			List<Category> categories =  cmapper.findAll();
			ServletUtil.forwardPage("categories", categories, "product/search_product_complex.jsp", request, response);
		} else if (path.equals("/complex_search_complete")) {
            if (request.getParameter("categoryid") != null && !request.getParameter("categoryid").equals("")){
                int categoryid = Integer.parseInt(request.getParameter("categoryid"));
                session.setAttribute("categoryid",categoryid);
            }
            if (request.getParameter("keywords") != null && !request.getParameter("keywords").equals("")){
                String keywords = request.getParameter("keywords");
                session.setAttribute("keywords",keywords);
            }
            if (request.getParameter("lownormalprice") != null && !request.getParameter("lownormalprice").equals("")){
                int lownormalprice = Integer.parseInt(request.getParameter("lownormalprice"));
                session.setAttribute("lownormalprice",lownormalprice);
            }
            if (request.getParameter("highnormalprice") != null && !request.getParameter("highnormalprice").equals("")){
                int highnormalprice = Integer.parseInt(request.getParameter("highnormalprice"));
                session.setAttribute("highnormalprice",highnormalprice);
            }
            if (request.getParameter("lowmemberprice") != null && !request.getParameter("lowmemberprice").equals("")){
                int lowmemberprice = Integer.parseInt(request.getParameter("lowmemberprice"));
                session.setAttribute("lowmemberprice",lowmemberprice);
            }
            if (request.getParameter("highmemberprice") != null && !request.getParameter("highmemberprice").equals("")){
                int highmemberprice = Integer.parseInt(request.getParameter("highmemberprice"));
                session.setAttribute("highmemberprice",highmemberprice);
            }
            if (request.getParameter("startdate") != null && !request.getParameter("startdate").equals("")){
                String startdate = request.getParameter("startdate");
                session.setAttribute("startdate",startdate);
            }
            if (request.getParameter("enddate") != null && !request.getParameter("enddate").equals("")){
                String enddate = request.getParameter("enddate");
                session.setAttribute("enddate",enddate);
            }
			//����Щ����������������Щ����������request�,�������һҳ��ʱ���ٽ���Щ����
			//������̨
			Map<String,Object> map = new HashMap<>();
			map.put("categoryid",(int)session.getAttribute("categoryid"));
			map.put("keywords",(String) session.getAttribute("keywords"));
			map.put("lownormalprice",(double)session.getAttribute("lownormalprice"));
			map.put("highnormalprice",(double)session.getAttribute("highnormalprice"));
			map.put("lowmemberprice",(double)session.getAttribute("lowmemberprice"));
			map.put("highmemberprice",(double)session.getAttribute("highmemberprice"));
			map.put("startdate", (String)session.getAttribute("startdate"));
			map.put("enddate",(String)session.getAttribute("enddate"));
			Paging<Product> paging = new Paging<>(pageNumber,pagesize,pmapper.countComp(map));
			map.put("startIndex",paging.getStartIndex());
			map.put("pagesize",pagesize);
			List<Product> products = pmapper.complexSearchs(map);
			paging.setObjects(products);
			//ServletUtil.forwardPage("products", products, "product/search_product_complex_complete.jsp", request, response);
			//��   ת��   ʵ�ַ�ҳ��ѯ
			request.setAttribute("paging",paging);
			request.getRequestDispatcher("product/search_product_complex_complete.jsp").forward(request,response);
		} else if (path.equals("/load")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Product product = pmapper.findById(id);
			
			List<Category> categories =  cmapper.findAll();
			//��requestЯ������  ����update��ҳ��
			request.setAttribute("categories", categories);
			request.setAttribute("product", product);
			request.getRequestDispatcher("product/update_product.jsp").forward(request, response);
		} else if (path.equals("/update")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Product product = pmapper.findById(id);
			
			String name = request.getParameter("name");
			String descr = request.getParameter("descr");
			Double normalprice = Double.valueOf(request.getParameter("normalprice"));
			Double memberprice = Double.valueOf(request.getParameter("memberprice"));
			Category category = cmapper.findById(Integer.valueOf(request.getParameter("categoryid")));
			
			product.setName(name);
			product.setDescr(descr);
			product.setNormalprice(normalprice);
			product.setMemberprice(memberprice);
			product.setCategory(category);
			pmapper.update(product);
			sqlSession.commit();
			sqlSession.close();
			response.sendRedirect("list.product");
		} else if (path.equals("/delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			
			pmapper.delete(id);
			sqlSession.commit();
			sqlSession.close();
			response.sendRedirect("list.product");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
