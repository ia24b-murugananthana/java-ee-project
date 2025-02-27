<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>FC Liverpool - Spieler</title>
    <link rel="stylesheet" type="text/css" href="spielerLiverpool.css">
</head>
<body>
<div class="header">
    <h1>FC Liverpool - Spieler</h1>
    <div class="buttons">
        <a href="login.jsp" class="button">Abmelden</a>
        <a href="mannschaftsuebersicht.jsp" class="button">Mannschaftsübersicht</a>
        <a href="spielerhinzufuegen.jsp" class="button">Spieler hinzufügen</a>
    </div>
</div>

<c:if test="${not empty error}">
    <p class="error">${error}</p>
</c:if>

<c:if test="${not empty spielerListe}">
    <table>
        <tr>
            <th>Vorname</th>
            <th>Nachname</th>
            <th>Position</th>
            <th>Trikotnummer</th>
            <th>Verletzungsfrei</th>
            <th>Aktionen</th> <!-- Spalte für den Löschen-Button -->
        </tr>
        <c:forEach var="spieler" items="${spielerListe}">
            <tr>
                <td>${spieler.vorname}</td>
                <td>${spieler.name}</td>
                <td>${spieler.position}</td>
                <td>${spieler.trikotnummer}</td>
                <td>
                    <c:choose>
                        <c:when test="${spieler.verletzt}">
                            <span style="color: red;">❌</span> <!-- Rotes Kreuz für verletzt -->
                        </c:when>
                        <c:otherwise>
                            <span style="color: green;">✔</span> <!-- Grüner Haken für nicht verletzt -->
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <!-- Löschen-Button -->
                    <form action="spielerServlet" method="POST" style="display:inline;">
                        <input type="hidden" name="spielerID" value="${spieler.spielerID}" />
                        <button type="submit" name="action" value="delete" class="delete-button">Löschen</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
