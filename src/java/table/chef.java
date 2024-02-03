package table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class chef {
    String imagLead;
    String nom;
    String prenomLead;

    public chef(String imagLead, String nom, String prenomLead) {
        this.imagLead = imagLead;
        this.nom = nom;
        this.prenomLead = prenomLead;
    }

    public String getImagLead() {
        return imagLead;
    }

    public void setImagLead(String imagLead) {
        this.imagLead = imagLead;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenomLead() {
        return prenomLead;
    }

    public void setPrenomLead(String prenomLead) {
        this.prenomLead = prenomLead;
    }

    
    public static void insertionChef(String image, String nom,String prenom,String id , Connection Conn) throws Exception {

        Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO chef values (NULL,'" + image + "','" + nom + "','" + prenom + "','" + id + "')";

        sttm.executeUpdate(sql);

    // insert,update,delete==>executeUpdate de akotrany reo de ExecuteQuery
    }
        
    public static ResultSet getAllChef(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                "select *\n" +
                "from chef\n" +
                "inner join nosmetier on nosmetier.id_nosMet = chef.id_nosMet;";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        public static ResultSet getIdChef(String id ,Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                "select *\n" +
                "from chef\n" +
                "inner join nosmetier on nosmetier.id_nosMet = chef.id_nosMet where id_lead ='"+id+"';";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        //modification chef
        public static void modifChef( int id_lead, String imageLead, String nomLead, String prenomLead,String id_nosMet, Connection Conn) throws Exception {

        String sql = "UPDATE chef SET imageLead ='"+imageLead+"', nomLead ='"+nomLead+"', prenomLead='"+prenomLead+"', id_nosMet='"+id_nosMet+"' WHERE id_lead = '"+id_lead+"' ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.executeUpdate();
        
    }
}
