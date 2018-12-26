<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk" />

<title>������Ʒ</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" href="css/styles.css" />
<link rel="stylesheet" href="css/toastr.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<style>
.rmb {
	width: 100px;
}
</style>
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
<!-- ������js -->
<script src="laydate/laydate.js"></script>

<script type="text/javascript">
	function calMemberPrice() {
		var normalprice = document.getElementById("normalprice").value;//1000.00
		//���û���ʾ80%�ļ۸񣬲����ᴫ��������ˣ�Ҳ�������û�����
		document.getElementById("memberprice").value = normalprice * .8;
	}

	function checkForm(frm) {
		var lownormalprice = $("#lownormalprice").val();
		var highnormalprice = document.getElementById("highnormalprice").value;
		var lowmemberprice = document.getElementById("lowmemberprice").value;
		var highmemberprice = document.getElementById("highmemberprice").value;

		if (lownormalprice == "" || isNaN(lownormalprice)) {
			$("#lownormalprice").val(0);
		}
		if (highnormalprice == "" || isNaN(highnormalprice)) {
			document.getElementById("highnormalprice").value = 0;
		}
		if (lowmemberprice == "" || isNaN(lowmemberprice)) {
			document.getElementById("lowmemberprice").value = 0;
		}
		if (highmemberprice == "" || isNaN(highmemberprice)) {
			document.getElementById("highmemberprice").value = 0;
		}
		return true;
	}
</script>
<script type="text/javascript">
	//ִ��һ��laydateʵ��
	laydate.render({
		elem : '#startdate' //ָ��Ԫ��
	});

	laydate.render({
		elem : '#enddate' //ָ��Ԫ��
	});
</script>
</head>
<body>
	<!-- header���� -->
	<%@include file="../header.jsp"%>
	<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h4 class="header">������Ʒ</h4>
						<form action="complex_search_complete.product" method="post"
							onsubmit="return checkForm(this)">
							<table class="table table-striped sortable">
								<thead>
								</thead>
								<tbody>
									<tr>
										<th>��Ʒ���</th>
										<td><select name="categoryid">
												<option value="-1">----�������----</option>
												<!-- ��ʾ��� -->
												<c:forEach var="c" items="${categories }">
													<c:if test="${c.grade ==3 }">
														<option value="${c.id }">${c.name }</option>
													</c:if>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>�ؼ���</th>
										<td><input type="text" name="keywords" /></td>
									</tr>

									<tr>
										<th>��ͨ�۸�</th>
										<td>&yen;<select class="rmb" name="lownormalprice">
												<option value="0">-ѡ��۸�-</option>
												<option value="1">1</option>
												<option value="100">100</option>
												<option value="500">500</option>
												<option value="1000">1000</option>
												<option value="2000">2000</option>
												<option value="5000">5000</option>

										</select> <!-- <input class="rmb" id="lownormalprice" type="text" name="lownormalprice" /> -->Ԫ~
											&yen;<select class="rmb" name="highnormalprice">
												<option value="0">-ѡ��۸�-</option>
												<option value="100">100</option>
												<option value="500">500</option>
												<option value="1000">1000</option>
												<option value="2000">2000</option>
												<option value="5000">5000</option>
												<option value="${Integer.MAX_VALUE }">5000����</option>
										</select> <!-- <input class="rmb" id="highnormalprice" type="text" name="highnormalprice" /> -->Ԫ
										</td>
									</tr>
									<tr>
										<th>��Ա�۸�</th>
										<td>&yen;<select class="rmb" name="lowmemberprice" >
												<option value="0">-ѡ��۸�-</option>
												<option value="1">1</option>
												<option value="100">100</option>
												<option value="500">500</option>
												<option value="1000">1000</option>
												<option value="2000">2000</option>
												<option value="5000">5000</option>

										</select> <!-- <input class="rmb" id="lowmemberprice" type="text" name="lowmemberprice"/> -->Ԫ
											~ &yen;<select class="rmb" name="highmemberprice">
												<option value="0">-ѡ��۸�-</option>
												<option value="100">100</option>
												<option value="500">500</option>
												<option value="1000">1000</option>
												<option value="2000">2000</option>
												<option value="5000">5000</option>
												<option value="${Integer.MAX_VALUE }">5000����</option>
										</select> <!-- <input class="rmb" id="highmemberprice" type="text" name="highmemberprice"/> -->Ԫ
										</td>
									</tr>

									<tr>
										<th>�ϼ�����</th>
										<td>��<input id="startdate" type="text" name="startdate" />
											��<input id="enddate" type="text" name="enddate" />

										</td>
									</tr>

									<tr>
										<td></td>
										<td><input class="btn btn-success" type="submit"
											value="����" />&nbsp;&nbsp;&nbsp;<input class="btn btn-danger"
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