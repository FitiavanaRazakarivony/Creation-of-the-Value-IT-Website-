/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package table;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author BRAYAN
 */
public class demande_accInt {
        
    public static void insertionDemande_accInt(String id_testeInter, String typeDem_accin ,Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO demande_accInt values ('" + id_testeInter + "',NOW(),'" + typeDem_accin + "')";
        sttm.executeUpdate(sql);
        
    }
    public static ResultSet afficher(String pseudo_visit, Connection Conn) throws Exception {
        String sql = "select * \n" +
                "from demande_accInt  \n" +
                "inner join demandeurinterne on demandeurinterne.id_eurInt = demande_accInt  .id_eurInt\n" +
                "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit where pseudo_visit= '" + pseudo_visit + "' limit 1";
        Statement sttm = Conn.createStatement();
        ResultSet res = sttm.executeQuery(sql);
        return res;
    }
    public static boolean checklogindemandeuraccIN(String pseudo, String motdepass, Connection Conn) throws Exception {
        java.sql.Statement sttm = Conn.createStatement();
        String sql = 
            "select * \n" +
            "from demande_accInt \n" +
            "inner join demandeurexterne on demandeurexterne.id_eurext =  demande_accInt.id_eurint WHERE pseudo_accint ='" + pseudo + "' and mdp_accint ='" + motdepass+ "' ";
        ResultSet res = sttm.executeQuery(sql); // executer anle requete io ambony io

        if (res.next() == true) { // eto izy mametraka oe misy ve ilay requette
            return true;
        } else {
            return false;
        }
    }
        public static ResultSet afficherDema_acc(Connection Conn) throws Exception {
            String sql = 
                    "select * \n" +
                    "from demande_accInt ";
            Statement sttm = Conn.createStatement();
            ResultSet res = sttm.executeQuery(sql);
            return res;
    }
    public static void estSupprDemand_accint (String id,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " DELETE FROM demande_accint WHERE demande_accint.id_testeInter = '"+id+"' ";
        sttm.executeUpdate(sql);

    }
    public static boolean checkTypeDemmAccIn(String typeDema_accint, Connection Conn) throws Exception {
        java.sql.Statement sttm = Conn.createStatement();
        String sql = "SELECT * FROM demande_accint WHERE typeDema_accint='" + typeDema_accint + "' ";
        ResultSet res = sttm.executeQuery(sql); // executer anle requete io ambony io

        if (res.next() == true) { // eto izy mametraka oe misy ve ilay requette
            return true;
        } else {
            return false;
        }
    }
    public static ResultSet getDemandeAcc( Connection Conn) throws Exception {
        Statement s = Conn.createStatement();
        String req = 
                "select count(*) as compteDint from demande_accint";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
}
