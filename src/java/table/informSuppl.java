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
 * @author BRAYAN
 */
public class informSuppl {
    String salaire;    
    String typeContrat;    
    String horairTrav;   
    String id_nosMet;

    public informSuppl(String salaire, String typeContrat, String horairTrav, String id_nosMet) {
        this.salaire = salaire;
        this.typeContrat = typeContrat;
        this.horairTrav = horairTrav;
        this.id_nosMet = id_nosMet;
    }

    public String getSalaire() {
        return salaire;
    }

    public void setSalaire(String salaire) {
        this.salaire = salaire;
    }

    public String getTypeContrat() {
        return typeContrat;
    }

    public void setTypeContrat(String typeContrat) {
        this.typeContrat = typeContrat;
    }

    public String getHorairTrav() {
        return horairTrav;
    }

    public void setHorairTrav(String horairTrav) {
        this.horairTrav = horairTrav;
    }

    public String getId_nosMet() {
        return id_nosMet;
    }

    public void setId_nosMet(String id_nosMet) {
        this.id_nosMet = id_nosMet;
    }
    

    
    public static void insertionCompetence(String id_nosMet,String salaire,String horairTrav,String id_typeContra, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO informsuppl VALUES ('" + id_nosMet + "','" + salaire + "','" + horairTrav + "','" + id_typeContra + "')";

        sttm.executeUpdate(sql);
        // insert,update,delete==>executeUpdate de akotrany reo de ExecuteQuery
    }
    public static ResultSet getinformsuppl(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                "select * from informsuppl \n" +
                " inner join typecontrat on typecontrat.id_typecontra = informsuppl.id_typecontra\n" +
                " inner join nosmetier on nosmetier.id_nosmet = informsuppl.id_nosmet;";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        public static ResultSet getIdinformsuppl(String id, Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                "select * from informsuppl \n" +
                " inner join typecontrat on typecontrat.id_typecontra = informsuppl.id_typecontra\n" +
                " inner join nosmetier on nosmetier.id_nosmet = informsuppl.id_nosmet where informsuppl.id_nosMet= '"+id+"' ";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        //modification information de la demande
        public static void modifInform( int id_nosMet,String id_nos, String salaire, String horairTrav, String id_typeContra, Connection Conn) throws Exception {

        String sql = "UPDATE informsuppl SET id_nosMet='"+id_nos+"', salaire ='"+salaire+"', horairTrav ='"+horairTrav+"', id_typeContra='"+id_typeContra+"' WHERE id_nosMet = '"+id_nosMet+"' ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.executeUpdate();
        
    }
}
