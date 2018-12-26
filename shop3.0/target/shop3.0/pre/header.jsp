<%@page import="com.neuedu.shop.entity.Cart"%>
<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header-wrapper">
	<header class="container">
		<div class="head-right">
			<ul class="top-nav">

				<li class=""><a href="404_error.html" title="�ҵ��˻�">�ҵ��˻�</a></li>
				<li class="my-wishlist"><a href="404_error.html" title="�ҵ��ղ�">�ҵ��ղ�</a></li>
				<li class="contact-us"><a href="contact_us.html" title="��ϵ����">��ϵ����</a></li>
				<li class="checkout"><a href="404_error.html" title="����">����</a></li>
				<c:choose>
					<c:when test="${user==null }">
						<li class="log-in"><a href="login.jsp" title="��¼">���¼</a></li>
					</c:when>
					<c:otherwise>
						<li class="log-in"><a>���ã�${user.username }</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="currencyBox">
				<li id="header_currancy" class="currency"><a
					class="mainCurrency" href="#">����: RMB</a>
					<div id="currancyBox" class="currency_detial">
						<a href="#">��</a> <a href="#"></a> <a href="#">$</a>
					</div></li>
			</ul>
			<%
				Cart cart = (Cart) session.getAttribute("cart");
			%>
			<section class="header-bottom">
				<div class="cart-block">
					<ul>
						<%
							if (cart == null) {
						%>
						<li>(0)</li>
						<%
							} else {
						%>
						<li>(<%=cart.getcItems().size()%>)
						</li>
						<%
							}
						%>

						<li><a href="cart.jsp" title="Cart"><img title="Item"
								alt="Item" src="images/item_icon.png" /></a></li>
						<li>Item</li>
					</ul>
					<div id="minicart" class="remain_cart" style="display: none;">
						<%
							if (cart == null) {
						%>
						<p class="empty">���ﳵ����(0)����Ʒ</p>
						<%
							} else {
						%>
						<p class="empty">
							���ﳵ����(<%=cart.getcItems().size()%>)����Ʒ
						</p>
						<%
							}
						%>
						<ol>
							<c:forEach var="ci" items="${cart.cItems }">
								<li>
									<div class="img-block">
										<img src="images/small_img.png" title="" alt="" />
									</div>
									<div class="detail-block">
										<h4>
											<a href="#" title="Htc Mobile 1120">${ci.product.name }</a>
										</h4>
										<p>
											<strong>${ci.qty }</strong> x ��${ci.product.normalprice }
										</p>
										<a href="cart.pre" title="����">����</a>
									</div>
									<div class="edit-delete-block">
										<a href="#" title="�༭"><img src="images/edit_icon.png"
											alt="�༭" title="�༭" /></a> <a href="#" title="ɾ��"><img
											src="images/delete_item_btn.png" alt="ɾ��" title="ɾ��" /></a>
									</div>
								</li>
							</c:forEach>
						</ol>
					</div>
				</div>
				<div class="search-block">
					<input type="text" placeholder="������Ʒ" /> <input type="submit"
						value="����" title="������Ʒ" />
				</div>
			</section>
		</div>
		<h1 class="logo">
			<a href="index.html" title="Logo"> <img title="Logo" alt="Logo"
				src="images/logo.jpg" />
			</a>
		</h1>
		<nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
			<ul id="nav">
				<li class="active"><a href="index.pre" title="Home">��ҳ</a></li>
				<li class=""><a href="category.html" title="��Ʒ���">��Ʒ���</a>
					<ul>
						<li><a href="category.html">Ůװ</a></li>
						<li><a href="category.html">��װ</a></li>
						<li><a href="category.html">��Ʒ</a></li>
						<li><a href="category.html">�ƶ��豸</a>
							<ul>
								<li><a href="category.html">�������</a></li>
								<li><a href="category.html">�������</a></li>
								<li><a href="category.html">�������</a></li>
								<li><a href="category.html">�������</a></li>
								<li><a href="category.html">�������</a></li>
								<li><a href="category.html">�������</a></li>
							</ul></li>
						<li><a href="category.html">Ь</a></li>
						<li><a href="category.html">����</a></li>
					</ul></li>
				<li class=""><a href="blog.html" title="����">����</a></li>
				<li class=""><a href="faq.html" title="FAQ">FAQ</a></li>
				<li class=""><a href="about_us.html" title="��������">��������</a></li>
				<li class=""><a href="404_error.html" title="Pages">Pages</a></li>
				<li class=""><a href="contact_us.html" title="��ϵ����">��ϵ����</a></li>
			</ul>
		</nav>

		<div class="mobMenu">
			<h1>
				<span>�˵�</span> <a class="menuBox highlight"
					href="javascript:void(0);">ccc</a> <span class="clearfix"></span>
			</h1>
			<div id="menuInnner" style="display: none;">
				<ul class="accordion">
					<li class="active"><a href="index.html" title="��ҳ">��ҳ</a></li>
					<li class="parent"><a href="category.html" title="���">���</a>
						<ul>
							<li><a href="category.html">Ůװ</a></li>
							<li><a href="category.html">��װ</a></li>
							<li><a href="category.html">��Ʒ</a></li>
							<li><a href="category.html">�ƶ��豸</a>
								<ul>
									<li><a href="category.html">�������</a></li>
									<li><a href="category.html">�������</a></li>
									<li><a href="category.html">�������</a></li>
									<li><a href="category.html">�������</a></li>
									<li><a href="category.html">�������</a></li>
									<li><a href="category.html">�������</a></li>
								</ul></li>
							<li><a href="category.html">Ь</a></li>
							<li><a href="category.html">����</a></li>
						</ul></li>
					<li class=""><a href="blog.html" title="����">����</a></li>
					<li class=""><a href="faq.html" title="Faq">Faq</a></li>
					<li class=""><a href="about_us.html" title="��������">��������</a></li>
					<li class=""><a href="404_error.html" title="Pages">Pages</a></li>
					<li class=""><a href="contact_us.html" title="��ϵ����">��ϵ����</a></li>
					<span class="clearfix"></span>
				</ul>

			</div>
		</div>

	</header>
</div>