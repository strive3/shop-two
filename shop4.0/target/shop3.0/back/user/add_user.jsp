<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk" />

<title>�û�ע��</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" href="css/styles.css" />
<link rel="stylesheet" href="css/toastr.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.knob.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/toastr.js"></script>
<script src="js/jquery.tablesorter.min.js"></script>
<script src="js/jquery.peity.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="js/gcal.js"></script>
<script src="js/setup.js"></script>
<script type="text/javascript" src="js/prototype.js"></script>
	<script type="text/javascript">
        function register(){
            //���� XMLHttpRequest
            var xhr = new XMLHttpRequest();
            var username = document.getElementById("username").value;

            //����
            xhr.open("POST","add.user",true);
            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 || xhr.status ==200){
					 var rgmsg = xhr.responseText;
					 if (rgmsg == "�û�������ʹ��") {
                         document.getElementById("rgmsg").style.color = "green";
                         document.getElementById("rgmsg").innerHTML = rgmsg;
                     }else{
                         document.getElementById("rgmsg").style.color = "red";
                         document.getElementById("rgmsg").innerHTML = rgmsg;
					 }

                }
            };
            //post���ύ��Ϣ
            xhr.send("username="+username);
        }
		function check() {
            var pwd = document.getElementById("pwd").value;
            var repwd = document.getElementById("repwd").value;
            if (pwd != repwd) {
                document.getElementById("msg").style.color = "red";
                document.getElementById("msg").innerHTML = "������������벻һ��";
            } else {
                document.getElementById("msg").style.color = "green";
                document.getElementById("msg").innerHTML = "����ע��";
            }

        }

/*        function getUser(){
            var xhr = new XMLHttpRequest();

            xhr.open("get","list.ajax",true);
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 || xhr.status ==200){
                    var data = xhr.requestText();
                    var users = data.evalJSON();
                    for(i = 0;i < users.length;i++){
                        alert("id= " + users[i].id+",username=" + user[i].name);
                    }
                }
            }


        }*/
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />

</head>
<body>
	<!-- header���� -->
	<%@include file="../header.jsp"%>
	<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h4 class="header">����û�</h4>
						<form action="add.user" method="post">
							<table class="table table-striped sortable">
								<thead>
								</thead>
								<tbody>
									<tr>
										<th>�û���</th>

										<td><input type="text" name="username" id="username" onblur="register()"/></td>
										<span id="rgmsg" style="position:relative;top: 35px;left: 490px"></span>
									</tr>
									<tr>
										<th>����</th>
										<td><input type="password" id="pwd" name="pwd" /></td>
									</tr>
									<tr>
										<th>ȷ������</th>
										<td><input type="password" id="repwd" name="repwd" onblur="check()"/></td>
										<span id="msg" style="position:relative;top: 147px;left: 393px"></span>
									</tr>
									<tr>
										<th>�绰</th>
										<td><input type="text" name="phone" /></td>
									</tr>
									<tr>
										<th>��ַ</th>
										<td><textarea rows="9" cols="40" name="addr"></textarea></td>
									</tr>
									<tr>
										<td></td>
										<td><input class="btn btn-success" type="submit"
											value="ע��" />&nbsp;&nbsp;&nbsp;<input class="btn btn-danger"
											type="reset" value="����" /></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
<script src="js/d3-setup.js"></script>
<script>
	protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
	address = protocol + window.location.host + window.location.pathname
			+ '/ws';
	socket = new WebSocket(address);
	socket.onmessage = function(msg) {
		msg.data == 'reload' && window.location.reload()
	}
</script>
</html>