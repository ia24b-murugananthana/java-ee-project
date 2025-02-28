package com.example.projekt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/SpielerHinzufuegenServlet")
public class SpielerHinzufuegenServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vorname = request.getParameter("vorname");
        String nachname = request.getParameter("nachname");
        String position = request.getParameter("position");
        int trikotnummer = Integer.parseInt(request.getParameter("trikotnummer"));
        boolean verletzt = request.getParameter("verletzt") != null;
        int mannschaftID = Integer.parseInt(request.getParameter("mannschaft"));

        // DB-Verbindung
        String dbURL = "jdbc:mysql://localhost:3306/fussball_db";
        String dbUser = "root";
        String dbPass = "";

        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String sql = "INSERT INTO Spieler (Vorname, Name, Position, Trikotnummer, Verletzt, MannschaftID) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, vorname);
            statement.setString(2, nachname);
            statement.setString(3, position);
            statement.setInt(4, trikotnummer);
            statement.setBoolean(5, verletzt);
            statement.setInt(6, mannschaftID);

            int row = statement.executeUpdate();
            if (row > 0) {
                // Spieler erfolgreich hinzugefügt, je nach Mannschaft weiterleiten
                if (mannschaftID == 1) {
                    response.sendRedirect("spielerServlet?team=FC%20Barcelona"); // Weiterleitung zur Barcelona-Seite
                } else if (mannschaftID == 2) {
                    response.sendRedirect("spielerServlet?team=FC%20Liverpool"); // Weiterleitung zur Liverpool-Seite
                } else if (mannschaftID == 3) {
                    response.sendRedirect("spielerServlet?team=Inter%20Miami"); // Weiterleitung zur Inter Miami-Seite
                }
            } else {
                response.sendRedirect("fehler.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("fehler.jsp").forward(request, response);
        }
    }
}
