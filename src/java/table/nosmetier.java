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

public class nosmetier {
    
    String id_nosMet;
    String nom_nosMet;   
    String desc_nosMet;

    public nosmetier(String id_nosMet, String nom_nosMet, String desc_nosMet) {
        this.id_nosMet = id_nosMet;
        this.nom_nosMet = nom_nosMet;
        this.desc_nosMet = desc_nosMet;
    }

    public String getId_nosMet() {
        return id_nosMet;
    }

    public void setId_nosMet(String id_nosMet) {
        this.id_nosMet = id_nosMet;
    }

    public String getNom_nosMet() {
        return nom_nosMet;
    }

    public void setNom_nosMet(String nom_nosMet) {
        this.nom_nosMet = nom_nosMet;
    }

    public String getDesc_nosMet() {
        return desc_nosMet;
    }

    public void setDesc_nosMet(String desc_nosMet) {
        this.desc_nosMet = desc_nosMet;
    }

    public static void insertion_Job(String nom_nosMet, String desc_nosMet, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO nosmetier values (NULL,'" + nom_nosMet + "','" + desc_nosMet + "')";

        sttm.executeUpdate(sql);
    }

    public static ResultSet getnosMetier(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM nosmetier";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }

    public static ResultSet getIdMetier (String id_nosMet, Connection Conn) throws Exception {
        String sql = "SELECT * FROM nosmetier where id_nosMet= '" + id_nosMet + "' ";
        java.sql.Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }
    
    public static void modifnosmeti( int id_nosMet, String nom, String desc, Connection Conn) throws Exception {

        String sql = "UPDATE nosmetier SET nom_nosMet = '"+nom+"' , description_nosMet='"+desc+"' where id_nosMet = '"+id_nosMet+"' ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.executeUpdate();
        
    } 

    
}
