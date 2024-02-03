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
public class Objet_demandeI {
    String objet_demandeI;

    public Objet_demandeI(String objet_demandeI) {
        this.objet_demandeI = objet_demandeI;
    }

    public String getObjet_demandeI() {
        return objet_demandeI;
    }

    public void setObjet_demandeI(String objet_demandeI) {
        this.objet_demandeI = objet_demandeI;
    }
    
    public static void insertionObjet_demandei( String objet_demandeI, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO objet_demandei values (NULL,'" + objet_demandeI + "')";
        sttm.executeUpdate(sql);
        
    }
    public static ResultSet getAllObjet_demandei(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM objet_demandei";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        public static ResultSet getIdObjet_demandei(String id ,Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM objet_demandei where id_objetDemI ='"+id+"' ";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        public static void modifObjet( int id_objetDemI, String objet_demandeI, Connection Conn) throws Exception {

        String sql = "UPDATE objet_demandei SET objet_demandeI ='"+objet_demandeI+"' WHERE id_objetDemI = '"+id_objetDemI+"' ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.executeUpdate();
        
    }
}
