<%@page import="com.entity.User"%>
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
<title>All New Books</title>
<%@include file="all_Components/allCss.jsp"%>

<style>
.crd-ho {
    transition: 0.3s;
}

.crd-ho:hover {
    background-color: #fcf7f7;
}

/* To remove default link styling */
.card-link {
    text-decoration: none;
    color: inherit;
    display: block;
}

.card-body {
    cursor: pointer;
}

#toast {
    visibility: hidden;
    position: fixed;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    background-color: #333;
    color: #fff;
    padding: 10px;
    border-radius: 5px;
}

#toast.display {
    visibility: visible;
    animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}
</style>
</head>
<body>

<%
User u = (User) session.getAttribute("userObj");
%>

<c:if test="${not empty addCart}">
    <div id="toast">${addCart}</div>
    <script type="text/javascript">
        $(document).ready(function () {
            showToast("${addCart}");
        });

        function showToast(content) {
            $('#toast').addClass("display");
            $('#toast').html(content);
            setTimeout(() => {
                $("#toast").removeClass("display");
            }, 2000);
        }   
    </script>
    <c:remove var="addCart" scope="session" />
</c:if>

<%@ include file="all_Components/Navbar.jsp"%>

<div class="container-fluid">
    <div class="row p-3">
        <%
        BooksDaoImpl dao2 = new BooksDaoImpl(DBConnection.getConnection());
        List<BookDetails> list2 = dao2.getAllNewBooks();

        for (BookDetails b : list2) {
        %>
        <div class="col-md-3">
            <!-- The card itself is a clickable link -->
            <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="card-link">
                <div class="card crd-ho mt-2">
                    <div class="card-body text-center">
                        <img alt="" src="books/<%=b.getPhotoName()%>" 
                            style="width: 150px; height: 200px" class="img-thumbnail">
                        <p class="fw-bold"><%=b.getBookName()%></p>
                        <p class="text-muted"><%=b.getAuthor()%></p>
                        <p class="small">Category: <%=b.getBookCategory()%></p>

                        <!-- Buttons inside the card, but still work independently -->
                        <div class="row justify-content-center mt-2">
                            <% if (u == null) { %>
                                <a href="Login.jsp" class="btn btn-danger btn-sm mr-2">Add Cart</a>
                            <% } else { %>
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" 
                                   class="btn btn-danger btn-sm mr-2">Add</a>
                            <% } %>
                            <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm mr-2">View Details</a>
                            <a href="#" class="btn btn-primary btn-sm">
                                <%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <%
        }
        %>
    </div>
</div>

</body>
</html>
