<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mannschaftsauswahl</title>
    <link rel="stylesheet" type="text/css" href="mannschaftsuebersicht.css">
</head>
<body>

<div class="main-container">
    <h1>Wählen Sie eine Mannschaft</h1>
    <div class="team-selection">
        <!-- FC Barcelona Container mit Blau als Hintergrund -->
        <a href="teamServlet?teamId=1" class="team-card barcelona">
            <div class="team-logo">
                <img src="images/barcelona-logo.png" alt="FC Barcelona Logo">
            </div>
            <div class="team-name">FC Barcelona</div>
        </a>

        <!-- FC Liverpool Container mit Rot als Hintergrund -->
        <a href="teamServlet?teamId=2" class="team-card liverpool">
            <div class="team-logo">
                <img src="images/liverpool-logo.png" alt="FC Liverpool Logo">
            </div>
            <div class="team-name">FC Liverpool</div>
        </a>
    </div>
</div>

</body>
</html>
