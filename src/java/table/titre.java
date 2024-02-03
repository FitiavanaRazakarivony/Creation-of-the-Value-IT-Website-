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
public class titre {
    String titre;

    public titre(String titre) {
        this.titre = titre;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }
        
    public static void insertionTitre( String titre,Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO titre_pub values (NULL,'" + titre + "')";
        sttm.executeUpdate(sql);
        
    }    
        public static ResultSet getsousT_TitreP(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                " SELECT * FROM titre_pub inner join soustitre_pub on soustitre_pub.id_sousTitre  = titre_pub.id_sousTitre;";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    public static ResultSet getTitreP(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                " select  *\n" +
                "from publication  \n" +
                "inner join titre_pub on titre_pub.id_tittrepub = publication.id_tittrepub \n" +
                "inner join soustitre_pub on soustitre_pub.id_tittrepub = titre_pub.id_tittrepub; ";
                
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    public static ResultSet getTitre(Connection Conn) throws Exception {
        
        Statement s = Conn.createStatement();
        String req = 
                " Select * from titre_pub";
                
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
 
    public static ResultSet getIdTitreP(String id , Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                " select *\n" +
                " from titre_pub \n" +
                "inner join soustitre_pub on  soustitre_pub.id_soustitre = titre_pub.id_soustitre "
                + "inner join publication on publication.id_tittrepub = titre_pub.id_tittrepub where titre_pub.id_tittrepub = '"+id+"' ";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    
}
