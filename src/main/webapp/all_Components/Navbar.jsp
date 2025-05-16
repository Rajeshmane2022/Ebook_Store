<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<div class="container-fluid"
	style="height: 10px; background-color: #fb8c00"></div>


<div class="container-fluid p-3">
	<div class="row">



		<c:if test="${not empty userObj }">

			<div class="col-md-3">
				<h3
					style="font-family: 'Poppins', sans-serif; font-size: 35px; color: #000000; text-align: center; letter-spacing: 1px; font-weight: 700; text-transform: uppercase; text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.25); background: linear-gradient(45deg, #000, #333); -webkit-background-clip: text; color: transparent;">
					<i class="fas fa-user-circle"
						style="font-size: 40px; color: #000000; margin-right: 10px;"></i>
					${userObj.name}
				</h3>

			</div>
			<div class="col-md-6">
				<form class="d-flex align-items-center" action="search.jsp" method="post">
					<input class="form-control mt-2 me-3 px-3 mr-2" type="search"
						placeholder="Search for books..." aria-label="Search" name="ch">
					<button class="btn btn-outline-success mt-2 px-4" type="submit">
						<i class="fa-solid fa-search"></i> Search
					</button>
				</form>
			</div>


			<div class="col-md-3">

				<a href="checkOut.jsp" class="btn btn-success"
					style="margin-left: 40px;"><i
					class="fa-solid fa-cart-shopping fa-1x"></i> Cart</a> <a href="logout"
					class="btn btn-danger" style="margin-left: 40px;"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> Logout</a>
			</div>

		</c:if>

		<c:if test="${ empty userObj }">

			<div class="col-md-3">
				<h3>
					<i class="fa-solid fa-book"></i> EBOOKS
				</h3>
			</div>
			<div class="col-md-6">
				<form class="d-flex align-items-center" action="search.jsp" method="post">
					<input class="form-control mt-2 me-3 px-3 mr-2" type="search"
						placeholder="Search for books..." aria-label="Search" name="ch">
					<button class="btn btn-outline-success mt-2 px-4" type="submit">
						<i class="fa-solid fa-search"></i> Search
					</button>
				</form>
			</div>

			<div class="col-md-3">
				<a href="Login.jsp" class="btn btn-success"
					style="margin-left: 40px;"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> Login</a> <a
					href="Register.jsp" class="btn btn-primary"
					style="margin-left: 20px;"><i class="fa-solid fa-user-plus"></i>
					Register</a>
			</div>
		</c:if>



	</div>
</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_recent_book.jsp">Recent Books</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_Book.jsp">New Books</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_old_Book.jsp">Old Books</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="Setting.jsp" class="btn btn-light my-2 my-sm-0 ml-1"
				type="submit"> <i class="fa-solid fa-gear"></i> Setting
			</a> <a href="helpCenter.jsp" class="btn btn-light my-2 my-sm-0 ml-1"
				type="submit"> <i class="fa-solid fa-phone"></i> Contact Us
			</a>
		</form>
	</div>
</nav>


































