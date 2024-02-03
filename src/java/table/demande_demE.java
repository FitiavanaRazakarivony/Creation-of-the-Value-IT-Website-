/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package table;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Workdev
 */
public class demande_demE {
    String contenu_demI;
    String date_demI;
    String ficheDePoste_demI;  
    String id_demandeI;

    public demande_demE(String contenu_demI, String date_demI, String ficheDePoste_demI, String id_demandeI) {
        this.contenu_demI = contenu_demI;
        this.date_demI = date_demI;
        this.ficheDePoste_demI = ficheDePoste_demI;
        this.id_demandeI = id_demandeI;
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
      
    public static void estinsertDemand_demI (String contenu,String id, Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql =" INSERT INTO demande_demE values(NULL,NOW(),'"+ contenu +"','"+id+"')";
        sttm.executeUpdate(sql);

    }
    
    
    
     // compter valeur chartp
    public static int getSumValueByMonth(Connection conn, int month) {
        try {
            int sumValue = 0;
            String sql = " SELECT count(id_demex) AS total FROM demande_deme WHERE MONTH(date_demex) = '"+month+"'";
            
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
        public static ResultSet getAfficheDemObjEx(Connection Conn) throws Exception {
        
        Statement s = Conn.createStatement();
        String req = 
                "select * \n" +
                "from demande_demE\n" +
                "inner join objet_demandei on objet_demandei.id_objetdemi = demande_deme .id_objetdemi\n" +
                "ORDER BY id_demEx desc\n" +
                "limit 1";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        public static int getLast(Connection con)throws Exception{
              Statement s = con.createStatement();
        String req = 
                "select * \n" +
                "from demande_demE\n" +
                "inner join objet_demandei on objet_demandei.id_objetdemi = demande_deme .id_objetdemi\n" +
                "ORDER BY id_demEx desc\n" +
                "limit 1";
        ResultSet reslSt = s.executeQuery(req);
        while(reslSt.next())
        {
            return reslSt.getInt("id_demex");
        }
        return 1;
        }
}
