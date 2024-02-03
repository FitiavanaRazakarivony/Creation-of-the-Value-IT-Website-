/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package table;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author BRAYAN
 */
public class demande_refEx {
            
    public static void insertionDemande_refext(String id_eurExt, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO demande_refext values ('" + id_eurExt + "')";
        System.out.println("sql");
        sttm.executeUpdate(sql);
        
    }
        public static ResultSet getDemandeurRefExt( Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "SELECT * FROM demande_refExt\n" +
                "inner join teste on teste.id_teste = demande_refext.id_teste\n" +
                "inner join demandeurexterne on demandeurexterne.id_eurext = teste.id_eurext \n" +
                "inner join demande_deme on demande_deme.id_demex = demandeurexterne.id_demex \n" +
                "inner join annonce on annonce.id_ann = demandeurexterne.id_ann \n" +
                "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
                "inner join sexe on sexe.id_sexe= demandeurexterne.id_sexe;";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
            public static void estSupprDemand_RefExt (String id,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " DELETE FROM demande_refExt WHERE demande_refExt.id_teste = '"+id+"' ";
        sttm.executeUpdate(sql);

    }
    public static ResultSet getDemandeSuppr( Connection Conn) throws Exception {
        Statement s = Conn.createStatement();
        String req = 
                "select count(*) as comptSuppEx from demande_refExt";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
            

}
