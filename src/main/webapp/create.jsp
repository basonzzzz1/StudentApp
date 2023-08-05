<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Create Student</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f8f8;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    form {
      border: 1px solid #ddd;
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 400px;
    }

    .form-header {
      text-align: center;
      font-size: 24px;
      color: #252585;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-input {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
      font-size: 16px;
      color: #333;
    }

    .form-button {
      width: 100%;
      padding: 12px;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 18px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .form-button:hover {
      background-color: #45a049;
    }

    ::placeholder {
      color: #999;
    }
  </style>
</head>
<body>
<form action="http://localhost:8080/students?action=create" method="post">
  <div class="form-header">Create Student</div>
<%--  <div class="form-group">--%>
<%--    <label for="id">ID</label>--%>
<%--    <input type="text" name="id" id="id" placeholder="ID" class="form-input">--%>
<%--  </div>--%>
  <div class="form-group">
    <label for="name">Name</label>
    <input type="text" name="name" id="name" placeholder="Name" class="form-input">
  </div>
  <div class="form-group">
    <label for="age">Age</label>
    <input type="number" name="age" id="age" placeholder="Age" class="form-input">
  </div>
  <div class="form-group">
    <label for="address">Address</label>
    <input type="text" name="address" id="address" placeholder="Address" class="form-input">
  </div>
  <div class="form-group">
    <label for="image">Image URL</label>
    <input type="text" name="image" id="image" placeholder="Image URL" class="form-input">
  </div>
  <button type="submit" class="form-button">Thêm mới</button>
</form>
</body>
</html>
