<div class="container-fluid" style="height:10px; background-color: #fb8c00"></div>


<div class="container-fluid p-3">
	<div class="row">
		<div class ="col-md-3">
			<h3><i class="fa-solid fa-book"></i> EBOOKS</h3>
		</div>
		<div class ="col-md-6">
			<form class="d-flex">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      	</form>
		</div>
		<div class ="col-md-3">
		<c:if test="${not empty userObj }">
			
			<a href="" class= "btn btn-success"><i class="fas fa-user"></i> ${userObj.name }</a>
			<a data-toggle="modal" data-target="#exampleModalCenter" class= "btn btn-primary text-white"><i class="fa-solid fa-arrow-right-to-bracket"></i> Log out</a>
			
		</c:if>
		
		<c:if test="${empty userObj }">
			
			<a href="../Login.jsp" class= "btn btn-success"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
			<a href="../Register.jsp" class= "btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
			
		</c:if>
			
		</div>
	</div>
</div>

<!-- Start Logout modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div class="text-center">
       		<h4> Do you want to Logout!!</h4><br>
         	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close  </button>
         	<a  href="../logout" type="button"  class="btn btn-primary text-white">Log out</a>
        	
       	</div>
      </div>
      <div class="modal-footer">
      
      </div>
    </div>
  </div>
</div>

<!-- End Logout modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      </ul>
  </div>
</nav>


































