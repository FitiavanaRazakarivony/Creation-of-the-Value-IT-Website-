
package table;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class test {
    String test;

    public test(String test) {
        this.test = test;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }
        public static void insertionTest( String teste , String id,Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO teste values (NULL,'" + teste + "','" + id + "')";
        sttm.executeUpdate(sql);
        
    }    
    
    public static ResultSet getAllTest(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = 
                "select * \n" +
                "from teste \n" +
                "inner join demandeurexterne \n" +
                "on demandeurexterne.id_eurext = teste.id_eurext \n" +
                "inner join sexe \n" +
                "on sexe.id_sexe = demandeurexterne.id_sexe;";

        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    public static boolean checkTeste(String teste, Connection Conn) throws Exception {
        java.sql.Statement sttm = Conn.createStatement();
        String sql = "SELECT * FROM teste WHERE teste='" + teste + "' ";
        ResultSet res = sttm.executeQuery(sql); // executer anle requete io ambony io

        if (res.next() == true) { // eto izy mametraka oe misy ve ilay requette
            return true;
        } else {
            return false;
        }
    }
    public static String getTestById(int id,Connection con)throws Exception{
        String sql = "Select teste from teste where id_eurExt="+id;
        System.out.println(sql);
        Statement stmt = con.createStatement();
        ResultSet res = stmt.executeQuery(sql);
        if(res.next())
        {
           
            return res.getString("testeInter");
            
        }
        return "";
    }
        public static void updateTo(int idTeste,String type,Connection con) throws SQLException
    {
        String sql = "UPDATE teste  SET teste ='"+type+"' WHERE id_teste="+idTeste;
        Statement stmt = con.createStatement();
        stmt.executeUpdate(sql);
    }
    public static ResultSet getComptestext( Connection Conn) throws Exception {
        Statement s = Conn.createStatement();
        String req = 
                "select count(*) as compteT from teste";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    public static void estSupprTest (String id,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " DELETE FROM teste WHERE id_teste = '"+id+"' ";
        sttm.executeUpdate(sql);

    }
      
}
