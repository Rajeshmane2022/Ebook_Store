<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help Center</title>
    <%@include file="all_Components/allCss.jsp" %>
    <style>
        .help-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 80vh;
            text-align: center;
        }
        .icon {
            font-size: 3rem;
            color: #007bff;
        }
        .home-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%@include file="all_Components/Navbar.jsp" %>
    
    <div class="container help-container">
        <i class="fa-solid fa-headset icon"></i>
        <h2>Need Help? We're here 24/7!</h2>
        <p>Contact our support team at:</p>
        <h4><i class="fa-solid fa-phone"></i> +91 8308727594</h4>
        <p>Email us at: <strong>support@ebookstore.com</strong></p>
        
        <a href="index.jsp" class="btn btn-primary home-btn">
            <i class="fa-solid fa-home"></i> Home
        </a>
    </div>
</body>
</html>