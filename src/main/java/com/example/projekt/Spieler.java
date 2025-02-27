package com.example.projekt;

public class Spieler {
    private int spielerID;
    private String vorname;
    private String name;
    private String position;
    private int trikotnummer;
    private boolean verletzt;
    private String mannschaft;

    public Spieler(int spielerID, String vorname, String name, String position, int trikotnummer, boolean verletzt, String mannschaft) {
        this.spielerID = spielerID;
        this.vorname = vorname;
        this.name = name;
        this.position = position;
        this.trikotnummer = trikotnummer;
        this.verletzt = verletzt;
        this.mannschaft = mannschaft;
    }

    // Getter und Setter Methoden
    public int getSpielerID() {
        return spielerID;
    }

    public void setSpielerID(int spielerID) {
        this.spielerID = spielerID;
    }

    public String getVorname() {
        return vorname;
    }

    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getTrikotnummer() {
        return trikotnummer;
    }

    public void setTrikotnummer(int trikotnummer) {
        this.trikotnummer = trikotnummer;
    }

    public boolean isVerletzt() {
        return verletzt;
    }

    public void setVerletzt(boolean verletzt) {
        this.verletzt = verletzt;
    }

    public String getMannschaft() {
        return mannschaft;
    }

    public void setMannschaft(String mannschaft) {
        this.mannschaft = mannschaft;
    }
}
