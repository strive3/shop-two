<%@page import="com.neuedu.shop.entity.Admin"%>
<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" %>
<%
	//��session�����л�ȡ��½���admin����
	//�������ֵΪnull,���¶��򵽵�¼���������½
//	Admin admin = (Admin) session.getAttribute("admin");
//	if (admin == null) {
//		response.sendRedirect("login.jsp");
//		return;
//	}
	String ctxPath = request.getContextPath();
%>
<div id="in-nav">
	<div class="container">
		<div class="row">
			<div class="span12">
				<ul class="pull-right">
					<li><a href="<%=ctxPath %>/pre/index.pre">ǰ̨��ҳ</a></li>

					<li><a href="login.jsp">��¼</a></li>
					<li><a href="javascript:;"  id="logout">ע��</a></li>
					<%--<li><a href="add.admin">����Աע��</a></li>--%>
				</ul>
				<h4>
					<a id="logo" href="index.jsp"> ����ƽ̨��̨<strong>����</strong>
					</a>
				</h4>
				<script>
					(function() {
						$("#logout").click(function(){
							if(confirm("��ȷ���˳�ϵͳ��")){
								$(this).attr("href","logout.admin");
							}
						});
					}());
				</script>
			</div>
		</div>
	</div>

</div>
<div id="in-sub-nav">
	<div class="container">
		<div class="row">
			<div class="span12">
				<ul>
					<li><a href="index.jsp" class="active"><i
							class="batch home"></i><br />��ҳ</a></li>
					<li><span class="label label-important pull-right">08</span><a
						href="adminlist.admin"><i class="batch stream"></i><br />����Ա�б�</a></li>
					<li><a href="userlist.user"><i class="batch users"></i><br />�û��б�</a></li>
					<li><a href="list.category"><i class="batch forms"></i><br />����б�</a></li>
					<li><a href="list.product"><i class="batch quill"></i><br />��Ʒ�б�</a></li>
					<li><a href="list.order"><i class="batch plane"></i><br />�����б�</a></li>
					<li><a href="#"><i class="batch calendar"></i><br />������չ����</a></li>
					<li><a href="#"><i class="batch settings"></i><br />ϵͳ����</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>