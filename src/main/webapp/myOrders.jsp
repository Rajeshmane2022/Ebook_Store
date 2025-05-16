<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.dao.BookOrderDaoImp" %>
<%@ page import="com.DB.DBConnection" %>
<%@ page import="com.entity.Book_Order" %>

<%
    // Get the logged-in user from the session
    User user = (User) session.getAttribute("userObj");
    if (user == null) {
        out.println("User not logged in.");
        return;
    }
    
    // Get the email of the logged-in user
    String userEmail = user.getEmail();
    
    // Fetch orders for this user using the email
    BookOrderDaoImp orderDao = new BookOrderDaoImp(DBConnection.getConnection());
    List<Book_Order> orderList = orderDao.getOrdersByUser(userEmail);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <%@include file="all_Components/allCss.jsp"%>
    <style>
        .table-container {
            margin-top: 30px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        body {
            background-color: #f0f1f2;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h3 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .no-orders {
            text-align: center;
            font-size: 18px;
            color: #555;
            padding: 20px;
        }
    </style>
</head>
<body>
    <%@include file="all_Components/Navbar.jsp"%>

    <div class="container table-container mt-3">
        <h3 class="text-center text-primary">My Orders</h3>
        
        <% 
            if (orderList.isEmpty()) {
        %>
            <div class="no-orders">
                <p>No orders found for your email: <%= userEmail %>.</p>
                <p>You have not placed any orders yet.</p>
            </div>
        <% 
            } else {
        %>
        <table class="table table-bordered text-center">
            <thead class="bg-dark text-white">
                <tr>
                    <th>Order ID</th>
                    <th>Name</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Payment Type</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Iterate over the orders and display each one
                    for (Book_Order order : orderList) {
                %>
                <tr>
                    <td><%= order.getOrderId() %></td>
                    <td><%= order.getUsername() %></td>
                    <td><%= order.getBookName() %></td>
                    <td><%= order.getAuthor() %></td>
                    <td><%= order.getPrice() %></td>
                    <td><%= order.getPaymentType() %></td>
                    <td><strong><%= order.getStatus() %></strong></td> 
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
        <% 
            }
        %>
    </div>
</body>
</html>
