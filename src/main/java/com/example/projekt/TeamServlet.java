package com.example.projekt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/teamServlet")
public class TeamServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teamId = request.getParameter("teamId");

        // Weiterleitung zur entsprechenden Spieler-Seite
        if ("1".equals(teamId)) {
            response.sendRedirect("spielerServlet?team=FC%20Barcelona"); // FC Barcelona
        } else if ("2".equals(teamId)) {
            response.sendRedirect("spielerServlet?team=FC%20Liverpool"); // FC Liverpool
        } else if ("3".equals(teamId)) {
            response.sendRedirect("spielerServlet?team=Inter%20Miami"); // Inter Miami
        }
    }
}
