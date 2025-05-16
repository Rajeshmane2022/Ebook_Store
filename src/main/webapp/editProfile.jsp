<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_Components/Navbar.jsp"%>

    <div class="container p-2">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center text-primary">Edit Profile</h4>

                        <!-- Success/Error Messages -->
                        <c:if test="${not empty successMsg}">
                            <div class="alert alert-success">${successMsg}</div>
                            <c:remove var="successMsg"/>
                        </c:if>
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger">${errorMsg}</div>
                            <c:remove var="errorMsg"/>
                        </c:if>

                        <form action="updateProfile" method="post">
                            <input type="hidden" value="${userObj.id}" name="id">

                            <div class="form-group">
                                <label for="name">Name</label> 
                                <input type="text" class="form-control" id="name" required name="name" value="${userObj.name}">
                            </div>

                            <div class="form-group">
                                <label for="email">Email address</label> 
                                <input type="email" class="form-control" id="email" required name="email" value="${userObj.email}">
                            </div>

                            <div class="form-group">
                                <label for="phno">Phone number</label> 
                                <input type="number" class="form-control" id="phno" required name="phno" value="${userObj.phno}">
                            </div>

                            <div class="form-group">
                                <label for="password">Enter Your Password</label> 
                                <input type="password" class="form-control" id="password" required name="password">
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
