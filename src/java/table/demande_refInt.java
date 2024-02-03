package table;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class demande_refInt {
            
    public static void insertionDemande_refInt(String id_eurInt, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO demande_refInt values ('" + id_eurInt + "', now())";
        System.out.println("sql");
        sttm.executeUpdate(sql);
        
    }
    public static void estSupprDemand_RefInt (String id,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " DELETE FROM demande_refint WHERE demande_refint.id_testeinter = '"+id+"' ";
        sttm.executeUpdate(sql);

    }
    public static ResultSet getIdDemandeurRefInterne( Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
            " SELECT DISTINCT * \n" +
            "from demande_refInt\n" +
            "inner join testeinter on  testeinter.id_testeinter = demande_refint.id_testeinter\n" +
            "inner join demandeurinterne on demandeurinterne .id_eurint = testeinter .id_eurint \n" +
            "inner join demande_demi on demande_demi.id_demi = demandeurinterne.id_demi\n" +
            "inner join annonce on annonce.id_ann = demandeurinterne.id_ann\n" +
            "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
            "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit \n" +
            "inner join sexe on sexe.id_sexe= visiteur.id_sexe ";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    public static ResultSet getDemandeSuppr( Connection Conn) throws Exception {
        Statement s = Conn.createStatement();
        String req = 
                "select count(*) as comptSuppIn from demande_refint";
                ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
}
