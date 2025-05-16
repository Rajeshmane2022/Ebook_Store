<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.BooksDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored = "false"  %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
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

	<table class="table table-striped">
		<thead class="bg-primary">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BooksDaoImpl dao = new BooksDaoImpl(DBConnection.getConnection());
			List<BookDetails> list = dao.getAllBooks();

			for (BookDetails b : list) {
			%>
			<tr>

				<td><%=b.getBookId()%></td>
				<td><img src="../books/<%=b.getPhotoName()%> "
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td>
					<a href="editBook.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a> 
					<a href="../delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a>
				</td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
</body>
</html>