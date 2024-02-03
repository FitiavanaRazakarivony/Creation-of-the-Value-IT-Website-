
package table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class testeInter {
    String testeInter;

    public testeInter(String testeInter) {
        this.testeInter = testeInter;
    }

    public String getTesteInter() {
        return testeInter;
    }

    public void setTesteInter(String testeInter) {
        this.testeInter = testeInter;
    }

    
    public static void insertionTestInt( String teste , String id,Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO testeInter values (NULL,'" + teste + "','" + id + "')";
        sttm.executeUpdate(sql);
        
    }    
    
    public static ResultSet getAllTestInt(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
            "select * \n" +
            "from testeinter \n" +
            "inner join demandeurinterne on demandeurinterne.id_eurint = testeinter.id_eurint \n" +
            "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit \n" +
            "inner join sexe on sexe.id_sexe = visiteur.id_sexe;";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    public static void modifDemIntAccp( int id_testeInter , String testeInter, String id_eurInt , Connection Conn) throws Exception {

        String sql = "UPDATE typecontrat SET testeInter  ='"+testeInter+"', id_eurInt   ='"+id_eurInt+"' WHERE id_testeInter  = '"+id_testeInter+"' ";
        PreparedStatement Stmt = Conn.prepareStatement(sql);
        Stmt.executeUpdate();
        
    }
    public static ResultSet getComptestI( Connection Conn) throws Exception {
        Statement s = Conn.createStatement();
        String req = 
                "select count(*) as compteE from testeinter";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
}
