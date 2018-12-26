<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>����ƽ̨����ҳ��</title>
    <meta charset="gbk" />
    <!--js-->
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/common.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/ddsmoothmenu.js"></script>
    <script src="js/jquery.flexslider.js"></script>
    <script src="js/jquery.elastislide.js"></script>
    <script src="js/jquery.jcarousel.min.js"></script>
    <script src="js/jquery.accordion.js"></script>
    <script src="js/light_box.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".inline").colorbox({
                inline : true,
                width : "50%"
            });
        });
    </script>
    <!--end js-->

    <!-- Mobile Specific Metas ================================================== -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS ================================================== -->

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/orange.css">
    <link rel="stylesheet" href="css/skeleton.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/ddsmoothmenu.css" />
    <link rel="stylesheet" href="css/elastislide.css" />
    <link rel="stylesheet" href="css/home_flexslider.css" />

    <link rel="stylesheet" href="css/light_box.css" />
    <script src="js/html5.js"></script>

    <link rel="stylesheet" href="css/tasp.css" />
    <link href="css/orderconfirm.css" rel="stylesheet" />

    <style>
        #page {
            width: auto;
        }

        #comm-header-inner, #content {
            width: 950px;
            margin: auto;
        }

        #logo {
            padding-top: 26px;
            padding-bottom: 12px;
        }

        #header .wrap-box {
            margin-top: -67px;
        }

        #logo .logo {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 140px;
            height: 35px;
            font-size: 35px;
            line-height: 35px;
            color: #f40;
        }

        #logo .logo .i {
            position: absolute;
            width: 140px;
            height: 35px;
            top: 0;
            left: 0;
            background: url(http://a.tbcdn.cn/tbsp/img/header/logo.png);
        }
    </style>

