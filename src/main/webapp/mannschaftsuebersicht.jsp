<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Mannschaftsübersicht</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: white;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }

        .team-button {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            background: #007bff;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none;
        }
        .team-button:hover {
            background: #0056b3;
        }
        .login-link {
            position: absolute;
            top: 10px;
            right: 10px;
            text-decoration: none;
            font-size: 16px;
            color: white;
            background: #007bff;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .login-link:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<a href="login.jsp" class="login-link">Abmelden</a>

<div class="container">
    <h1>Mannschaftsübersicht</h1>

    <div class="teams">
        <div class="team">
            <a href="barca.jsp" class="team-button">FC Barcelona</a>
        </div>
        <div class="team">
            <a href="miami.jsp" class="team-button">Inter Miami</a>
        </div>
    </div>
</div>

</body>
</html>
