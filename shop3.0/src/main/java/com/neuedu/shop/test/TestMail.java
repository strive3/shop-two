package com.neuedu.shop.test;

import com.neuedu.shop.entity.User;
import com.neuedu.shop.util.CodeUtil;
import com.neuedu.shop.util.MailUtil;
import com.neuedu.shop.util.VerifyCodeUtils;

/**
 * @author ������
 * @create 2018-12-03 21:31
 */
public class TestMail {

    public static void main(String[] args) {
        String email = "335985836@qq.com";
        String str1 = "";
        //����������ʽ���ɸĽ�����֤�����Ƿ��������ĸ�ʽ
        if(!email.matches("^\\w+@(\\w+\\.)+\\w+$")){
            System.out.println("�����ʽ����");
        }
//        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
//        System.out.println(verifyCode);
        String verifyCode1 = CodeUtil.generateUniqueCode();

        MailUtil mailUtil = new MailUtil(email, verifyCode1);
        mailUtil.run();
    }
}
