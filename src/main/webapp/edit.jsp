<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Student</title>
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
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        img {
            max-width: 100%;
            height: auto;
            margin-bottom: 15px;
            display: block;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #252585;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        button:hover {
            background-color: #1a1a66;
        }

        input[type="text"]::placeholder,
        input[type="number"]::placeholder {
            color: #999;
        }
    </style>
</head>
<body>
<form action="/students" method="post">
    <input type="text" name="id" placeholder="ID" value="">
    <input type="text" name="name" placeholder="Name">
    <input type="number" name="age" placeholder="Age">
    <input type="text" name="address" placeholder="Address">
    <input type="text" name="image" placeholder="Image URL">
    <button type="submit">Save Changes</button>
</form>
</body>
</html>
