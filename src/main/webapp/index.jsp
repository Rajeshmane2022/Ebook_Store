<%@page import="com.entity.User"%>
<%@page import="com.dao.BooksDao"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.BooksDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - EBOOK STORE</title>
<%@include file="all_Components/allCss.jsp"%>

<style>
    .back-img {
        background: url("img/back.webp");
        height: 50vh;
        width: 100%;
        background-repeat: no-repeat;
        background-size: cover;
    }

    .crd-ho {
        transition: 0.3s;
    }

    .crd-ho:hover {
        background-color: #fcf7f7;
    }

    /* Removes default link styling */
    .card-link {
        text-decoration: none;
        color: inherit;
        display: block;
    }

    .card-body {
        cursor: pointer;
    }
</style>
</head>
<body>

<%
    String addCartMsg = (String) session.getAttribute("addCart");
    String failedMsg = (String) session.getAttribute("failed");

    if (addCartMsg != null) {
%>
    <div class="alert alert-success text-center" role="alert">
        <%= addCartMsg %>
    </div>
<%
    session.removeAttribute("addCart");
    }

    if (failedMsg != null) {
%>
    <div class="alert alert-danger text-center" role="alert">
        <%= failedMsg %>
    </div>
<%
    session.removeAttribute("failed");
    }
%>

<%
    User u = (User) session.getAttribute("userObj");
    BooksDaoImpl dao = new BooksDaoImpl(DBConnection.getConnection());
%>

<%@ include file="all_Components/Navbar.jsp"%>

<div class="container-fluid back-img">
    <h2 class="text-center text-danger"></h2>
</div>

<!-- Start RECENT BOOKS -->
<div class="container">
    <h3 class="text-center">Recent Books</h3>
    <div class="row">
        <%
        List<BookDetails> recentBooks = dao.getRecentBook();
        for (BookDetails b : recentBooks) {
        %>
        <div class="col-md-3">
            <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="card-link">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="books/<%=b.getPhotoName()%>"
                            style="width: 150px; height: 200px" class="img-thumbnail">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Categories: <%=b.getBookCategory()%></p>

                        <div class="row justify-content-center">
                            <%
                            if (u == null) {
                            %>
                            <a href="Login.jsp" class="btn btn-danger btn-sm mr-2">Add Cart</a>
                            <%
                            } else {
                            %>
                            <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
                                class="btn btn-danger btn-sm mr-2">Add</a>
                            <%
                            }
                            %>  
                            <a href="view_book.jsp?bid=<%=b.getBookId()%>"
                                class="btn btn-success btn-sm mr-2">Details</a>
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
    <div class="text-center mt-2">
        <a href="all_recent_book.jsp" class="btn btn-danger btn-sm">View All</a>
    </div>
</div>
<!-- END RECENT BOOKS -->

<hr>

<!-- START NEW BOOKS -->
<div class="container">
    <h3 class="text-center">New Books</h3>
    <div class="row">
        <%
        List<BookDetails> newBooks = dao.getNewBook();
        for (BookDetails b : newBooks) {
        %>
        <div class="col-md-3">
            <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="card-link">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="books/<%=b.getPhotoName()%>"
                            style="width: 150px; height: 200px" class="img-thumbnail">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Categories: <%=b.getBookCategory()%></p>

                        <div class="row justify-content-center">
                            <%
                            if (u == null) {
                            %>
                            <a href="Login.jsp" class="btn btn-danger btn-sm mr-2">Add Cart</a>
                            <%
                            } else {
                            %>
                            <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
                                class="btn btn-danger btn-sm mr-2">Add</a>
                            <%
                            }
                            %>
                            <a href="view_book.jsp?bid=<%=b.getBookId()%>"
                                class="btn btn-success btn-sm mr-2">Details</a>
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
    <div class="text-center mt-2">
        <a href="all_new_Book.jsp" class="btn btn-danger btn-sm">View All</a>
    </div>
</div>
<!-- END NEW BOOKS -->

<hr>

<!-- START OLD BOOKS -->
<div class="container">
    <h3 class="text-center">Old Books</h3>
    <div class="row">
        <%
        List<BookDetails> oldBooks = dao.getOldBook();
        for (BookDetails b : oldBooks) {
        %>
        <div class="col-md-3">
            <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="card-link">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="books/<%=b.getPhotoName()%>"
                            style="width: 150px; height: 200px" class="img-thumbnail">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Categories: <%=b.getBookCategory()%></p>

                        <div class="row justify-content-center">
                            <%
                            if (u == null) {
                            %>
                            <a href="Login.jsp" class="btn btn-danger btn-sm mr-2">Add Cart</a>
                            <%
                            } else {
                            %>
                            <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
                                class="btn btn-danger btn-sm mr-2">Add</a>
                            <%
                            }
                            %>
                            <a href="view_book.jsp?bid=<%=b.getBookId()%>"
                                class="btn btn-success btn-sm mr-2">Details</a>
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
<!-- END OLD BOOKS -->

<%@include file="all_Components/Footer.jsp"%>

</body>
</html>
