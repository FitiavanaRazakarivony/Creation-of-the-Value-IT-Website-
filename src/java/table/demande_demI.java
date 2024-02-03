/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Workdev
 */
public class demande_demI {

    private static int getSumValueByMonth(Connection conn, int year, int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    String contenu_demI;
    String date_demI;
    String ficheDePoste_demI;  
    String id_demandeI;

    public demande_demI(String contenu_demI, String date_demI, String ficheDePoste_demI,String id_demandeI) {
        this.contenu_demI = contenu_demI;
        this.date_demI = date_demI;
        this.ficheDePoste_demI = ficheDePoste_demI;
        this.id_demandeI = id_demandeI;

    }

    private demande_demI(Date date, int count) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getContenu_demI() {
        return contenu_demI;
    }

    public void setContenu_demI(String contenu_demI) {
        this.contenu_demI = contenu_demI;
    }

    public String getDate_demI() {
        return date_demI;
    }

    public void setDate_demI(String date_demI) {
        this.date_demI = date_demI;
    }

    public String getFicheDePoste_demI() {
        return ficheDePoste_demI;
    }

    public void setFicheDePoste_demI(String ficheDePoste_demI) {
        this.ficheDePoste_demI = ficheDePoste_demI;
    }

    public String getId_demandeI() {
        return id_demandeI;
    }

    public void setId_demandeI(String id_demandeI) {
        this.id_demandeI = id_demandeI;
    }
    
        public static void estinsertDemand_demI ( String contenu,String ficheDePoste, String id_objet, Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql =" INSERT INTO demande_demI values(NULL,'"+contenu+"',NOW(),'"+ficheDePoste+"','"+ id_objet +"')";
        sttm.executeUpdate(sql);

    }
        // compter valeur chartp
    public static int getSumValueByMonth(Connection conn, int month) {
        try {
            int sumValue = 0;
            String sql = "SELECT count(id_demI) AS total FROM demande_demI WHERE MONTH(date_demI) = '"+month+"'";
            
            java.sql.Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            // Récupérer la somme des valeurs pour le mois spécifié
            while (res.next()) {
                sumValue = res.getInt("total");
            }
            
            return sumValue;
        } catch (SQLException ex) {
            Logger.getLogger(demande_demI.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    // Fonction pour récupérer les sommes des valeurs pour les 12 mois
    public static int[] getSumValuesForAllMonths(Connection conn) {
        int[] sumValues = new int[12];
        for (int i = 1; i <= 12; i++) {
            sumValues[i - 1] = getSumValueByMonth(conn, i);
        }
        return sumValues;
    }
    public static ResultSet getAfficheDemObjIn(Connection Conn) throws Exception {
        
        Statement s = Conn.createStatement();
        String req = 
                "select * \n" +
                "from demande_demi \n" +
                "inner join objet_demandei on objet_demandei.id_objetdemi= demande_demi .id_objetdemi\n" +
                "ORDER BY id_demI desc\n" +
                "limit 1";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
           
    public static ResultSet getAfficheDemObj(Connection Conn) throws Exception {
        
        Statement s = Conn.createStatement();
        String req = 
                "select * \n" +
                "from demande_demi\n" +
                "inner join objet_demandei on objet_demandei.id_objetdemi = demande_demi .id_objetdemi\n" +
                "ORDER BY id_demI desc\n" +
                "limit 1";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
}

