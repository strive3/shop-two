package com.neuedu.shop.util;

import java.util.UUID;

/**
 * @author ������
 * @create 2018-12-03 21:26
 */
public class CodeUtil {
    //����Ψһ�ļ�����
    public static String generateUniqueCode() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
