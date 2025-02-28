<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8">
  <title>Spieler hinzufügen</title>
  <link rel="stylesheet" type="text/css" href="spielerhinzufuegen.css">
  <style>
    /* Allgemeines Styling */
    body {
      font-family: Arial, sans-serif;
      background-color: #1e3c72;
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      position: relative;
    }

    /* Header-Leiste für den Titel und die Buttons */
    .header-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px;
      width: 100%;
      max-width: 1200px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
      animation: slideInDown 1s ease-in-out;
      backdrop-filter: blur(10px);
    }

    /* Titel Styling */
    .page-title {
      font-size: 2.5rem;
      color: #ffcc00;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
      margin: 0;
    }

    /* Navigationsbuttons */
    .nav-buttons {
      display: flex;
      gap: 10px;
    }

    .nav-buttons a {
      text-decoration: none;
      background-color: #ff6b6b;
      color: white;
      padding: 8px 16px;  /* Kleinere Polsterung */
      border-radius: 6px;
      font-size: 1rem;  /* Kleinere Schriftgröße */
      font-weight: bold;
      text-align: center;
      transition: background 0.3s ease;
    }

    .nav-buttons a:hover {
      background-color: #ff4757;
    }

    /* Formular-Container */
    .form-container {
      background: rgba(255, 255, 255, 0.1);
      padding: 30px;
      border-radius: 12px;
      width: 100%;
      max-width: 400px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
      text-align: center;
      margin-top: 40px;
    }

    /* Labels */
    label {
      font-size: 1rem;
      font-weight: bold;
      display: block;
      text-align: left;
      margin-top: 10px;
    }

    /* Eingabefelder */
    input, select {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 6px;
      font-size: 1rem;
      background: rgba(255, 255, 255, 0.2);
      color: white;
      margin-top: 5px;
      outline: none;
    }

    input::placeholder {
      color: rgba(255, 255, 255, 0.7);
    }

    /* Speichern-Button */
    button {
      width: 100%;
      padding: 12px;
      margin-top: 20px;
      border: none;
      border-radius: 6px;
      background: #ff6b6b;
      color: white;
      font-size: 1.2rem;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    button:hover {
      background: #ff4757;
    }

    /* Animationen */
    @keyframes slideInDown {
      from {
        transform: translateY(-100%);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }
  </style>
</head>
<body>

<div class="header-bar">
  <h1 class="page-title">Spieler hinzufügen</h1>
  <div class="nav-buttons">
    <a href="spielerServlet?team=FC%20Liverpool">FC Liverpool</a>
    <a href="spielerServlet?team=FC%20Barcelona">FC Barcelona</a>
    <a href="spielerServlet?team=Inter%20Miami">Inter Miami</a>
    <a href="index.jsp">Ausloggen</a>
  </div>
</div>

<div class="form-container">
  <form action="SpielerHinzufuegenServlet" method="post">

    <label for="vorname">Vorname:</label>
    <input type="text" id="vorname" name="vorname" placeholder="Vorname eingeben" required>

    <label for="nachname">Nachname:</label>
    <input type="text" id="nachname" name="nachname" placeholder="Nachname eingeben" required>

    <label for="position">Position:</label>
    <select id="position" name="position" required>
      <option value="Verteidiger">Verteidiger</option>
      <option value="Mittelfeld">Mittelfeld</option>
      <option value="Stürmer">Stürmer</option>
    </select>

    <label for="trikotnummer">Trikotnummer:</label>
    <input type="number" id="trikotnummer" name="trikotnummer" placeholder="Nummer eingeben" required>

    <div class="checkbox-container">
      <label for="verletzt">Verletzt:</label>
      <input type="checkbox" id="verletzt" name="verletzt">
    </div>

    <label for="mannschaft">Mannschaft:</label>
    <select id="mannschaft" name="mannschaft" required>
      <option value="1">FC Barcelona</option>
      <option value="2">FC Liverpool</option>
      <option value="3">Inter Miami</option>
    </select>

    <button type="submit">Speichern</button>
  </form>
</div>

</body>
</html>
