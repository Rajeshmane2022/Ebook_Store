<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
<%@include file="all_Components/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_Components/Navbar.jsp"%>

	<div class="container">
		<%
		com.entity.User user = (com.entity.User) session.getAttribute("userObj");
		String userName = (user != null) ? user.getName() : "Guest";
		%>
		<h3 class="text-center">
			Hello,
			<%=userName%></h3>
		<div class="row p-5">
			<!-- Sell Old Book -->
		<!--<div class="col-md-6 mb-3">
				<a href="SellBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div> -->

			<!-- Login & Security -->
			<div class="col-md-4 mb-3">
				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fa-solid fa-user-shield fa-3x"></i>
							</div>
							<h3>Edit profile</h3>

						</div>
					</div>
				</a>
			</div>


			<!-- My Orders -->
			<div class="col-md-4 mb-3">
				<a href="myOrders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>My Orders</h3>
						</div>
					</div>
				</a>
			</div>

			<!-- Help Center -->
			<div class="col-md-4 mb-3">
				<a href="helpCenter.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fa-solid fa-headset fa-3x"></i>
							</div>
							<h3>Help Center</h3>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

</body>
</html>
