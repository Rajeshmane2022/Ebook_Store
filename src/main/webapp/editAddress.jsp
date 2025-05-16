<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Address</title>
<%@include file="all_Components/allCss.jsp"%>
<style>
    .container {
        max-width: 600px;
    }
    .card {
        padding: 20px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .row .col-md-6 {
        padding-right: 5px;
        padding-left: 5px;
    }
</style>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_Components/Navbar.jsp"%>
    
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <h4 class="text-center text-primary">Update Address</h4>
                    
                    <form action="updateAddress" method="post">
                        <div class="form-group">
                            <label>Address</label>
                            <textarea class="form-control" name="address" rows="2" required></textarea>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <label>Landmark</label>
                                <input type="text" class="form-control" name="landmark" required>
                            </div>
                            <div class="col-md-6">
                                <label>City</label>
                                <input type="text" class="form-control" name="city" required>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-md-6">
                                <label>State</label>
                                <input type="text" class="form-control" name="state" required>
                            </div>
                            <div class="col-md-6">
                                <label>Zip Code</label>
                                <input type="text" class="form-control" name="zip" required>
                            </div>
                        </div>
                        <div class="text-center mt-3">
                            <button type="submit" class="btn btn-primary">Add Address</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>