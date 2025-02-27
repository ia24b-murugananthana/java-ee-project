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
        String teamId = request.getParameter("teamId");


        SpielerDAO spielerDAO = new SpielerDAO();


        List<Spieler> spielerListe = null;


        spielerListe = spielerDAO.getSpielerByTeamId(teamId);


        request.setAttribute("spielerListe", spielerListe);


        request.getRequestDispatcher("spielerOverview.jsp").forward(request, response);
    }
}
