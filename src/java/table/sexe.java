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
 * @author Workdev
 */
public class sexe {
    String sexe;

    public sexe() {
    }

    public sexe(String sexe) {
        this.sexe = sexe;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }
    
    
    public static void insertionSexe( String sexe , Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO sexe values (NULL,'" + sexe + "')";
        sttm.executeUpdate(sql);
        
    }    
    
    public static ResultSet getAllSex(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM sexe";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    
}