</head>
<body data-spm="1">
<div id="page">
    <!--Header Block-->
    <div class="header-wrapper">
        <%@include file="header.jsp"%>
    </div>
    <div id="content" class="grid-c">
        <div id="address" class="address" style="margin-top: 20px;"
             data-spm="2">
            <form name="addrForm" id="addrForm" action="">
                <h3>
                    ȷ���ջ���ַ <span class="manage-address"> <a href="#"
                                                            title="�����ҵ��ջ���ַ" class="J_MakePoint">�����ջ���ַ</a>
						</span>
                </h3>
                <ul id="address-list" class="address-list">
                    <li class="J_Addr J_MakePoint clearfix  J_DefaultAddr "><s
                            class="J_Marker marker"></s> <span class="marker-tip">������</span>
                        <div class="address-info">
                            <a href="#" class="J_Modify modify J_MakePoint">�޸ı���ַ</a> <input
                                name="address" class="J_MakePoint " type="radio" value=""
                                id="addrId_674944241" checked="checked"> <label
                                class="user-address"> ${salesorder.user.addr}(${salesorder.user.username}��)<em>${salesorder.user.phone}</em>
                        </label> <em class="tip" style="display: none">Ĭ�ϵ�ַ</em> <a
                                class="J_DefaultHandle set-default J_MakePoint" href="#"
                                style="display: none">����ΪĬ���ջ���ַ</a>
                        </div></li>
                    <li class="J_Addr J_MakePoint clearfix"><s
                            class="J_Marker marker"></s> <span class="marker-tip">������</span>
                        <div class="address-info">
                            <a href="#" class="J_Modify modify J_MakePoint"
                               data-point-url="#">�޸ı���ַ</a> <input name="address"
                                                                   class="J_MakePoint" type="radio" value="594209677"
                                                                   id="addrId_594209677" data-point-url="#" ah:params="#">
                            <label for="addrId_594209677" class="user-address">
                                ${salesorder.user.addr}(${salesorder.user.username}��)<em>${salesorder.user.phone}</em>
                            </label><em class="tip" style="display: none">Ĭ�ϵ�ַ</em> <a
                                class="J_DefaultHandle set-default J_MakePoint"
                                style="display: none" data-point-url="#" href="#">����ΪĬ���ջ���ַ</a>
                        </div></li>
                </ul>
                <ul id="J_MoreAddress" class="address-list hidden">
                </ul>
                <div class="address-bar">
                    <a href="#" class="new J_MakePoint" id="J_NewAddressBtn">ʹ���µ�ַ</a>
                </div>
            </form>
        </div>
        <form id="J_Form" name="J_Form" action="" method="post">
            <div>
                <h3 class="dib">ȷ�϶�����Ϣ</h3>
                <table cellspacing="0" cellpadding="0" class="order-table"
                       id="J_OrderTable" summary="ͳһ�µ�������Ϣ����">
                    <caption style="display: none">ͳһ�µ�������Ϣ����</caption>
                    <thead>
                    <tr>
                        <th class="s-title">���̱���
                            <hr />
                        </th>
                        <th class="s-price">����(Ԫ)
                            <hr />
                        </th>
                        <th class="s-amount">����
                            <hr />
                        </th>
                        <th class="s-agio">�Żݷ�ʽ(Ԫ)
                            <hr />
                        </th>
                        <th class="s-total">С��(Ԫ)
                            <hr />
                        </th>
                    </tr>
                    </thead>

                    <c:forEach var="c" items="${cart.cItems}">
                    <tbody data-spm="3" class="J_Shop" data-tbcbid="0"
                           data-outorderid="47285539868" data-isb2c="false"
                           data-postMode="2" data-sellerid="1704508670">
                    <tr class="first">
                        <td colspan="5"></td>
                    </tr>
                    <tr class="shop blue-line">
                        <td colspan="3">���̣�<a class="J_ShopName J_MakePoint"
                                              href="#" title="Զ���С�̵�">������С�̵�</a> <span class="seller">���ң�<a
                                href="#" class="J_MakePoint">����</a></span> <span class="J_WangWang"
                                                                                 data-nick="Զ��" data-display="inline"></span>

                        </td>
                        <td colspan="2" class="promo">
                            <div>
                                <ul class="scrolling-promo-hint J_ScrollingPromoHint">
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr class="item">
                        <td class="s-title"><a href="#" target="_blank"
                                               title="${c.product.name}" class="J_MakePoint"> <img src=""
                                                                                          class="itempic"><span class="title J_MakePoint">${c.product.name}</span></a>

                            <div class="props">
                                <span>${c.product.descr}</span>
                            </div> <a title="�����߱��Ϸ������ҳ�ŵ��Ʒ��ʵ����" href="#" target="_blank"> <img
                                    src="http://img03.taobaocdn.com/tps/i3/T1bnR4XEBhXXcQVo..-14-16.png" />
                            </a>
                            <div>
                                <span style="color: gray;">���ҳ�ŵ72Сʱ�ڷ���</span>
                            </div></td>
                        <td class="s-price"><span class='price '> <em
                                class="style-normal-small-black J_ItemPrice">${c.product.normalprice}</em>
								</span></td>
                        <td class="s-amount" data-point-url="">${c.qty}</td>
                        <td class="s-agio">
                            <div class="J_Promotion promotion" data-point-url="">���Ż�</div>
                        </td>
                        <td class="s-total"><span class='price '> <em
                                class="style-normal-bold-red J_ItemTotal ">${c.totals}</em>
								</span></td>
                    </tr>
                    <tr class="item-service">
                        <td colspan="5" class="servicearea" style="display: none"></td>
                    </tr>
                    <tr class="blue-line" style="height: 2px;">
                        <td colspan="5"></td>
                    </tr>
                    <tr class="other other-line">
                        <td colspan="5">
                            <ul class="dib-wrap">
                                <li class="dib user-info">
                                    <ul class="wrap">
                                        <li>
                                            <div class="field gbook">
                                                <label class="label">���������ԣ�</label>
                                                <textarea style="width: 350px; height: 80px;"
                                                          title="ѡ��Ա��ν��׵Ĳ���˵����������д�Ѿ������Ҵ��һ�µ�˵����" name=""></textarea>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dib extra-info">
                                    <div class="shoparea">
                                        <ul class="dib-wrap">
                                            <li class="dib title">�����Żݣ�</li>
                                            <li class="dib sel"><div
                                                    class="J_ShopPromo J_Promotion promotion clearfix"
                                                    data-point-url="http://log.mmstat.com/buy.1.16"></div></li>
                                            <li class="dib fee"><span class='price '> -<em
                                                    class="style-normal-bold-black J_ShopPromo_Result">0.00</em>
													</span></li>
                                        </ul>
                                    </div>
                                    <div class="shoppointarea"></div>
                                    <div class="farearea">
                                        <ul class="dib-wrap J_farearea">
                                            <li class="dib title">���ͷ�ʽ��</li>
                                            <li class="dib sel"
                                                data-point-url="http://log.mmstat.com/jsclick?cache=*&tyxd=wlysfs">
                                                <select name="1704508670:2|post" class="J_Fare">
                                                    <option value="" selected="selected">��� 15.00Ԫ </option>
                                                    <option value="">EMS 25.00Ԫ </option>
                                                    <option value="">ƽ�� 15.00Ԫ </option>
                                                </select><em tabindex="0" class="J_FareFree" style="display: none">���ʷ�</em>
                                            </li>
                                            <li class="dib fee"><span class='price '> <em
                                                    class="style-normal-bold-red J_FareSum">30.00</em>
													</span></li>
                                        </ul>
                                    </div>
                                    <div class="extra-area">
                                        <ul class="dib-wrap">
                                            <li class="dib title">����ʱ�䣺</li>
                                            <li class="dib content">���ҳ�ŵ��������Ҹ����72Сʱ��<a href="#">����</a></li>
                                        </ul>
                                    </div>

                                    <div class="servicearea" style="display: none"></div>
                                </li>
                            </ul>
                        </td>
                    </tr>

                    <tr class="shop-total blue-line">
                        <td colspan="5">���̺ϼ�(<span class="J_Exclude"
                                                   style="display: none">��</span>���˷�<span class="J_ServiceText"
                                                                                          style="display: none">�������</span>)�� <span
                                class='price g_price '> <span>&yen;</span><em
                                class="style-middle-bold-red J_ShopTotal">${c.totals}</em>
								</span> <input type="hidden" name="1704508670:2|creditcard"
                                               value="false" /> <input type="hidden" id="J_IsLadderGroup"
                                                                       name="isLadderGroup" value="false" />

                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="5">
                            <div class="order-go" data-spm="4">
                                <div class="J_AddressConfirm address-confirm">
                                    <div class="kd-popup pop-back" style="margin-bottom: 40px;">
                                        <div class="box">
                                            <div class="bd">
                                                <div class="point-in">
                                                    <em class="t">ʵ���</em> <span class='price g_price '>
																<span>&yen;</span><em class="style-large-bold-red"
                                                                                      id="J_ActualFee">${cart.totals }</em>
															</span>
                                                </div>

                                                <ul>
                                                    <li><em>������:</em><span id="J_AddrConfirm"
                                                                           style="word-break: break-all;">${salesorder.user.addr} </span></li>
                                                    <li><em>�ջ���:</em><span id="J_AddrNameConfirm">${salesorder.user.username}
																	${salesorder.user.phone} </span></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <a href="cart.pre" class="back J_MakePoint" target="_top"
                                           data-point-url="">���ع��ﳵ</a> <a id="J_Go" class=" btn-go" href="pay.pre?id=${salesorder.id}"
                                                                          data-point-url="" tabindex="0" title="����˰�ť�����">����<b
                                            class="dpl-button"></b></a>
                                    </div>
                                </div>

                                <div class="J_confirmError confirm-error">
                                    <div class="msg J_shopPointError" style="display: none;">
                                        <p class="error">���ֵ�������Ϊ����0������</p>
                                    </div>
                                </div>


                                <div class="msg" style="clear: both;">
                                    <p class="tips naked" style="float: right; padding-right: 0">���۸�䶯�������ύ��������ϵ���Ҹļۣ����鿴���򵽵ı���</p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </div>


</div>
<!--ҳ�ſ�ʼ-->
<section class="footer-wrapper">
    <%@include file="footer.jsp"%>
</section>
<!--ҳ�Ž���-->
</body>
</html>
