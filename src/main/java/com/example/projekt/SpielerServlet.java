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
        String action = request.getParameter("action");
        String teamName = request.getParameter("team");

        if (teamName == null || "null".equals(teamName) || teamName.trim().isEmpty()) {
            response.sendRedirect("mannschaftsuebersicht.jsp");
            return;
        }

        SpielerDAO spielerDAO = new SpielerDAO();

        if ("delete".equals(action)) {
            String spielerIDStr = request.getParameter("spielerID");
            if (spielerIDStr != null) {
                int spielerID = Integer.parseInt(spielerIDStr);
                try {
                    spielerDAO.deleteSpieler(spielerID);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect("spielerServlet?team=" + teamName);
            return;
        }

        List<Spieler> spielerListe = null;
        String errorMessage = null;
        String jspPage = "spielerOverview.jsp";

        try {
            spielerListe = spielerDAO.getSpielerByTeam(teamName);
            if (spielerListe.isEmpty()) {
                errorMessage = "Es wurden keine Spieler für " + teamName + " gefunden.";
            }
        } catch (SQLException e) {
            errorMessage = "Datenbankfehler: " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("spielerListe", spielerListe);
        request.setAttribute("error", errorMessage);
        request.setAttribute("teamName", teamName);

        // Team-spezifische JSP-Auswahl
        if ("FC Barcelona".equals(teamName)) {
            jspPage = "spielerBarcelona.jsp";
        } else if ("FC Liverpool".equals(teamName)) {
            jspPage = "spielerLiverpool.jsp";
        } else if ("Inter Miami".equals(teamName)) {
            jspPage = "spielerInterMiami.jsp";  // Die Inter Miami-Seite, die du erstellen musst
        }

        request.getRequestDispatcher(jspPage).forward(request, response);
    }

    // Hier wird doPost() hinzugefügt, damit POST-Anfragen unterstützt werden
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
