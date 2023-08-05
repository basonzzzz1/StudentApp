<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-container {
      border: 1px solid #ccc;
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      width: 350px;
    }

    .login-header {
      text-align: center;
      font-size: 24px;
      margin-bottom: 20px;
      color: #252585;
    }

    .login-input {
      width: 100%;
      padding: 12px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
      font-size: 16px;
      color: #333;
    }

    .login-input::placeholder {
      color: #999;
    }

    .login-button {
      width: 100%;
      padding: 12px;
      background-color: #252585;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 18px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .login-button:hover {
      background-color: #1a1a66;
    }

    .login-link {
      display: block;
      text-align: center;
      margin-top: 10px;
      font-size: 14px;
      color: #252585;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .login-link:hover {
      color: #b80000;
    }
  </style>
</head>
<body>
<div class="login-container">
  <div class="login-header">Login</div>
  <form action="http://localhost:8080/User?action=login" method="post">
    <input type="text" name="username" class="login-input" placeholder="Username">
    <input type="password" name="password" class="login-input" placeholder="Password">
    <button type="submit" class="login-button">Log In</button>
  </form>
  <a href="#" class="login-link">Forgot Password?</a>
</div>
</body>
</html>
