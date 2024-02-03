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

public class employeur {

    public static boolean checklogin(String email_visit, String mdp, String string, Connection bdd) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    String nom_visit;
    String prenom_visit;
    String tel;
    String email_visit;
    String motdepass_visit;  
    String adress_visit;  
    String type_visit;   
    String image_visit;   
    String id_nosmMet;    
    String id_sexe;    


    public employeur(String nom_visit, String prenom_visit, String tel, String email_visit, String motdepass_visit, String adress_visit, String type_visit,String image_visit,String id_nosmMet,String id_sexe) {
        this.nom_visit = nom_visit;
        this.prenom_visit = prenom_visit;
        this.tel = tel;
        this.email_visit = email_visit;
        this.motdepass_visit = motdepass_visit;
        this.adress_visit = adress_visit;
        this.type_visit = type_visit;
        this.image_visit = image_visit;
        this.id_nosmMet = id_nosmMet;
        this.id_sexe = id_sexe;

    }

    public String getNom_visit() {
        return nom_visit;
    }

    public void setNom_visit(String nom_visit) {
        this.nom_visit = nom_visit;
    }

    public String getPrenom_visit() {
        return prenom_visit;
    }

    public void setPrenom_visit(String prenom_visit) {
        this.prenom_visit = prenom_visit;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail_visit() {
        return email_visit;
    }

    public void setEmail_visit(String email_visit) {
        this.email_visit = email_visit;
    }

    public String getMotdepass_visit() {
        return motdepass_visit;
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

    public employeur(String type_visit) {
        this.type_visit = type_visit;
    }

    public String getImage_visit() {
        return image_visit;
    }

    public void setImage_visit(String image_visit) {
        this.image_visit = image_visit;
    }

    public String getId_nosmMet() {
        return id_nosmMet;
    }

    public void setId_nosmMet(String id_nosmMet) {
        this.id_nosmMet = id_nosmMet;
    }

    public String getId_sexe() {
        return id_sexe;
    }

    public void setId_sexe(String id_sexe) {
        this.id_sexe = id_sexe;
    }




    public static void insertionVisiteur(String nom_visit, String prenom_visit, String tel, String email_visit,
            String motdepass_visit, String id_sexe, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO visiteur values (NULL,'" + nom_visit + "','" + prenom_visit + "','" + tel + "','"
                + email_visit + "','" + motdepass_visit + "','" + id_sexe + "')";

        sttm.executeUpdate(sql);

        // insert,update,delete==>executeUpdate de akotrany reo de ExecuteQuery
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
   public static void estinsertVisit ( String nom,String prenom,String tel,String email, String mdp,String adress ,String type,String pseudo,String image,String id_nosMet,String id_sexe,Connection Conn) throws Exception{
      
    java.sql.Statement sttm = Conn.createStatement();
    String sql =" INSERT INTO visiteur values(NULL, '"+nom+"','"+prenom+"','"+tel+"','"+email+"','"+mdp+"','"+adress+"','"+type+"','"+pseudo+"','"+image+"','"+id_nosMet+"','"+id_sexe+"')";
    sttm.executeUpdate(sql);

  }
   //ensemblemen des liste travailleur (employer + demandeur accpeter externe)
    public static ResultSet getAllVisiteur(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                    "select visiteur.id_visit, visiteur.nom_visit, visiteur.prenom_visit, visiteur.email_visit, nosmetier.nom_nosmet, sexe.sexe from\n" +
"visiteur \n" +
"inner join nosmetier on nosmetier .id_nosmet = visiteur .id_nosMet \n" +
"inner join sexe on sexe .id_sexe = visiteur .id_sexe \n" +
"union\n" +
"select  demandeurexterne.id_eurext, demandeurexterne.nom_eurext, demandeurexterne.prenom_eurext, demandeurexterne.email_eurext, nosmetier.nom_nosmet, sexe.sexe\n" +
"from demandeurexterne  \n" +
"inner join teste on teste.id_eurext = demandeurexterne.id_eurext  \n" +
"inner join demande_accext on demande_accext.id_teste = teste.id_teste\n" +
"inner join annonce on annonce.id_ann = demandeurexterne.id_ann \n" +
"inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet  \n" +
"inner join sexe on sexe.id_sexe =demandeurexterne.id_sexe;";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
     public static ResultSet getIdVisiteur(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                    "select visiteur.id_visit, visiteur.nom_visit, visiteur.prenom_visit, visiteur.email_visit, nosmetier.nom_nosmet, sexe.sexe from\n" +
"visiteur \n" +
"inner join nosmetier on nosmetier .id_nosmet = visiteur .id_nosMet \n" +
"inner join sexe on sexe .id_sexe = visiteur .id_sexe \n" +
"union\n" +
"select  demandeurexterne.id_eurext, demandeurexterne.nom_eurext, demandeurexterne.prenom_eurext, demandeurexterne.email_eurext, nosmetier.nom_nosmet, sexe.sexe\n" +
"from demandeurexterne  \n" +
"inner join teste on teste.id_eurext = demandeurexterne.id_eurext  \n" +
"inner join demande_accext on demande_accext.id_teste = teste.id_teste\n" +
"inner join annonce on annonce.id_ann = demandeurexterne.id_ann \n" +
"inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet  \n" +
"inner join sexe on sexe.id_sexe =demandeurexterne.id_sexe ";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    
    public static ResultSet getAllnosMetRecher(String nom,Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                     "\"select *\\n\" +\n" +
                    "\"from visiteur\\n\" +\n" +
                    "\"inner join nosmetier on nosmetier .id_nosmet = visiteur .id_nosMet\\n\" +\n" +
                    " \"inner join sexe on sexe .id_sexe = visiteur .id_sexe WHERE nosmetier.nom_nosMet LIKE ?";

        String searchTerm = "%" + nom + "%";
        PreparedStatement statement = bdd.prepareStatement(req);
        statement.setString(1, searchTerm);
        ResultSet result = statement.executeQuery();
        return result;
        
 
    }
    public static ResultSet getIdAllVisiteur(String id , Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                    " select *\n" +
                    "from visiteur\n" +
                    "inner join nosmetier on nosmetier .id_nosmet = visiteur .id_nosMet\n" +
                    "inner join sexe on sexe .id_sexe = visiteur .id_sexe where id_visit = '" + id + "' ";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    /*------------ admin -------*/

    public static boolean checklogin(String email_visit, String motdepass_visit, Connection Conn) throws Exception {
        Statement sttm = Conn.createStatement();
        String sql = "SELECT * FROM visiteur WHERE email_visit='" + email_visit + "' and motdepass_visit='" + motdepass_visit + "' limit 1";
        ResultSet res = sttm.executeQuery(sql); // executer anle requete io ambony io

        if (res.next() == true) { // eto izy mametraka oe misy ve ilay requette
            return true;
        } else {
            return false;
        }
    }

    public static ResultSet afficher(String email_visit, Connection Conn) throws Exception {
        String sql = "SELECT * FROM visiteur where pseudo_visit= '" + email_visit + "' limit 1";
        Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }
    public static void modifEmpl( int id_visit, String nom_visit, String prenom_visit, String tel_visit,
            String email_visit,String motdepass_visit,String adress_visit, String type,String image_visit,String pseudo_visit, String id_nosMet,String id_sexe, Connection Conn) throws Exception {

        String sql = "UPDATE visiteur SET nom_visit ='"+nom_visit+"', prenom_visit ='"+prenom_visit+"', tel_visit='"+tel_visit+"',"
                + "email_visit='"+email_visit+"', motdepass_visit='"+motdepass_visit+"', adress_visit='"+adress_visit+"',type_visit='"+type+"',image_visit='"+image_visit+"',pseudo_visit='"+pseudo_visit+"', id_nosMet='"+id_nosMet+"', id_sexe='"+id_sexe+"' WHERE id_visit = '"+id_visit+"' ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.executeUpdate();
        
    } 
        public static void estSupprEmpl (String id,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " DELETE FROM visiteur WHERE visiteur.id_visit = '"+id+"' ";
        sttm.executeUpdate(sql);

    }
    /*------------------------- heritage message ------------ */

    /*--------------------------- HERITAGE MESSAGE --------------*/
    
    /*--- HERITAGE CONTACT VERS VISITEUR ----*/
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
            /*--- HERITAGE CONTACT VERS VISITEUR ----*/

}


