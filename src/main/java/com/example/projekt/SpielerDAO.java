package com.example.projekt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SpielerDAO {


    public List<Spieler> getSpielerByTeamId(String teamId) {
        List<Spieler> spielerListe = new ArrayList<>();
        String query = "SELECT SpielerID, Vorname, Name, Position, Trikotnummer, Verletzt, Mannschaft.Name AS Mannschaft " +
                "FROM Spieler " +
                "JOIN Mannschaft ON Spieler.MannschaftID = Mannschaft.MannschaftID";


        if (teamId != null && !teamId.isEmpty()) {
            query += " WHERE Mannschaft.MannschaftID = ?";
        }

        try (Connection connection = com.example.projekt.DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {


            if (teamId != null && !teamId.isEmpty()) {
                preparedStatement.setInt(1, Integer.parseInt(teamId));
            }

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                // Ergebnisse verarbeiten und in eine Liste von Spielern speichern
                while (resultSet.next()) {
                    int spielerID = resultSet.getInt("SpielerID");
                    String vorname = resultSet.getString("Vorname");
                    String name = resultSet.getString("Name");
                    String position = resultSet.getString("Position");
                    int trikotnummer = resultSet.getInt("Trikotnummer");
                    boolean verletzt = resultSet.getBoolean("Verletzt");
                    String mannschaft = resultSet.getString("Mannschaft");

                    Spieler spieler = new Spieler(spielerID, vorname, name, position, trikotnummer, verletzt, mannschaft);
                    spielerListe.add(spieler);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return spielerListe;
    }
}
