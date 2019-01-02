package com.neuedu.shop.util;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author ������
 * @create 2018-12-04 20:17
 */
public class DruidConnectionPool {
    //����һ��DataSource����
    private static DataSource dataSource = null;
    public static DataSource getDruidDataSource(){
        try {
            if (dataSource == null){
               dataSource = DruidDataSourceFactory.createDataSource(getDataProperties());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataSource;
    }

    //��ȡ���ݿ����ӳ������ļ�
    public static Properties getDataProperties(){
        InputStream is = DruidConnectionPool.class.getResourceAsStream("dataSource.properties");
        Properties prop = new Properties();
        try {
            prop.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return prop;
}

        //��ȡ���ݿ�����
    public static Connection getConnection(){
        try {
            return getDruidDataSource().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
