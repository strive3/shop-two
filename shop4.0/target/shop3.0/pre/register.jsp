<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="gbk">
    <title>����ƽ̨�û���¼</title>

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
        $(document).ready(function () {
            $(".inline").colorbox({
                inline: true,
                width: "50%"
            });
        });
    </script>
    <!--end js-->

    <!-- Mobile Specific Metas ================================================== -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/orange.css">
    <link rel="stylesheet" href="css/skeleton.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/ddsmoothmenu.css"/>
    <link rel="stylesheet" href="css/elastislide.css"/>
    <link rel="stylesheet" href="css/home_flexslider.css"/>

    <link rel="stylesheet" href="css/light_box.css"/>
    <script src="js/html5.js"></script>
    <script type="text/javascript" src="js/prototype.js"></script>
    <script>
        //�����䷢����֤���ajax
        function register() {
            var mail = document.getElementById("mail").value;
            //���� XMLHttpRequest
            var xhr = new XMLHttpRequest();
            //����
            xhr.open("POST", "code.pre", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 || xhr.status == 200) {
                    var msg = xhr.responseText;
                    document.getElementById("send_msg").innerHTML = msg;
                    if (msg == "��֤���ѷ�������,��ע�����") {
                        document.getElementById("send_msg").style.color = "green";
                    } else {
                        document.getElementById("send_msg").style.color = "red";
                    }
                }
            };
            //post���ύ��Ϣ
            xhr.send("mail=" + mail);
        }

        //��֤�û����ܷ�ʹ�õ�ajax
        function verify() {
            //���� XMLHttpRequest
            var xhr = new XMLHttpRequest();
            var username = document.getElementById("username").value;

            //����
            xhr.open("POST", "register.pre", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 || xhr.status == 200) {
                    var rgmsg = xhr.responseText;
                    if (rgmsg == "�û�������ʹ��") {
                        document.getElementById("rgmsg").style.color = "green";
                        document.getElementById("rgmsg").innerHTML = rgmsg;
                    } else {
                        document.getElementById("rgmsg").style.color = "red";
                        document.getElementById("rgmsg").innerHTML = rgmsg;
                    }

                }
            };
            //post���ύ��Ϣ
            xhr.send("username=" + username);
        }

        //�ж���������������Ƿ�һ�µ�js
        function check() {
            var pwd = document.getElementById("psw").value;
            var repwd = document.getElementById("repsw").value;
            if (pwd != repwd) {
                document.getElementById("msg").style.color = "red";
                document.getElementById("msg").innerHTML = "������������벻һ��";
            } else {
                document.getElementById("msg").style.color = "green";
                document.getElementById("msg").innerHTML = "����ע��";
            }

        }

    </script>

</head>
<body>
<div class="mainContainer sixteen container">
    <!--Header Block-->
    <div class="header-wrapper">
        <%@include file="header.jsp" %>

    </div>
    <!--Content Block-->
    <section class="content-wrapper">
        <div class="content-container container">
            <div class="main">
                <h1 class="page-title">��¼|ע��</h1>
                <div class="account-login">
                    <div class="new-users">
                        <div class="content">
                            <h2>���û�</h2>

                            <form action="register.pre" method="post">
                                <div class="registered-users">
                                    <div class="content">

                                        <ul class="form-list">
                                            <li><label class="required" for="email">�û���<em>*</em>
                                            </label>
                                                <div class="input-box">
                                                    <input type="text" title="�û���" id="username" onblur="verify()"
                                                           class="input-text required-entry validate-email" value=""
                                                           name="username"/>
                                                    <span style="position: absolute;top: 119px;left: 350px;"
                                                          id="rgmsg"></span>
                                                </div>
                                                <div class="clear"></div>
                                            </li>
                                            <li><label class="required" for="pass">����<em>*</em></label>
                                                <div class="input-box">
                                                    <input type="password" title="����" name="pwd" id="psw"
                                                           class="input-text required-entry validate-password"/>
                                                </div>
                                                <div class="clear"></div>
                                            </li>
                                            <li><label class="required" for="pass">ȷ������<em>*</em></label>
                                                <div class="input-box">
                                                    <input type="password" title="����" name="repwd" onblur="check()"
                                                           id="repsw"
                                                           class="input-text required-entry validate-password"/>
                                                    <span style="position: absolute;top: 240px;left: 350px"
                                                          id="msg"></span>
                                                </div>
                                                <div class="clear"></div>
                                            </li>
                                            <li><label class="required" for="pass">�绰<em>*</em></label>
                                                <div class="input-box">
                                                    <input type="text" title="�绰" name="phone"
                                                           class="input-text required-entry validate-password"/>
                                                </div>
                                                <div class="clear"></div>
                                            </li>

                                            <li><label class="required" for="mail">��������<em>*</em></label>
                                                <div class="input-box">
                                                    <input type="text" title="��������" name="mail" id="mail"
                                                           class="input-text required-entry validate-password"/>
                                                </div>
                                                <div class="clear"></div>
                                                <span>���ǻ������ĵ������䷢����֤�룬�����ע��</span>
                                                <input onclick="register()"
                                                       style="position: absolute;top: 356px;left: 262px" type="button"
                                                       class="orange-btn" value="�����ʼ�"/>
                                                <span id="send_msg"
                                                      style="position: absolute;left: 350px;top: 364px"></span>
                                            </li>

                                            <li><label class="required" for="pass">������<em>*</em></label>
                                                <div class="input-box">
                                                    <input type="text" title="�绰" name="code"
                                                           class="input-text required-entry validate-password"/>
                                                    <span style="color: red">${err_msg}</span>
                                                </div>
                                                <div class="clear"></div>
                                            </li>
                                            </table>
                                            <li><label class="required" for="pass">��ַ<em>*</em></label>
                                                <div class="input-box">
                                                    <textarea class="input-text required-entry validate-password"
                                                              rows="9" cols="40" name="addr"></textarea>
                                                </div>
                                                <div class="clear"></div>
                                            </li>
                                        </ul>
                                        <p class="required">* ������</p>
                                    </div>
                                    <div class="buttons-set">
                                        <a class="f-left" href="#">��������?</a> <input class="orange-btn"
                                                                                    type="submit" value="ע��"/></a>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="clear"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="news-letter-container">
                <div class="free-shipping-block">
                    <h1>ENJOY FREE SHIPPING</h1>
                    <p>on all orders as our holiday gift for you!</p>
                </div>
                <div class="news-letter-block">
                    <h2>SIGN UP FOR OUR NEWSLETTER</h2>
                    <input type="text" value="Enter email address" title=""/> <input
                        type="submit" value="Submit" title="Submit"/>
                </div>
            </div>
        </div>
    </section>
</div>
<!--ҳ�ſ�ʼ-->
<section class="footer-wrapper">
    <%@include file="footer.jsp" %>
</section>
<!--ҳ�Ž���-->
</body>
</html>