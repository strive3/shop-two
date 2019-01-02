package com.neuedu.shop.servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.shop.mapper.ICategoryMapper;
import com.neuedu.shop.pojo.Category;
import com.neuedu.shop.pojo.Paging;
import com.neuedu.shop.util.MybatisUtil;
import com.neuedu.shop.util.ServletUtil;
import org.apache.ibatis.session.SqlSession;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("*.category")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    List<Category> list = new ArrayList<>();

    //�ݹ� ȡ�� categoryList�е�category
    public void recursionAddCategory(Category category){
        //�����������category��û������������ѭ��
        if (category.getCategoryList().size() == 0){
            return;
        }
        for (int i = 0; i < category.getCategoryList().size();i++){
            //��ӵ��Ǵ���category����һ�������
            list.add(category.getCategoryList().get(i));
            //�ٽ���һ�������ݹ�
            recursionAddCategory(category.getCategoryList().get(i));
        }
    }
    public void addCategory(int pid , String name ,String descr ){
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ICategoryMapper cmapper = sqlSession.getMapper(ICategoryMapper.class);
        try {
            //���ҵ���������û�и����   ��ô��ӵĵ�ǰ���Ϊ�����
            Category category = cmapper.findFather(pid);
            if (category == null){
                cmapper.add(name,descr,pid, 1);
            }else {
                //����и������ôgrade ���ڸ����Ļ����ϼ�1
                cmapper.add(name,descr,pid,category.getGrade() + 1);
                System.out.println(category);
            }
            //��������leaf ��Ϊfalse
            cmapper.updateLeafTo0(pid);
            sqlSession.commit();

        }catch (Exception e){
            sqlSession.rollback();
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
    }
    Set<Integer> set = new HashSet<>();

    //����ݹ�Ͳ�ѯ��ʱ��ݹ�һ��
    public void deleteId(Category category ){
        for (int i = 0; i < category.getCategoryList().size();i++){
            set.add(category.getCategoryList().get(i).getId());
            //���������û��categoryʱ����
            if (category.getCategoryList().get(i) == null){
                return;
            }
            deleteId(category.getCategoryList().get(i));
        }
        set.add(category.getId());
    }
    public void  deleteCategory(int id){
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ICategoryMapper mapper = sqlSession.getMapper(ICategoryMapper.class);
        try {
            //ͨ��������ID�ҵ���ǰ��category
            Category category = mapper.findForDelete(id);
            //�ҵ���ǰcategory�µ�����������id
            deleteId(category );
            //ɾ��
            mapper.delete(set);
            //�����ǰcategory�ĸ��׻����ֽڵ� ��ô��ִ��
            if (mapper.findCountByPid(category.getPid()) <= 0) {
                mapper.updateLeafTo1(category.getPid());
            }
            sqlSession.commit();
        }catch (Exception e){
            sqlSession.rollback();
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }

    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = ServletUtil.getPath(request, response);

        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ICategoryMapper cmapper = sqlSession.getMapper(ICategoryMapper.class);
        if (path.equals("/list")) {
            int pageNumber = 1;
            int pageSize = 10;
            int count = cmapper.count();
            String pageNumberS = request.getParameter("pageNumber");
            if ( pageNumberS!= null && !pageNumberS.equals("")){
                pageNumber = Integer.parseInt(pageNumberS);
            }
            Paging<Category> paging = new Paging<>(pageNumber,pageSize,count);
            //��ҳ
            List<Category> categories = cmapper.findToTree(0);
            //�ݹ��ó�����category����categorylist�е������
            for (int j = 0; j < categories.size(); j++){
                list.add(categories.get(j));
                recursionAddCategory(categories.get(j));
            }
            if (count % pageSize == 0){
                list = list.subList(paging.getStartIndex(), pageSize * pageNumber);
            } else{
                if (paging.getPageNumber() >= paging.getEndPage()){
                    list = list.subList(paging.getStartIndex(), paging.getCount());
                } else {
                    list = list.subList(paging.getStartIndex(), paging.getPageSize() * paging.getPageNumber());
                }
            }
            paging.setObjects(list);
            String pname = "";
            // ����һ��map �洢 pid ��Ӧ�� pname
            Map<Integer, String> maps = new HashMap<>();
            for (int i = 0; i < paging.getObjects().size(); i++) {
                if (paging.getObjects().get(i).getPid() != 0) {
                    pname = cmapper.findById(paging.getObjects().get(i).getPid()).getName();
                    maps.put(paging.getObjects().get(i).getPid(), pname);
                }
            }
            // ServletUtil.forwardPage("categories", categories, "category/categories.jsp",
            // request, response);
            request.setAttribute("paging",paging);
            request.setAttribute("maps", maps);
            request.getRequestDispatcher("category/categories.jsp").forward(request, response);
            //��Ϊ�˴�listΪ��Ա������ÿ�ε����귽����Ҫ�����������³�ʼ��
            list = new ArrayList<>();
        } else if (path.equals("/add_root")) {
            // ҳ����ת
            request.getRequestDispatcher("category/add_category_root.jsp").forward(request, response);
        } else if (path.equals("/addroot")) {
            String name = request.getParameter("name");
            String descr = request.getParameter("descr");

            addCategory(0,name,descr);

            response.sendRedirect("list.category");
        } else if (path.equals("/add_child")) {
            // Я��pid ��ת�����������ҳ��
            int id = Integer.parseInt(request.getParameter("pid"));
            Category category = cmapper.findById(id);
            ServletUtil.forwardPage("category", category, "category/add_category_child.jsp", request, response);
        } else if (path.equals("/addchild")) {
            String name = request.getParameter("name");
            String descr = request.getParameter("descr");
            int id = Integer.parseInt(request.getParameter("id"));

            addCategory(id,name,descr);
            response.sendRedirect("list.category");
        } else if (path.equals("/delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            deleteCategory(id);

            response.sendRedirect("list.category");
            set = new HashSet<>();
        } else if (path.equals("/load")) {
            int id = Integer.parseInt(request.getParameter("id"));

            Category category = cmapper.findById(id);
            ServletUtil.forwardPage("category", category, "category/update_category.jsp", request, response);
        } else if (path.equals("/update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String descr = request.getParameter("descr");
            Category category = cmapper.findById(id);
            category.setName(name);
            category.setDescr(descr);

            cmapper.update(category);
            sqlSession.commit();
            sqlSession.close();

            response.sendRedirect("list.category");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }


}
