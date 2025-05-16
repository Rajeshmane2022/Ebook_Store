<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.CartDaoImpl"%>
<%@page import="com.DB.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Page</title>
    <%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_Components/Navbar.jsp"%>

    <c:if test="${empty userObj }">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

    <c:if test="${not empty succMsg}">
        <div class="alert alert-success" role="alert">${succMsg}</div>
        <c:remove var="succMsg" />
    </c:if>

    <c:if test="${not empty failedMsg}">
        <div class="alert alert-danger" role="alert">${failedMsg}</div>
        <c:remove var="failedMsg" />
    </c:if>

    <div class="container">
        <div class="row p-3">
            <!-- Left Side: Cart Items -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your Selected Items</h3>

                        <%
                        User u = (User) session.getAttribute("userObj");

                        CartDaoImpl dao = new CartDaoImpl(DBConnection.getConnection());
                        List<Cart> cartList = dao.getBookByUser(u.getId());

                        double totalPrice = 0.0;
                        boolean isCartEmpty = cartList.isEmpty(); // Check if cart is empty
                        %>

                        <%
                        if (isCartEmpty) {
                        %>
                            <p class="text-center text-danger"><strong>Your cart is empty! Please add items to your cart.</strong></p>
                        <%
                        } else {
                        %>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                int count = 1; 
                                for (Cart c : cartList) {
                                    totalPrice += c.getPrice();
                                %>
                                <tr>
                                    <th scope="row"><%=count++%></th>
                                    <td><%=c.getBookName()%></td>
                                    <td><%=c.getAuthor()%></td>
                                    <td>₹<%=c.getPrice()%></td>
                                    <td><a href="remove_book?cid=<%=c.getCid()%>"
                                        class="btn btn-sm btn-danger">Remove</a></td>
                                </tr>
                                <%
                                }
                                %>
                                <tr>
                                    <td colspan="3" class="text-right"><strong>Total Price:</strong></td>
                                    <td colspan="2"><strong>₹<%=totalPrice%></strong></td>
                                </tr>
                            </tbody>
                        </table>

                        <% } %>

                    </div>
                </div>
            </div>

            <!-- Right Side: Order Details -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your Details for Order</h3>
                        <form action="order" method="post" onsubmit="return validateOrder()">
                        
                            <input type="hidden" value="${userObj.id}" name="id">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="name">Name</label>
                                    <input type="text" name="name" class="form-control" id="name" value="${userObj.name}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Email</label>
                                    <input type="email" name="email" class="form-control" id="email" value="${userObj.email}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="phone">Phone Number</label>
                                    <input type="number" name="phone" class="form-control" id="phone" value="${userObj.phno}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="address">Address</label>
                                    <input type="text" name="address" class="form-control" id="address" required="required">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="landmark">Landmark</label>
                                    <input type="text" name="landmark" class="form-control" id="landmark" required="required">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="city">City</label>
                                    <input type="text" name="city" class="form-control" id="city" required="required">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="state">State</label>
                                    <input type="text" name="state" class="form-control" id="state" required="required">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="pincode">Pincode</label>
                                    <input type="text" name="pincode" class="form-control" id="pincode" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Payment Mode</label>
                                <select class="form-control" name="paymentType" id="paymentType">
                                    <option value="noSelect">--Select--</option>
                                    <option value="COD">Cash on Delivery</option>
                                    <option value="Online">Online Payment</option>
                                </select>
                            </div>

                            <div class="text-center">
                                <input type="submit" class="btn btn-warning" id="orderBtn" value="Order Now">
                                <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript Validation -->
    <script>
        var isCartEmpty = <%= isCartEmpty %>;

        function validateOrder() {
            if (isCartEmpty) {
                alert("Please add items to your cart before placing an order.");
                return false;
            }
            
            var paymentType = document.getElementById("paymentType").value;
            if (paymentType === "noSelect") {
                alert("Please select a payment mode before placing your order.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
