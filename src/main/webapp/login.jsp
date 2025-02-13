<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fußballverwaltung - Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container h1 {
            font-size: 24px;
            margin-bottom: 5px;
        }
        .login-container h2 {
            font-size: 18px;
            margin-bottom: 20px;
            color: #666;
        }
        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
        }
        .login-container button:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h1>Fußballverwaltung</h1>
    <h2>Herzlich willkommen</h2>


    <c:if test="${not empty param.error}">
        <div class="error" style="display: block;">Ungültiger Benutzername oder Passwort</div>
    </c:if>


    <form action="login" method="post">
        <input type="text" name="username" placeholder="Benutzername" required><br>
        <input type="password" name="password" placeholder="Passwort" required><br>
        <button type="submit">Anmelden</button>
    </form>
</div>
</body>
</html>
