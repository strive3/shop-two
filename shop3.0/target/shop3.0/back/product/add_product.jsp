<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk" />

<title>�����Ʒ</title>
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
						<h4 class="header">�����Ʒ</h4>
						<form action="add.product" method="post">
							<table class="table table-striped sortable">
								<thead>
								</thead>
								<tbody>
									<tr>
										<th>��Ʒ����</th>
										<td><input type="text" name="name" /></td>
									</tr>
									<tr>
										<th>��Ʒ����</th>
										<td><textarea cols="20" rows="5" name="descr"></textarea></td>
									</tr>
									<tr>
										<th>��ͨ�۸�</th>
										<td>&yen;<input id="normalprice" type="text"
											name="normalprice" />Ԫ
										</td>
									</tr>
									<tr>
										<th>��Ա�۸�</th>
										<td>&yen;<input id="memberprice" type="text"
											name="memberprice" readonly="readonly" />Ԫ
										</td>
									</tr>

									<tr>
										<th>��Ʒ���</th>
										<td><select name="categoryid">
												<c:forEach var="c" items="${categories }">
													<c:if test="${c.grade ==3 }">
														<option value="${c.id }">${c.name }</option>
													</c:if>
												</c:forEach>
										</select></td>
									</tr>

									<tr>
										<td></td>
										<td><input class="btn btn-success" type="submit"
											value="���" />&nbsp;&nbsp;&nbsp;<input class="btn btn-danger"
											type="reset" value="����" /></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</form>
						<script>
							(function(){ 
								$("#normalprice").blur(function(){
									$("#memberprice").val(Math.round($("#normalprice").val() * 0.8 * 100.00)/ 100.00);
								});
							 }()); 
						</script>
						<!-- <script>
							(function(){
								$("#normalprice").blur(function(){
									$("#memberprice").val(Math.round($("#normalprice").val() * 0.8 * 100.00)/ 100.00);
								});
							})();
						</script> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
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