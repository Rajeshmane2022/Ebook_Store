<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sell Your Book</title>
    <%@include file="all_Components/allCss.jsp"%>
    <style>
        .sell-form {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .btn-sell {
            width: 120px;
        }
    </style>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_Components/Navbar.jsp"%>
    <div class="container">
        <h3 class="text-center">Sell Your Book</h3>
        <form action="SellBookServlet" method="post" enctype="multipart/form-data" class="sell-form">
            <div class="form-group">
                <label>Book Name:</label>
                <input type="text" name="bookName" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Author Name:</label>
                <input type="text" name="authorName" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Price:</label>
                <input type="number" name="price" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Upload Photo:</label>
                <input type="file" name="bookImage" class="form-control" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary btn-sell">Sell</button>
            </div>
        </form>
    </div>
</body>
</html>