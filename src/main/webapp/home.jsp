<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME PAGE</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #252585;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }

        header h1 {
            font-size: 24px;
            margin: 0;
        }

        header a img {
            width: 35px;
            height: 35px;
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #252585;
            color: #fff;
        }

        img {
            width: 80px;
            height: 120px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        a {
            text-decoration: none;
            color: #252585;
        }

        a:hover {
            color: #b80000;
        }

        .add-button {
            display: inline-block;
            background-color: #b80000;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 10px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .add-button:hover {
            background-color: #f44336;
        }

        /* Style for the font-awesome icons */
        .fa {
            margin-right: 5px;
        }

        /* Style for the "Edit" and "Delete" links */
        .edit-link, .delete-link {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 3px;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background-color: #252585;
            transition: background-color 0.3s ease;
        }

        .edit-link:hover, .delete-link:hover {
            background-color: #4a4a9e;
        }

        /* Add spacing between "Edit" and "Delete" links */
        .edit-link {
            margin-right: 5px;
        }
        .add-link, .logout-link {
            display: inline-block;
            color: #fff;
            text-decoration: none;
            transition: opacity 0.3s ease;
        }

        .add-link .fa, .logout-link .fa {
            margin-right: 5px;
        }

        .add-link:hover, .logout-link:hover {
            opacity: 1;
        }
        /* Style for the "Search" link */
        .search-link {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 3px;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background-color: #252585;
            transition: background-color 0.3s ease;
        }

        .search-link:hover {
            background-color: #4a4a9e;
        }
    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<header style="background-color: #252585; color: #fff; padding: 10px; border-radius: 5px; display: flex; justify-content: space-between; align-items: center;">
    <h1 style="font-size: 24px; margin: 0;">Manage Students</h1>
    <a href="http://localhost:8080/students?action=create" target="_blank" class="add-link" style="text-decoration: none; color: #fff; background-color: #4CAF50; padding: 10px 15px; border-radius: 5px;">
        <i class="fas fa-plus"></i>Add Student
    </a>
    <form action="/students" method="get" style="display: flex; align-items: center;">
        <input type="hidden" name="action" value="search">
        <input type="text" placeholder="Search" name="nameSearch" style="padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-right: 10px;">
        <button type="submit" style="background-color: #252585; color: #fff; padding: 10px 15px; border: none; border-radius: 5px; cursor: pointer;">
            <i class="fas fa-search"></i>Search
        </button>
    </form>
    <a href="http://localhost:8080/User?action=logout" class="logout-link" style="text-decoration: none; color: #fff; background-color: #b80000; padding: 10px 15px; border-radius: 5px;">
        <i class="fas fa-sign-out-alt"></i>Logout
    </a>
</header>
<table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
    <tr style="background-color: #252585; color: #fff;">
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Address</th>
        <th>Image</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>${student.address}</td>
            <td><img src="${student.image}" alt="Student Image" style="width: 80px; height: 120px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);"></td>
            <td>
                <a href="http://localhost:8080/students?action=edit&id=${student.id}" class="edit-link" style="display: inline-block; padding: 5px 10px; border-radius: 3px; text-align: center; text-decoration: none; color: #fff; background-color: #252585;">
                    <i class="fas fa-edit"></i>Edit
                </a>
            </td>
            <td>
                <a href="http://localhost:8080/students?action=delete&id=${student.id}" class="delete-link" style="display: inline-block; padding: 5px 10px; border-radius: 3px; text-align: center; text-decoration: none; color: #fff; background-color: #b80000;">
                    <i class="fas fa-trash-alt"></i>Delete
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
