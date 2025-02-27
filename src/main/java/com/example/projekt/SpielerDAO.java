package com.example.projekt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SpielerDAO {

    // Vorhandene Methode zum Abrufen der Spieler nach Teamname
    public List<Spieler> getSpielerByTeam(String teamName) throws SQLException {
        List<Spieler> spielerListe = new ArrayList<>();
        String query = "SELECT Spieler.SpielerID, Spieler.Vorname, Spieler.Name AS SpielerName, Spieler.Position, " +
                "Spieler.Trikotnummer, Spieler.Verletzt, Mannschaft.Name AS MannschaftName " +
                "FROM Spieler " +
                "JOIN Mannschaft ON Spieler.MannschaftID = Mannschaft.MannschaftID " +
                "WHERE Mannschaft.Name = ?"; // Filter nach TeamName

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, teamName); // Teamname als Parameter setzen

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int spielerID = resultSet.getInt("SpielerID");
                    String vorname = resultSet.getString("Vorname");
                    String name = resultSet.getString("SpielerName");
                    String position = resultSet.getString("Position");
                    int trikotnummer = resultSet.getInt("Trikotnummer");
                    boolean verletzt = resultSet.getBoolean("Verletzt");
                    String mannschaft = resultSet.getString("MannschaftName");

                    Spieler spieler = new Spieler(spielerID, vorname, name, position, trikotnummer, verletzt, mannschaft);
                    spielerListe.add(spieler);
                }
            }
        }
        return spielerListe;
    }

    // Neue Methode zum Löschen eines Spielers
    public boolean deleteSpieler(int spielerID) throws SQLException {
        String query = "DELETE FROM Spieler WHERE SpielerID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, spielerID); // Setzt die SpielerID als Parameter

            int rowsAffected = preparedStatement.executeUpdate();

            // Wenn rowsAffected > 0, bedeutet es, dass der Spieler erfolgreich gelöscht wurde
            return rowsAffected > 0;
        }
    }
}
