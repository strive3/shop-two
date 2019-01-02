package com.neuedu.shop.pojo;

import lombok.Data;

import java.util.List;

/**
 * @author ������
 * @create 2018-11-30 16:16
 */
@Data
public class Paging<T> {
    //limit��ƫ����
    private int startIndex;
    //��ǰҳ��
    private int pageNumber;
    //һҳ��ʾ���ٸ�
    private int pageSize;
    //һ������������
    private int count;
    //��ҳ
    private int startPage;
    //����ҳ
    private int endPage;
    //һ������ҳ
    private int pages;
    //�浱ǰҳ��ʾ������
    private List<T> objects;

    public Paging() {

    }

    public Paging(int pNumber, int pageSize, int count) {
        this.count = count;

        this.pageSize = pageSize;

        //��ҳ��
        if (count % pageSize == 0) {
            this.pages = count / pageSize;
        } else {
            this.pages = count / pageSize + 1;
        }
        //��pageNumber��ֵ
        if (pages != 0){
            if (pNumber > 0 && pNumber <= pages) {
                this.pageNumber = pNumber;
            } else if (pNumber <= 0) {
                this.pageNumber = 1;
            } else {
                this.pageNumber = pages;
            }
        }else {
            this.pageNumber = 1;
        }


        this.startIndex = (this.pageNumber - 1) * pageSize;
        //һ���ж���ҳ
        this.endPage = (int) Math.ceil((double)count / (double)pageSize);

      /*  if (pages <= 5){
            this.startPage = 1;
            this.endPage = pages;
        }else {
            if (pageNumber <= 3){
                this.startPage = 1;
            } else {
                this.startPage = pageNumber - 2;
                if (pages - pageNumber <= 2){
                    this.endPage = pages;
                }else {
                    this.endPage = pageNumber + 2;
                }
            }
        }*/
    }

}