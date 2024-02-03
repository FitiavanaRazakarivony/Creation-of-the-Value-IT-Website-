/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package table;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class admin {
    
    String nom_admin;
    String prenom_admin;
    String email_admin;

    public admin(String nom_admin, String prenom_admin, String email_admin) {
        this.nom_admin = nom_admin;
        this.prenom_admin = prenom_admin;
        this.email_admin = email_admin;
    }

    public String getNom_admin() {
        return nom_admin;
    }

    public void setNom_admin(String nom_admin) {
        this.nom_admin = nom_admin;
    }

    public String getPrenom_admin() {
        return prenom_admin;
    }

    public void setPrenom_admin(String prenom_admin) {
        this.prenom_admin = prenom_admin;
    }

    public String getEmail_admin() {
        return email_admin;
    }

    public void setEmail_admin(String email_admin) {
        this.email_admin = email_admin;
    }   
    
    public static void insertionVersAdmin(String nom_admin, String prenom_admin,String motdepass_visit, String email_admin,String type,String image
    , String pseudo, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO admin values (NULL,'" + nom_admin + "','" + prenom_admin + "','" + motdepass_visit + "','"+ email_admin + "','"+ type + "','"+ image + "','"+ pseudo + "')";
        
        sttm.executeUpdate(sql);

        // insert,update,delete==>executeUpdate de akotrany reo de ExecuteQuery
    }
    public static void estSupprAdmin (Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " DELETE FROM admin ";
        sttm.executeUpdate(sql);

    }
    
    public static boolean checkloginAdmin(String pseudo, String motdepass_admin, Connection Conn) throws Exception {
        java.sql.Statement sttm = Conn.createStatement();
        String sql = "SELECT * FROM admin WHERE pseudo_admin='" + pseudo + "' and motdepass_admin='" + motdepass_admin+ "' ";
        ResultSet res = sttm.executeQuery(sql); // executer anle requete io ambony io

        if (res.next() == true) { // eto izy mametraka oe misy ve ilay requette
            return true;
        } else {
            return false;
        }
    }
    public static ResultSet afficherAdmin(String pseudo_admin, Connection Conn) throws Exception {
        String sql = "SELECT * FROM admin where pseudo_admin= '" + pseudo_admin + "' ";
        java.sql.Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }

    public static ResultSet getAllAdmin(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM admin";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }   
        public static boolean getType_Admin(String type_admin, Connection Conn) throws Exception {
        String sql = "SELECT * FROM admin where type_admin= '" + type_admin + "' ";
        java.sql.Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);      
        
        if (res.next() == true) { // eto izy mametraka oe misy ve ilay requette
            return true;
        } else {
            return false;
        }
    }
       
}
