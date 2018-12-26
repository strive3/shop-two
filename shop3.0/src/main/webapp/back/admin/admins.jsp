<%@page import="com.neuedu.shop.entity.Paging"%>
<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" isELIgnored="false" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="gbk"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
	<meta name="description" content="description of your site"/>
	<meta name="author" content="author of the site"/>
	<title>����ƽ̨��̨��ҳ</title>
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<link rel="stylesheet" href="css/bootstrap-responsive.css"/>
	<link rel="stylesheet" href="css/styles.css"/>
	<link rel="stylesheet" href="css/toastr.css"/>
	<link rel="stylesheet" href="css/fullcalendar.css"/>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.knob.js"></script>
	<script src="http://d3js.org/d3.v3.min.js"></script>
	<script src="js/jquery.sparkline.min.js"></script>
	<script src="js/toastr.js"></script>
	<script src="js/jquery.tablesorter.min.js"></script>
	<script src="js/jquery.peity.min.js"></script>
	<script src="js/fullcalendar.min.js"></script>
	<script src="js/gcal.js"></script>
	<script src="js/setup.js"></script>
</head>
<body>
<%@include file="../header.jsp"%>
	<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<a href="#newUserModal" data-toggle="modal" class="btn pull-right">��ӹ���Ա</a>
						<h4 class="header">����Ա�б�</h4>
						<table class="table table-striped sortable">
							<thead>
								<tr>
									<th>����ԱID</th>
									<th>����Ա�û���</th>
									<th>����</th>

								</tr>
							</thead>
							<tbody>
								<%
									Paging<Admin> paging = (Paging<Admin>) request.getAttribute("paging");
									for (Admin a : paging.getObjects()) {
								%>
								<tr>
									<td><%=a.getId()%></td>
									<td><%=a.getAname()%></td>
									<td><%=a.getApwd()%></td>

									<td>
										<div class="btn-group">
											<button class="btn">����</button>
											<button data-toggle="dropdown" class="btn dropdown-toggle">
												<span class="caret"></span>
											</button>
											<ul class="dropdown-menu">

												<!-- �޸� ʹ�ã���id��Ϊ��������-->
												<li><a href="#">�༭�û���</a> <a
													href="load.admin?id=<%=a.getId()%>">�޸�</a> <a
													href="javascript:;" onclick="del(<%=a.getId()%>)">ɾ��</a></li>
												<script>
													function del(id) {
														if(confirm("ȷ��Ҫɾ����")){
															window.location.href="delete.admin?id=" + id;
														}
													}
												</script>
											</ul>
										</div>
									</td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>
						<div class="pagination pagination-centered">
							<form action="adminlist.admin" method="post">
							<ul>
								<li class="active"><a>��${paging.pageNumber }ҳ</a></li>
								<li><a href="adminlist.admin?pageNumber=1">��ҳ</a></li>
								<li><a href="adminlist.admin?pageNumber=${paging.pageNumber - 1}">��һҳ</a></li>
								<li><a href="adminlist.admin?pageNumber=${paging.pageNumber + 1}">��һҳ</a></li>
								<li><a href="adminlist.admin?pageNumber=${paging.pages }">βҳ</a></li>
								<li class="active"><a>��${paging.pages }ҳ</a></li>
								<li><span style="display:flex;height: 20px;line-height: 20px;border-color: transparent;">����<input style="align-items: center;height: 10px;width: 23px" type="text" name="pageNumber" oninput="value=value.replace(/[^\d]/g,'')">ҳ<input style="align-items: center;height: 20px;line-height: 16px;" type="submit" value="ȷ��"></span></li>
							</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="newUserModal" class="modal hide fade">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" aria-hidden="true"
						class="close">&times;</button>
					<h3>�½�����Ա</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="add.admin" method="post" />
					<div class="control-group">
						<label for="inputEmail" class="control-label">�˺�</label>
						<div class="controls">
							<input id="inputEmail" type="text" placeholder="�������û���"
								name="aname" />
						</div>
					</div>
					<div class="control-group">
						<label for="inputCurrentPassword" class="control-label">����
						</label>
						<div class="controls">
							<input id="inputCurrentPassword" type="password"
								placeholder="����������" name="apwd" />
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" data-dismiss="modal" class="btn">�ر�</a><input
							type="submit" class="btn btn-primary" value="���" />
					</div>
				</div>
				</form>
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