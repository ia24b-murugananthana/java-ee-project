<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fussballverwaltung - Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="login-container">
    <h1>Fussballverwaltung</h1>
    <h2>Herzlich Willkommen</h2>

    <c:if test="${not empty param.error}">
        <div class="error">Ungültiger Benutzername oder Passwort</div>
    </c:if>

    <form action="login" method="post">
        <input type="text" name="username" placeholder="Benutzername" required><br>
        <input type="password" name="password" placeholder="Passwort" required><br>
        <button type="submit">Anmelden</button>
    </form>
</div>

</body>
</html>
