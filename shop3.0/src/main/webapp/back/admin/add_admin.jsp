<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk" />

<title>����Աע��</title>
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
						<h4 class="header">����Աע��</h4>
						<form action="registAdmin.do" method="post">
							<table class="table table-striped sortable">
								<thead>
								</thead>
								<tbody>
									<tr>
										<th>�û���</th>

										<td><input type="text" name="aname" /><span class="error"></td>
									</tr>
									<tr>
										<th>����</th>
										<td><input type="password" name="apwd" /></td>
									</tr>
									<tr>
										<th>ȷ������</th>
										<td><input type="password" name="confirmpwd" /></td>
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