/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author BRAYAN
 */
  public class demandeurInt {
    String diplome_eurInt;

    public demandeurInt(String diplome_eurInt) {
        this.diplome_eurInt = diplome_eurInt;
    }

    public String getDiplome_eurInt() {
        return diplome_eurInt;
    }

    public void setDiplome_eurInt(String diplome_eurInt) {
        this.diplome_eurInt = diplome_eurInt;
    }
         
    public static void estinsertDemandInt (String cv,String id_demandeI,String id_ann,String id_visit ,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " INSERT INTO demandeurInterne values(Null,'"+cv+"','"+id_demandeI+"','"+id_ann+"','"+id_visit+"')";
        sttm.executeUpdate(sql);

    }
    public static void estSupprDemandInt (String id,Connection Conn) throws Exception{
      
        java.sql.Statement sttm = Conn.createStatement();
        String sql = " DELETE FROM demandeurInterne WHERE demandeurInterne.id_eurInt = '"+id+"' ";
        sttm.executeUpdate(sql);

    }
    public static ResultSet getCompDemIn( Connection Conn) throws Exception {
        Statement s = Conn.createStatement();
        String req = 
                "select count(*) as compteI from demandeurInterne;";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    public static ResultSet getDemandeurInterne( Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
            "select * \n" +
            "from demandeurinterne \n" +
            "inner join annonce on annonce.id_ann = demandeurinterne.id_ann \n" +
            "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
            "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit \n" +
            "inner join sexe on sexe.id_sexe= visiteur.id_sexe \n" +
            "inner join demande_demi on demande_demi.id_demi = demandeurinterne.id_demi \n" +
            "inner join objet_demandei on objet_demandei.id_objetdemi= demande_demi .id_objetdemi";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
       public static ResultSet getDemandeurInterneTest( Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
            "select * \n" +
            "from demandeurinterne \n" +
            "inner join annonce on annonce.id_ann = demandeurinterne.id_ann \n" +
            "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
            "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit \n" +
            "inner join sexe on sexe.id_sexe= visiteur.id_sexe \n" +
            "inner join demande_demi on demande_demi.id_demi = demandeurinterne.id_demi \n" +
            "inner join objet_demandei on objet_demandei.id_objetdemi= demande_demi .id_objetdemi\n" +
            "inner join testeinter on testeinter.id_eurint = demandeurinterne.id_eurint;" ;
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    public static String getTestById(int id,Connection con)throws Exception{
        String sql = "Select testeInter from testeInter where id_eurInt="+id;
        System.out.println(sql);
        Statement stmt = con.createStatement();
        ResultSet res = stmt.executeQuery(sql);
        if(res.next())
        {
           
            return res.getString("testeInter");
            
        }
        return "";
    }
       
    public static ResultSet getDemandeurInterne1Acc(String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
            "select * from demande_accint\n" +
            "inner join testeinter on testeinter.id_testeinter = demande_accint.id_testeinter \n" +
            "inner join demandeurinterne on demandeurinterne.id_eurint = testeinter.id_eurint\n" +
            "inner join annonce on annonce.id_ann = demandeurinterne.id_ann \n" +
            "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
            "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit \n" +
            "inner join sexe on sexe.id_sexe= visiteur.id_sexe  \n" +
            "inner join demande_demi on demande_demi.id_demi = demandeurinterne.id_demi \n" +
            "inner join objet_demandei on objet_demandei.id_objetdemi= demande_demi .id_objetdemi "
                + " where demande_accint.id_testeInter = '"+id+"' ";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    
    public static void createView(int id,Connection con) throws Exception{
         String req = 
            " CREATE VIEW temp AS select * from demande_accint\n" +
            "inner join testeinter on testeinter.id_testeinter = demande_accint.id_testeinter \n" +
            "inner join demandeurinterne on demandeurinterne.id_eurint = testeinter.id_eurint\n" +
            "inner join annonce on annonce.id_ann = demandeurinterne.id_ann \n" +
            "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
            "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit \n" +
            "inner join sexe on sexe.id_sexe= visiteur.id_sexe  \n" +
            "inner join demande_demi on demande_demi.id_demi = demandeurinterne.id_demi \n" +
            "inner join objet_demandei on objet_demandei.id_objetdemi= demande_demi .id_objetdemi "
                + " where demande_accint.id_testeInter = '"+id+"' ";
          System.out.println(req);
        
        
    
    }
    
   
    
        public static ResultSet getInterne1Acc(Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
            "select * from demande_accint\n" +
            "inner join testeinter on testeinter.id_testeinter = demande_accint.id_testeinter \n" +
            "inner join demandeurinterne on demandeurinterne.id_eurint = testeinter.id_eurint\n" +
            "inner join annonce on annonce.id_ann = demandeurinterne.id_ann \n" +
            "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
            "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit \n" +
            "inner join sexe on sexe.id_sexe= visiteur.id_sexe  \n" +
            "inner join demande_demi on demande_demi.id_demi = demandeurinterne.id_demi \n" +
            "inner join objet_demandei on objet_demandei.id_objetdemi= demande_demi .id_objetdemi ;";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
        
    public static int getVisiteByTeste(int idTest,Connection con) throws Exception{
        String sql = "select v.id_visit from testeInter t join demandeurInterne d on t.id_eurint = d.id_eurInt join visiteur v on d.id_visit=v.id_visit where t.id_testeInter="+idTest;
        Statement stmt = con.createStatement();
        ResultSet res=stmt.executeQuery(sql);
        while(res.next())
        {
            return res.getInt(1);
        }
        return 1;
    }
     public static void update(int id,String pseudo,String pass,String nom,String prenom,String tel,String email,String address,int idMet,Connection con)throws Exception{
    
        String sql = "UPDATE visiteur SET pseudo_visit='"+pseudo+"',"
                + "motdepass_visit='"+pass+"',nom_visit='"+nom+"',prenom_visit='"+prenom+"'"
                + ",adress_visit='"+address+"',email_visit='"+email+"',"
                + "tel_visit='"+tel+"',id_nosMet="+idMet+" WHERE id_visit="+id;
        Statement stmt = con.createStatement();
         System.out.println(sql);
        stmt.executeUpdate(sql);
        
    }
    
    public static ResultSet getChartDemandeurinterne ( Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
                "select * from demandeurinterne \n" +
                "inner join annonce on annonce.id_ann = demandeurinterne.id_ann \n" +
                "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
                "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit \n" +
                "inner join sexe on sexe.id_sexe= visiteur.id_sexe \n" +
                "inner join demande_demi on demande_demi.id_demi = demandeurinterne.id_demi \n" +
                "inner join objet_demandei on objet_demandei.id_objetdemi= demande_demi .id_objetdemi \n" +
                "inner join testeinter on testeinter.id_eurint = demandeurinterne.id_eurint;";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 
    //chart filtrer par mois
    public static ResultSet getFilteredDataByMonth(Connection conn, int month) throws Exception {
        Statement s = conn.createStatement();
        String req = "SELECT MONTH(date_demex) AS month, COUNT(id_demex) AS total " +
                     "FROM demande_deme " +
                     "WHERE MONTH(date_demex) = " + month + " " +
                     "GROUP BY MONTH(date_demex)";
        ResultSet resultSet = s.executeQuery(req);
        return resultSet;
    }
    
    public static ResultSet getIdDemandeurInterne(String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = 
            "select * \n" +
            "from demandeurinterne \n" +
            "inner join annonce on annonce.id_ann = demandeurinterne.id_ann \n" +
            "inner join nosmetier on nosmetier.id_nosmet = annonce.id_nosmet \n" +
            "inner join visiteur on visiteur.id_visit = demandeurinterne.id_visit \n" +
            "inner join sexe on sexe.id_sexe= visiteur.id_sexe \n" +
            "inner join demande_demi on demande_demi.id_demi = demandeurinterne.id_demi \n" +
            "inner join objet_demandei on objet_demandei.id_objetdemi= demande_demi .id_objetdemi\n" +
            "where demandeurinterne.id_eurInt = '"+id+"' ";
        
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    } 

    public static boolean estAccepter(int idTest,Connection con) throws SQLException
    {
        String sql = "SELECT * FROM demande_accint WHERE id_testeInter="+idTest;
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
        String sql = "SELECT * FROM demande_refint WHERE id_testeInter="+idTest;
         System.out.println(sql+"ref");
        Statement stmt = con.createStatement();
        ResultSet res = stmt.executeQuery(sql);
        if(res.next())
        {
            return true;
        }
        return false;
    }
    public static void updateTo(int idTeste,String type,Connection con) throws SQLException
    {
        String sql = "UPDATE testeInter SET testeInter='"+type+"' WHERE id_testeInter="+idTeste;
        Statement stmt = con.createStatement();
        stmt.executeUpdate(sql);
    }
}
