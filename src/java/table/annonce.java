
package table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Workdev
 */
public class annonce {
    String annonce;

    public annonce(String annonce) {
        this.annonce = annonce;
    }

    public String getAnnonce() {
        return annonce;
    }

    public void setAnnonce(String annonce) {
        this.annonce = annonce;
    }
   

      public static void insertionAnnonce(String annonce, String typeAnnonce, String id_nosMet,Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO annonce values (NULL,'" + annonce + "','" + typeAnnonce + "','" + id_nosMet + "')";

        sttm.executeUpdate(sql);

        // insert,update,delete==>executeUpdate de akotrany reo de ExecuteQuery
    }
    
    public static ResultSet getAllAnnonce(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM annonce";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    public static ResultSet getAnnEtNosMetId(String id,Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                " SELECT * FROM annonce inner join nosmetier on nosmetier.id_nosMet = annonce.id_nosMet where id_ann = '"+id+"' ";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;

    }
    public static ResultSet getAnnEtNosMet(Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "SELECT * FROM annonce "
                + "inner join nosmetier "
                + "on annonce.id_nosMet=nosmetier.id_nosMet where annonce.typeann = 'Employé'";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        public static ResultSet getAllAnnEtNosMet(Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "SELECT * FROM annonce "
                + "inner join nosmetier "
                + "on nosmetier.id_nosMet=annonce.id_nosMet";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    public static ResultSet getAnnEtNosMetIntern(Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "SELECT * FROM annonce "
                + " inner join nosmetier "
                + "on annonce.id_nosMet=nosmetier.id_nosMet where annonce.typeann = 'Visiteur';";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    
    public static ResultSet getIdAnn(String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM annonce WHERE id_ann='" + id + "' ";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    
    public static ResultSet getIdnosMetAnn(String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
            "select *\n" +
            " from annonce \n" +
            "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet WHERE annonce.id_ann = '"+id+"' ";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    
    public static ResultSet getIdAnn_compet(String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = "select * "
                + "from annonce "
                + "inner join competence on competence.id_nosmet = annonce.id_nosmet where annonce.id_ann = '"+id+"' ";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 

         public static ResultSet getIdAn_TypeCont(String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "select *\n" +
                "from informsuppl \n" +
                "inner join nosmetier on nosmetier .id_nosmet = informsuppl .id_nosmet \n" +
                "inner join annonce on annonce .id_nosmet = informsuppl .id_nosmet \n" +
                "inner join typecontrat on typecontrat .id_typecontra = informsuppl .id_typecontra where annonce.id_ann = '"+id+"' ";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
   
       //  modification annonce
        public static void modifAnnonce( int id_ann, String annonce, String typeAnn, String id_nosMet, Connection Conn) throws Exception {

        String sql = "UPDATE annonce SET annonce ='"+annonce+"', typeAnn ='"+typeAnn+"', id_nosMet='"+id_nosMet+"' WHERE id_ann = '"+id_ann+"' ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.executeUpdate();
        
    }
}
