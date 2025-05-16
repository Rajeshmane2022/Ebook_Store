<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.BooksDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Recent Books</title>
    <%@include file="all_Components/allCss.jsp"%>

    <style>
        .crd-ho {
            transition: 0.3s;
        }

        .crd-ho:hover {
            background-color: #fcf7f7;
        }

        /* Make the entire card clickable */
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

    <%@ include file="all_Components/Navbar.jsp"%>

    <div class="container-fluid">
        <div class="row p-3">
            
            <%
            BooksDaoImpl dao1 = new BooksDaoImpl(DBConnection.getConnection());
            List<BookDetails> list1 = dao1.getAllRecentBooks();

            for (BookDetails b : list1) {
            %>
            <div class="col-md-3">
                <!-- Make the whole card clickable -->
                <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="card-link">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img alt="" src="books/<%=b.getPhotoName()%>"
                                style="width: 150px; height: 200px" class="img-thumbnail">
                            <p class="fw-bold"><%=b.getBookName()%></p>
                            <p class="text-muted"><%=b.getAuthor()%></p>
                            <p class="small">Category: <%=b.getBookCategory()%></p>

                            <!-- Buttons inside the card, still functional -->
                            <div class="row justify-content-center mt-2">
                                <a href="cart?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm mr-2">Add</a>
                                <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm mr-2">View Details</a>
                                <a href="#" class="btn btn-primary btn-sm">
                                    <%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i>
                                </a>
                            </div>

                        </div>
                    </div>
                </a>
            </div>
            <% } %>
            
        </div>
    </div>

</body>
</html>
