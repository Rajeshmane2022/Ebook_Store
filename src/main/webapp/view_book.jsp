
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.BooksDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Book</title>
<%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_Components/Navbar.jsp"%>

	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
		User u = (User) session.getAttribute("userObj");
		BooksDaoImpl dao = new BooksDaoImpl(DBConnection.getConnection());
		BookDetails b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=b.getPhotoName()%>" style="width: 150px; height: 200px"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<% if ("Old".equals(b.getBookCategory())) { %>
					<h5 class="text-primary">Contact to seller</h5>
					<h5 class="text-primary">
						<i class="fa-solid fa-envelope"></i> Email: <%=b.getEmail()%>
					</h5>
				<% } %>

				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return available</p>
					</div>

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<div class="text-center p-3">
					<% if (u != null) { %>
						<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>" class="btn btn-primary btn-sm mr-2">
							<i class="fa-solid fa-cart-shopping"></i> Add to Cart
						</a>
					<% } else { %>
						<a href="Login.jsp" class="btn btn-primary btn-sm mr-2">
							<i class="fa-solid fa-cart-shopping"></i> Login to Add to Cart
						</a>
					<% } %>

					<a href="#" class="btn btn-danger btn-sm">
						<i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>
					</a>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
