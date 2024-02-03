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
public class contact_ext {
    String date_contExt;
    String contact_contExt;

    public contact_ext(String date_contExt, String contact_contExt) {
        this.date_contExt = date_contExt;
        this.contact_contExt = contact_contExt;
    }

    public String getDate_contExt() {
        return date_contExt;
    }

    public void setDate_contExt(String date_contExt) {
        this.date_contExt = date_contExt;
    }

    public String getContact_contExt() {
        return contact_contExt;
    }

    public void setContact_contExt(String contact_contExt) {
        this.contact_contExt = contact_contExt;
    }
    
        
    public static void insertionContactEx(String contact ,String nom,String prenom,String email, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO contact_ext values (NULL, NOW(),'" + contact + "','" + nom + "','" + prenom + "','" + email + "')";
        sttm.executeUpdate(sql);
        
    }  
        public static ResultSet getMessagChef(Connection Conn) throws Exception {
        
        Statement s = Conn.createStatement();
        String req = 
                "SELECT DISTINCT id_contExt,nom_contExt , prenom_contEx,contact_contExt , email_contExt \n" +
                "FROM contact_ext  \n" +
                "ORDER BY id_contExt  desc;";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
}
