/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package table;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author BRAYAN
 */
public class sousTitre {
    String sousTitre;

    public sousTitre(String sousTitre) {
        this.sousTitre = sousTitre;
    }

    public String getSousTitre() {
        return sousTitre;
    }

    public void setSousTitre(String sousTitre) {
        this.sousTitre = sousTitre;
    }
        public static void insertionTitre( String soustitre , String id, String image, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO soustitre_pub values (NULL,'" + soustitre + "','" + id + "','" + image + "')";
        sttm.executeUpdate(sql);
        
    }    
        
    public static ResultSet afficher(String id, Connection Conn) throws Exception {
        String sql =
                "  SELECT * \n" +
                "FROM soustitre_pub \n" +
                "inner join titre_pub on titre_pub.id_sousTitre = soustitre_pub.id_sousTitre";
        Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }
           
        public static ResultSet getAllTitre(Connection Conn) throws Exception {
        
        Statement s = Conn.createStatement();
        String req = "SELECT * FROM titre_pub";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }        
        public static ResultSet getsous_Titre(String id, Connection Conn) throws Exception {
        
        Statement s = Conn.createStatement();
        String req = "SELECT * FROM soustitre_pub where soustitre_pub.id_tittrePub ='"+id+"' " ;

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }  
        public static ResultSet getAllTitreSousTitre(Connection Conn) throws Exception {
        
        Statement s = Conn.createStatement();
        String req = "select * \n" +
                    "from titre_pub \n" +
                    "inner join soustitre_pub on soustitre_pub .id_tittrepub = titre_pub.id_tittrepub;";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        
        public static ResultSet titre_soustitre (String id, Connection Conn) throws Exception {
        String sql =
                "  SELECT * \n" +
                "FROM soustitre_pub \n" +
                "inner join titre_pub on titre_pub.id_sousTitre = soustitre_pub.id_sousTitre";
        Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }

       
}
