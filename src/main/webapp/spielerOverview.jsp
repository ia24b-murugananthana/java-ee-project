<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Spieler Übersicht</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
<h1>Spieler Liste</h1>


<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<table>
    <tr>
        <th>ID</th>
        <th>Vorname</th>
        <th>Nachname</th>
        <th>Position</th>
        <th>Trikotnummer</th>
        <th>Verletzt</th>
        <th>Mannschaft</th>
    </tr>


    <c:forEach var="spieler" items="${spielerListe}">
        <tr>
            <td>${spieler.spielerID}</td>
            <td>${spieler.vorname}</td>
            <td>${spieler.name}</td>
            <td>${spieler.position}</td>
            <td>${spieler.trikotnummer}</td>
            <td>${spieler.verletzt ? 'Ja' : 'Nein'}</td>
            <td>${spieler.mannschaft}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
