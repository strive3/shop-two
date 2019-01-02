package com.neuedu.shop.mapper;

import java.util.List;
import java.util.Set;

import com.neuedu.shop.pojo.Category;
import org.apache.ibatis.annotations.Param;

public interface ICategoryMapper {
    int count();

    // ��ѯ����
    List<Category> findAll();

    List<Category> findToTree(int pid);

    // ����id���ҹ���Ա
    Category findById(Integer id);

    //��Ӳ�����ʱ���������3������
    Category findFather(int pid);

    void add(@Param("name") String name, @Param("descr") String descr, @Param("pid") int pid, @Param("grade") int grade);

    void updateLeafTo0(int pid);

    // ����
    void update(Category category);

    // ɾ��ʱ��������4������
    Category findForDelete(int id);

    void delete(@Param("set") Set<Integer> set);

    int findCountByPid(int pid);

    void updateLeafTo1(int pid);


}
