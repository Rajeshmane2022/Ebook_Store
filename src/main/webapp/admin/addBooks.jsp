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

	<div class="container mt-3">

		<div class="row justify-content-center">

			<div class="col-md-8 ">
				<div class="card w-100">
					<div class="card-body">
						<h4 class="text-center">Add Book</h4>

						<c:if test="${not empty SuccessMsg}">
							<p class="text-center text-success">${SuccessMsg}</p>
							<c:remove var="SuccessMsg" scope="session" />
						</c:if>

						<c:if test="${not empty FailedMsg}">
							<p class="text-center text-danger">${FailedMsg}</p>
							<c:remove var="FailedMsg" scope="session" />
						</c:if>
						<form action="../addBooks" method="post"
							enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="bookName">Book Name</label> <input type="text"
										class="form-control" id="bookName" required="required"
										name="bookName">
								</div>

								<div class="form-group col-md-6">
									<label for="authorName">Author Name</label> <input type="text"
										class="form-control" id="authorName" required="required"
										name="authorName">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="price">Price</label> <input type="number"
										class="form-control" id="price" required="required"
										name="price" step="0.01">
								</div>

								<div class="form-group col-md-6">
									<label for="bookCategory">Book Category</label> <select
										class="form-control" id="bookCategory" name="bookCategory"
										required>
										<option value="">Select Category</option>
										<option value="New">New</option>
										<option value="Old">Old</option>
										<option value="Science">Science</option>
										<option value="History">History</option>
									</select>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="bookStatus">Book Status</label> <select
										class="form-control" id="bookStatus" name="bookStatus"
										required>
										<option value="">Select Status</option>
										<option value="Available">Available</option>
										<option value="Out of Stock">Out of Stock</option>
									</select>
								</div>

								<div class="form-group col-md-6">
									<label for="bookFile">Choose File</label> <input type="file"
										class="form-control-file" id="bookFile" name="bookFile"
										required>
								</div>
							</div>

							<button type="submit" class="btn btn-primary">Add Book</button>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>