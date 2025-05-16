<%@page import="com.entity.Book_Order"%>
<%@page import="com.dao.BookOrderDaoImp"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.BooksDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="Navbar.jsp"%>
	<h3 class="text-center">Admin</h3>
	<c:if test="${not empty SuccessMsg}">
		<h5 class="text-center text-success">${SuccessMsg}</h5>
		<c:remove var="SuccessMsg" scope="session" />
	</c:if>

	<c:if test="${not empty FailedMsg}">
		<p class="text-center text-danger">${FailedMsg}</p>
		<c:remove var="FailedMsg" scope="session" />
	</c:if>

	<c:if test="${not empty SuccessMsg}">
		<h5 class="text-center text-success">${SuccessMsg}</h5>
		<c:remove var="SuccessMsg" scope="session" />
	</c:if>

	<c:if test="${not empty FailedMsg}">
		<p class="text-center text-danger">${FailedMsg}</p>
		<c:remove var="FailedMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bg-primary">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone</th>
				<th scope="col">Book Name</th>
				<!--<th scope="col">Author</th>  -->
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
				<th scope="col">Status</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookOrderDaoImp dao = new BookOrderDaoImp(DBConnection.getConnection());
			List<Book_Order> list = dao.getAllBook();

			for (Book_Order b : list) {
			%>
			<tr>

				<td><%=b.getOrderId()%></td>
				<td><%=b.getUsername()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFullAdd()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getBookName()%></td>
				<!-- <tdb.getAuthor()r() %></td> -->
				<td>₹<%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>
				<td>
					<form action="../UpdateOrderStatusServlet" method="post">
						<input type="hidden" name="orderId" value="<%=b.getOrderId()%>">
						<select name="status" class="form-control"
							onchange="this.form.submit()">
							<option value="Pending"
								<%=b.getStatus().equals("Pending") ? "selected" : ""%>>Pending</option>
							<option value="Shipped"
								<%=b.getStatus().equals("Shipped") ? "selected" : ""%>>Shipped</option>
							<option value="Delivered"
								<%=b.getStatus().equals("Delivered") ? "selected" : ""%>>Delivered</option>
							<option value="Cancelled"
								<%=b.getStatus().equals("Cancelled") ? "selected" : ""%>>Cancelled</option>
						</select>
					</form>
				</td>

			</tr>
			<%
			}
			%>

		</tbody>
	</table>
</body>
</html>