package com.neuedu.shop.mapper;
/**
 * ��Admin������Ӧ��crud
 *
 * @author ������
 */

import java.util.List;
import java.util.Map;

import com.neuedu.shop.entity.Paging;
import com.neuedu.shop.entity.Product;
import org.apache.ibatis.annotations.Param;

public interface IProductMapper {
    /**
     * ��ѯ����
     *
     * @return products
     */
    List<Product> findAll();

    /**
     * �����Ʒ
     *
     * @param product
     */
    void add(Product product);

    // ɾ��
    void delete(Integer id);

    // ����
    void update(Product product);

    /**
     * ͨ��id�ҵ���Ʒ
     * @param id
     * @return
     */
    Product findById(Integer id);

    /**
     * ������ ���չؼ�������
     */
    //Paging<Product> findByKeywords(String keywords, int rownum, int pagesize);
    List<Product> findByKeywords(@Param("keywords") String keywords, @Param("startIndex") int rownum, @Param("pagesize") int pagesize);

    /**
     * ���Ӳ�ѯ
     */
    List<Product> complexSearchs(Map<String, Object> map);

    List<Product> findLastByPagings(Map<String, Object> map);


    /**
     * ��ѯһ������������
     */
    int count(String sql);

    int countAll();

    int countSimple(String keywords);

    int countComp(Map<String, Object> map);
}
