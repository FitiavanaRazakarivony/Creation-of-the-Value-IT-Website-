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
public class demande_accExt {
        
    public static void insertionDemande_accEx(String id,String pseudo,String mdp_accex,String accepter, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO demande_accExt values ('" + id+ "','" + pseudo + "','" + mdp_accex + "','" + accepter + "',NOW())";
        System.out.println("sql");
        sttm.executeUpdate(sql);
        
    }
    public static ResultSet afficher(String pseudo_accext, Connection Conn) throws Exception {
        String sql = "SELECT * FROM demande_accExt where pseudo_accext= '" + pseudo_accext + "' limit 1";
        Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }
    public static boolean checklogindemandeuraccEX(String pseudo, String motdepass_admin, Connection Conn) throws Exception {
        java.sql.Statement sttm = Conn.createStatement();
        String sql = 
            "select * \n" +
"from demandeurexterne \n" +
"inner join teste on teste .id_eurext = demandeurexterne.id_eurext \n" +
"inner join demande_accext on demande_accext .id_teste = teste.id_teste WHERE demande_accext.pseudo_accext ='" + pseudo + "' and demande_accext.mdp_accext ='" + motdepass_admin+ "' ";
        ResultSet res = sttm.executeQuery(sql); // executer anle requete io ambony io

        if (res.next() == true) { // eto izy mametraka oe misy ve ilay requette
            return true;
        } else {
            return false;
        }
    }
    public static ResultSet afficherDeman_accEx(Connection Conn) throws Exception {
        String sql = 
                "select * \n" +
                "from demandeurexterne \n" +
                "inner join teste on teste.id_eurext = demandeurexterne.id_eurext \n" +
                "inner join demande_accext on demande_accext.id_teste = teste.id_teste \n" +
                "inner join annonce on annonce.id_ann = demandeurexterne.id_ann\n" +
                "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
                "inner join sexe on sexe.id_sexe =demandeurexterne.id_sexe;";
        Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }
    public static void estSupprDemand_accExt (String id,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " DELETE FROM demande_accext WHERE demande_accext.id_teste = '"+id+"' ";
        sttm.executeUpdate(sql);

    }
        public static void updateTo(int idTeste,String psd,String mdp,Connection con) throws SQLException
    
    {
        String sql = "UPDATE demande_accext SET pseudo_accext ='"+psd+"', mdp_accext ='"+mdp+"' WHERE id_teste="+idTeste;
        Statement stmt = con.createStatement();
        stmt.executeUpdate(sql);
    }
    public static ResultSet getDemandeAcc( Connection Conn) throws Exception {
        Statement s = Conn.createStatement();
        String req = 
                "select count(*) as compteDext from demande_accext";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
}
