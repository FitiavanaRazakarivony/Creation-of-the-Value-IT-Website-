/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package table;

/**
 *
 * @author Workdev
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class visiteur {

    public static boolean checklogin(String email_visit, String mdp, String string, Connection bdd) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    String nom_visit;
    String prenom_visit;
    String tel;
    String email_visit;
    String motdepass_visit;  
    String adress_visit;  
    String image_visit;

     public visiteur(String nom_visit, String prenom_visit, String tel, String email_visit, String motdepass_visit, String adress_visit,String image_visit ) {
        this.nom_visit = nom_visit;
        this.prenom_visit = prenom_visit;
        this.tel = tel;
        this.email_visit = email_visit;
        this.motdepass_visit = motdepass_visit;
        this.adress_visit = adress_visit;
        this.image_visit = image_visit;

    }

    public String getNom_visit() {
        return this.nom_visit;
    }

    public void setNom_visit(String nom_visit) {
        this.nom_visit = nom_visit;
    }

    public String getPrenom_visit() {
        return this.prenom_visit;
    }

    public void setPrenom_visit(String prenom_visit) {
        this.prenom_visit = prenom_visit;
    }

    public String getTel() {
        return this.tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail_visit() {
        return this.email_visit;
    }

    public void setEmail_visit(String email_visit) {
        this.email_visit = email_visit;
    }

    public String getMotdepass_visit() {
        return this.motdepass_visit;
    }

    public void setMotdepass_visit(String motdepass_visit) {
        this.motdepass_visit = motdepass_visit;
    }
    public String getAdress_visit() {
        return adress_visit;
    }

    public void setAdress_visit(String adress_visit) {
        this.adress_visit = adress_visit;
    }
    public String getImage_visit() {
        return image_visit;
    }

    public void setImage_visit(String image_visit) {
        this.image_visit = image_visit;
    }
    /*------------ admin -------*/    
    public static void insertionVersAdmin(String nom_admin, String prenom_admin, String email_admin
        , Connection Conn) throws Exception {

        Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO admin values (NULL,'" + nom_admin + "','" + prenom_admin + "','"
                + email_admin + "')";

        sttm.executeUpdate(sql);

    // insert,update,delete==>executeUpdate de akotrany reo de ExecuteQuery
    }
    /*------------ admin -------*/

    public static boolean checklogin(String pseudo, String motdepass_visit, Connection Conn) throws Exception {
        Statement sttm = Conn.createStatement();
        String sql = "SELECT * FROM visiteur WHERE pseudo_visit='" + pseudo + "' and motdepass_visit='" + motdepass_visit + "' limit 1";
        ResultSet res = sttm.executeQuery(sql); // executer anle requete io ambony io

        if (res.next() == true) { // eto izy mametraka oe misy ve ilay requette
            return true;
        } else {
            return false;
        }
    }

    public static ResultSet afficher(String email_visit, Connection Conn) throws Exception {
        String sql = "SELECT * FROM visiteur where email_visit= '" + email_visit + "' limit 1";
        Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }
    public static ResultSet compteVisiteur(Connection bdd) throws Exception {
        String sql = "SELECT count(*) as compte from visiteur;";
        Statement sttm = bdd.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }
    
   public static void estinsertVisit ( String nom,String prenom,String tel,String email, String mdp,String adress ,String image,String id_nosMet,String id_sexe,Connection Conn) throws Exception{
      
    java.sql.Statement sttm = Conn.createStatement();
    String sql =" INSERT INTO visiteur values(NULL, '"+nom+"','"+prenom+"','"+tel+"','"+email+"','"+mdp+"','"+adress+"','"+image+"','"+id_nosMet+"','"+id_sexe+"')";
    sttm.executeUpdate(sql);

  }
  
    /*--------------------------- HERITAGE contact --------------*/
      
    public class contact extends visiteur{
    
    String contact_visit;

        public contact(String contact_visit, String nom_visit, String prenom_visit, String tel, String email_visit, String motdepass_visit, String adress_visit, String image_visit) {
            super(nom_visit, prenom_visit, tel, email_visit, motdepass_visit, adress_visit, image_visit);
            this.contact_visit = contact_visit;
        }
           
        public String getContact_visit() {
            return contact_visit;
        }

        public void setContact_visit(String contact_visit) {
            this.contact_visit = contact_visit;
        }
    
    }
          
    public static void insertionContact( String contact_visit ,String id_visit, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO contact values (NULL, NOW(),'" + contact_visit + "','" + id_visit + "')";
        sttm.executeUpdate(sql);
        
    }  
    
    public static void modifVisit( int id_visit, String nom_visit, String prenom_visit, String tel,String email_visit, Connection Conn) throws Exception {

        String sql = "UPDATE visiteur SET nom_visit =?, prenom_visit =?, tel=?, email_visit=? WHERE id_visit =? ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.setString(1, nom_visit);   
        Stmt.setString(2,prenom_visit);     
        Stmt.setString(3,tel);      
        Stmt.setString(4,email_visit);       
        Stmt.setInt(5,id_visit);

        Stmt.executeUpdate();
        
    } 
    
    public static void modifSexVisitRecru( int id_visit, String nom_visit, String prenom_visit, String tel,String email_visit, Connection Conn) throws Exception {

        String sql = "UPDATE visiteur SET nom_visit =?, prenom_visit =?, tel=?, email_visit=? WHERE id_visit =? ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.setString(1, nom_visit);   
        Stmt.setString(2,prenom_visit);     
        Stmt.setString(3,tel);      
        Stmt.setString(4,email_visit);       
        Stmt.setInt(5,id_visit);

        Stmt.executeUpdate();
        
    } 
    public static void modifEmpl_eurInt( String id_visit, String id_nosMet, Connection Conn) throws Exception {

        String sql = "UPDATE visiteur SET id_nosMet ='"+id_nosMet+"' WHERE id_visit = '"+id_visit+"' ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.executeUpdate();        
    } 
            
}


