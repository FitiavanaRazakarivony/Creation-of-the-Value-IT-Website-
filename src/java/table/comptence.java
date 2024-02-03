/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Workdev
 */
public class comptence {
    String compentence;

    public comptence(String compentence) {
        this.compentence = compentence;
    }

    public String getCompentence() {
        return compentence;
    }

    public void setCompentence(String compentence) {
        this.compentence = compentence;
    }
    
   
    public static void insertionCompet(String compentence, String id_nosMet, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO competence values (NULL,'" + compentence + "','" + id_nosMet + "')";

        sttm.executeUpdate(sql);
        // insert,update,delete==>executeUpdate de akotrany reo de ExecuteQuery
    }
    public static ResultSet AllCompetence( Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM competence where id_compet = ";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    
     public static ResultSet AllCompetence_nosMet( Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "select * \n" +
                "from competence \n" +
                "inner join nosmetier on nosmetier.id_nosmet=competence.id_nosmet; ";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
         public static ResultSet IdCompetence_nosMet( String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "select * \n" +
                "from competence \n" +
                "inner join nosmetier on nosmetier.id_nosmet=competence.id_nosmet where competence.id_compet = '"+id+"' ";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        //modification competence
        public static void modifCompet( int id_compet, String competence, String id_nosMet, Connection Conn) throws Exception {

        String sql = "UPDATE competence SET competence ='"+competence+"', id_nosMet ='"+id_nosMet+"' WHERE id_compet = '"+id_compet+"' ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.executeUpdate();
        
    }
}

