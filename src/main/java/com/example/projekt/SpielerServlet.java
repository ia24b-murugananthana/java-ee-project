package com.example.projekt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/spielerServlet")
public class SpielerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teamName = request.getParameter("team"); // Team aus URL holen
        SpielerDAO spielerDAO = new SpielerDAO();
        List<Spieler> spielerListe = null;
        String errorMessage = null;
        String jspPage = "spielerOverview.jsp"; // Standardseite (falls kein Team angegeben)

        if (teamName == null || teamName.isEmpty()) {
            errorMessage = "Kein Team angegeben.";
        } else {
            try {
                spielerListe = spielerDAO.getSpielerByTeam(teamName);
                if (spielerListe.isEmpty()) {
                    errorMessage = "Es wurden keine Spieler für " + teamName + " gefunden.";
                }
            } catch (SQLException e) {
                errorMessage = "Datenbankfehler: " + e.getMessage();
                e.printStackTrace();
            }
        }

        request.setAttribute("spielerListe", spielerListe);
        request.setAttribute("error", errorMessage);
        request.setAttribute("teamName", teamName); // Team-Name für JSP

        // Entscheide, welche JSP geladen wird
        if ("FC Barcelona".equals(teamName)) {
            jspPage = "spielerBarcelona.jsp";
        } else if ("FC Liverpool".equals(teamName)) {
            jspPage = "spielerLiverpool.jsp";
        }

        request.getRequestDispatcher(jspPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String spielerIDStr = request.getParameter("spielerID");
            if (spielerIDStr != null) {
                int spielerID = Integer.parseInt(spielerIDStr);
                try {
                    // Lösche den Spieler aus der Datenbank
                    SpielerDAO spielerDAO = new SpielerDAO();
                    boolean success = spielerDAO.deleteSpieler(spielerID); // Spieler löschen
                    if (success) {
                        response.sendRedirect("spielerServlet?team=" + request.getParameter("team")); // Zurück zur Teamseite
                    } else {
                        response.sendRedirect("spielerServlet?team=" + request.getParameter("team") + "&error=Fehler beim Löschen des Spielers");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendRedirect("spielerServlet?team=" + request.getParameter("team") + "&error=Datenbankfehler");
                }
            }
        }
    }
}
