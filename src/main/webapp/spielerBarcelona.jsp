<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FC Barcelona - Spieler</title>
    <link rel="stylesheet" href="spielerBarca.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="main-container">
    <header class="header">
        <h1>FC Barcelona - Spieler</h1>
        <div class="header-actions">
            <a href="index.jsp" class="action-button logout">Abmelden</a>
            <a href="mannschaftsuebersicht.jsp" class="action-button team-overview">Mannschaft</a>
            <a href="spielerhinzufuegen.jsp" class="action-button add-player">Spieler Hinzufügen</a>
        </div>
    </header>

    <div class="player-table-container">
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>

        <c:if test="${not empty spielerListe}">
            <table class="player-table">
                <thead>
                <tr>
                    <th>Vorname</th>
                    <th>Nachname</th>
                    <th>Position</th>
                    <th>Trikotnummer</th>
                    <th>Verletzungsstatus</th>
                    <th>Aktionen</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="spieler" items="${spielerListe}">
                    <tr>
                        <td>${spieler.vorname}</td>
                        <td>${spieler.name}</td>
                        <td>${spieler.position}</td>
                        <td>${spieler.trikotnummer}</td>
                        <td>
                            <c:choose>
                                <c:when test="${spieler.verletzt}">
                                    <span class="injured">❌ Verletzt</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="healthy">✔ Fit</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="spielerServlet?action=delete&spielerID=${spieler.spielerID}&team=${teamName}"
                               class="delete-button"
                               onclick="return confirm('Möchtest du diesen Spieler wirklich löschen?');">
                                Löschen
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>