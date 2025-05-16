<%@page import="com.entity.BookDetails"%>
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
<title>Admin:Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="Navbar.jsp"%>

	<c:if test="${empty userObj}">
		<c:redirect url="../Login.jsp" />
		<!-- used for security i order to prevent direct access to page -->
	</c:if>

	<div class="container">

		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BooksDaoImpl dao = new BooksDaoImpl(DBConnection.getConnection());
						BookDetails b = dao.getBookById(id);
						%>

						<form action="../editBooks" method="post">

							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="form-group">
								<label for="bookName">Book Name</label> <input type="text"
									class="form-control" id="bookName" required="required"
									name="bookName" value="<%=b.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="authorName">Author Name</label> <input type="text"
									class="form-control" id="authorName" required="required"
									name="authorName" value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="price">Price</label> <input type="number"
									class="form-control" id="price" required="required"
									name="price" step="0.01" value="<%=b.getPrice()%>">
							</div>


							<div class="form-group">
								<label for="bookStatus">Book Status</label> <select
									class="form-control" id="bookStatus" name="bookStatus" required
									value="<%=b.getStatus()%>">
									<%

									%>
									<option value="Available">Available</option>
									<option value="Out of Stock">Out of Stock</option>

									<%

									%>

								</select>
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>