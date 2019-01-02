<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk" />

<title>����ƽ̨��̨����</title>
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

</head>
<body>
	<%
		String ctxString = request.getContextPath();
	%>
	<!-- header���� -->
	<%@include file="../header.jsp" %>
	<div class="page">
	
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h4 class="header">��Ʒ�������</h4>
						
							<a class="btn btn-info" href="<%=ctxPath %>/back/complex_search.product">��������</a>
			
						<table class="table table-striped sortable">
							<thead>
								<tr>
									<th>��ƷID</th>
									<th>��Ʒ����</th>
									<th>��Ʒ����</th>
									<th>��ͨ�۸�</th>
									<th>��Ա�۸�</th>
									<th>�ϼ�����</th>
									<th>�������</th>
								</tr>
							</thead>
							<tbody>

								
								<c:forEach var="p" items="${paging.objects }">
									<tr>
										<td>${p.id }</td>
										<td>${p.name }</td>
										<td>${p.descr }</td>
										<td>${p.normalprice }</td>
										<td>${p.memberprice }</td>
										<td>${p.pDate }</td>
										<td>${p.category.name }</td>
										<td>
											<div class="btn-group">
												<button class="btn">����</button>
												<button data-toggle="dropdown" class="btn dropdown-toggle">
													<span class="caret"></span>
												</button>
												<ul class="dropdown-menu">
													<li><a href="load.product?id=${p.id }">�޸�</a> <a onclick="del(${p.id })">ɾ��</a>
														<script type="text/javascript">
                                                            function del(id) {
                                                                if (confirm("ȷ��Ҫɾ����")) {
                                                                    window.location.href = "delete.product?id=" + id;
                                                                }
                                                            }
														</script></li>
												</ul>
											</div>
										</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
						<div class="pagination pagination-centered">
							<form action="simple_search.product" method="post">
							<ul>
								<li class="active"><a>��${paging.pageNumber }ҳ</a></li>
								<li><a class="subm" href="simple_search.product?pageNumber=1">��ҳ</a></li>
								<li><a class="subm" href="simple_search.product?pageNumber=${paging.pageNumber - 1}">��һҳ</a></li>
								<li><a class="subm" href="simple_search.product?pageNumber=${paging.pageNumber + 1}">��һҳ</a></li>
								<li><a class="subm" href="simple_search.product?pageNumber=${paging.pages }">βҳ</a></li>
								<li class="active"><a>��${paging.pages }ҳ</a></li>
								<%--<input type="hidden" value="${keywords }" name="keywords">--%>
								<li><span style="display:flex;height: 20px;line-height: 20px;border-color: transparent;">����<input style="align-items: center;height: 10px;width: 23px" type="text" name="pageNumber" oninput="value=value.replace(/[^\d]/g,'')">ҳ<input style="align-items: center;height: 20px;line-height: 16px;" type="submit" value="ȷ��"></span></li>

							</ul>
							</form>

							<%--<form action="" method="post">
								<input type="hidden" name="keywords" />
								<input type="hidden" name="pageNumber" />

							</form>
							<script>
                                $(function(){

                                    $(".subm").click(function(){

                                        var href = $(this).attr("href");

                                        $("form").attr("action", href).submit();

                                        return false;

                                    });

                                })

                              	</script>--%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- footer -->
	<%@include file="../footer.jsp" %>
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