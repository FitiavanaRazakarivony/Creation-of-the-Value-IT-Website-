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
public class demandeurExt {
    String nom_eurExt;
    String prenom_eurExt;
    String tel_eurExt;
    String email_eurExt;
    String adress_visiteurExt;      

    public demandeurExt(String nom_eurExt, String prenom_eurExt, String tel_eurExt, String email_eurExt, String adress_visiteurExt) {
        this.nom_eurExt = nom_eurExt;
        this.prenom_eurExt = prenom_eurExt;
        this.tel_eurExt = tel_eurExt;
        this.email_eurExt = email_eurExt;
        this.adress_visiteurExt = adress_visiteurExt;
    }

    public String getNom_eurExt() {
        return nom_eurExt;
    }

    public void setNom_eurExt(String nom_eurExt) {
        this.nom_eurExt = nom_eurExt;
    }

    public String getPrenom_eurExt() {
        return prenom_eurExt;
    }

    public void setPrenom_eurExt(String prenom_eurExt) {
        this.prenom_eurExt = prenom_eurExt;
    }

    public String getTel_eurExt() {
        return tel_eurExt;
    }

    public void setTel_eurExt(String tel_eurExt) {
        this.tel_eurExt = tel_eurExt;
    }

    public String getEmail_eurExt() {
        return email_eurExt;
    }

    public void setEmail_eurExt(String email_eurExt) {
        this.email_eurExt = email_eurExt;
    }

    public String getAdress_visiteurExt() {
        return adress_visiteurExt;
    }

    public void setAdress_visiteurExt(String adress_visiteurExt) {
        this.adress_visiteurExt = adress_visiteurExt;
    }
    
    public static void estinsertDemandExt ( String nom,String prenom,String tel,String email,String adress ,String diplome,String id_demEx,String id_ann,String id_sexe,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql =" INSERT INTO demandeurExterne values(NULL,'"+nom+"','"+prenom+"','"+tel+"','"+email+"','"+adress+"','"+diplome+"','"+id_demEx+"','"+id_ann+"','"+id_sexe+"')";
        sttm.executeUpdate(sql);

    }
    public static ResultSet getDemandeurExterne( Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "SELECT * \n" +
                "FROM demandeurExterne \n" +
                "inner join annonce on annonce.id_ann = demandeurExterne.id_ann \n" +
                "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
                "inner join sexe on sexe .id_sexe = demandeurExterne.id_sexe \n" +
                "inner join demande_deme on demande_deme.id_demex = demandeurexterne.id_demex \n" +
                "inner join objet_demandei on objet_demandei.id_objetdemi = demande_deme.id_objetdemi";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    
    public static String getTestById(int id,Connection con)throws Exception{
        String sql = "Select teste from teste where id_eurExt="+id;
        System.out.println(sql);
        Statement stmt = con.createStatement();
        ResultSet res = stmt.executeQuery(sql);
        if(res.next())
        {
           
            return res.getString("teste");
            
        }
        return "";
    }
    
    
        public static ResultSet getDemandeurExterneTeste( Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "SELECT * \n" +
                "FROM demandeurExterne \n" +
                "inner join annonce on annonce.id_ann = demandeurExterne.id_ann \n" +
                "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
                "inner join sexe on sexe .id_sexe = demandeurExterne.id_sexe \n" +
                "inner join demande_deme on demande_deme.id_demex = demandeurexterne.id_demex \n" +
                "inner join objet_demandei on objet_demandei.id_objetdemi = demande_deme.id_objetdemi\n" +
                "inner join teste on teste.id_eurExt = demandeurExterne.id_eurExt;";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    public static ResultSet getCompDemEx( Connection Conn) throws Exception {
        Statement s = Conn.createStatement();
        String req = 
                "select count(*) as compteE from demandeurexterne";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    public static ResultSet getIdDemandeurExterne(String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "SELECT * FROM demandeurExterne \n" +
"inner join teste on teste.id_eurext = demandeurExterne .id_eurext\n" +
"inner join demande_accext on demande_accext.id_teste = teste.id_teste\n" +
"inner join annonce on annonce.id_ann = demandeurExterne.id_ann \n" +
"inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
"inner join sexe on sexe .id_sexe = demandeurExterne.id_sexe \n" +
"inner join demande_deme on demande_deme.id_demex = demandeurexterne.id_demex \n" +
"inner join objet_demandei on objet_demandei.id_objetdemi = demande_deme.id_objetdemi where demandeurExterne.id_eurExt ='"+id+"' ";
                       System.out.println(req);
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
     public static ResultSet getIdDemandeurEx(String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "select * from demandeurExterne\n" +
"inner join demande_deme on demande_deme.id_demex = demandeurexterne.id_demex\n" +
"inner join annonce on annonce.id_ann = demandeurExterne.id_ann \n" +
"inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
"inner join sexe on sexe .id_sexe = demandeurExterne.id_sexe \n" +
"inner join objet_demandei on objet_demandei.id_objetdemi = demande_deme.id_objetdemi where demandeurExterne.id_eurExt  = '"+id+"'";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    public static void estSupprDemandEx (String id,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " DELETE FROM demandeurExterne WHERE demandeurExterne.id_eurExt = '"+id+"' ";
        sttm.executeUpdate(sql);

    }
    public static boolean estAccepter(int idTest,Connection con) throws SQLException
    {
        String sql = "SELECT * FROM demande_accExt WHERE id_teste="+idTest;
        System.out.println(sql+"acc");
        Statement stmt = con.createStatement();
        ResultSet res = stmt.executeQuery(sql);
        if(res.next())
        {
            return true;
        }
        return false;
    }
     public static boolean estRefuser(int idTest,Connection con) throws SQLException
    {
        String sql = "SELECT * FROM demande_refExt WHERE id_teste ="+idTest;
         System.out.println(sql+"ref");
        Statement stmt = con.createStatement();
        ResultSet res = stmt.executeQuery(sql);
        if(res.next())
        {
            return true;
        }
        return false;
    }
}
