package com.neuedu.shop.util;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUtil {
	private static void setEncoding(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		request.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
	}
	public static String getPath(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		setEncoding(request, response);
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		return path;
	}
	
	public static void forwardPage(String key, Object items, String pagePath, HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		request.setAttribute(key, items);
		request.getRequestDispatcher(pagePath).forward(request, response);
	}
	/**
	 * ���ַ�������MD5����
	 * @param key  ����һ���ַ���
	 * @return	����md5���ܵĽ��
	 */
	public static String getMD5(String str) {
        try {
            // ����һ��MD5���ܼ���ժҪ
            MessageDigest md = MessageDigest.getInstance("MD5");
            // ����md5����
            md.update(str.getBytes());
            // digest()���ȷ������md5 hashֵ������ֵΪ8Ϊ�ַ�������Ϊmd5 hashֵ��16λ��hexֵ��ʵ���Ͼ���8λ���ַ�
            // BigInteger������8λ���ַ���ת����16λhexֵ�����ַ�������ʾ���õ��ַ�����ʽ��hashֵ
            return new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
           e.printStackTrace();
           return null;
        }
    }

}
