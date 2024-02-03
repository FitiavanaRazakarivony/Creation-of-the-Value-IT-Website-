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
public class typeContrat {
    String typeContrat;

    public typeContrat(String typeContrat) {
        this.typeContrat = typeContrat;
    }

    public String getTypeContrat() {
        return typeContrat;
    }

    public void setTypeContrat(String typeContrat) {
        this.typeContrat = typeContrat;
    }
       public static void insertionTypeContrat( String typCont , Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO typecontrat values (NULL,'" + typCont + "')";
        sttm.executeUpdate(sql);
        
    }    
    
    public static ResultSet getAllTypeContrat(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM typecontrat";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    
    public static ResultSet getAIdTypeContrat(String id, Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM typecontrat where id_typeContra = '"+id+"' ";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
            //modification type contrat
    public static void modifTypeContrat( int id_typeContra, String type_Contrat, Connection Conn) throws Exception {

    String sql = "UPDATE typecontrat SET type_Contrat ='"+type_Contrat+"' WHERE id_typeContra = '"+id_typeContra+"' ";
    PreparedStatement Stmt = Conn.prepareStatement(sql);
    Stmt.executeUpdate();
        
    }
}
