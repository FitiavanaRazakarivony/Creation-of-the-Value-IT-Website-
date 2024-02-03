package table;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class publication {
    
    String date_pub;   
    String info_pub;
    String titre_pub;
    String image ;

    public publication(String date_pub, String info_pub, String titre_pub, String image) {
        this.date_pub = date_pub;
        this.info_pub = info_pub;
        this.titre_pub = titre_pub;
        this.image = image;
    }

    public String getDate_pub() {
        return date_pub;
    }

    public void setDate_pub(String date_pub) {
        this.date_pub = date_pub;
    }

    public String getInfo_pub() {
        return info_pub;
    }

    public void setInfo_pub(String info_pub) {
        this.info_pub = info_pub;
    }

    public String getTitre_pub() {
        return titre_pub;
    }

    public void setTitre_pub(String titre_pub) {
        this.titre_pub = titre_pub;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

   
    public static void insertionPu(String date_pub,String info_pub,String id_titreP, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO publication values (NULL,'" + date_pub + "','" + info_pub + "','" + id_titreP +"')";

        sttm.executeUpdate(sql);
        // insert,update,delete==>executeUpdate de akotrany reo de ExecuteQuery
        System.out.println("1111111");
    }
    
    public static ResultSet getAllPub(Connection bdd) throws Exception {
        
        Statement s = bdd.createStatement();
        String req = "SELECT *\n" +
                    "FROM publication\n" +
                    "inner join titre_pub on titre_pub.id_tittrepub = publication.id_tittrepub\n" +
                    "inner join soustitre_pub on soustitre_pub.id_sousTitre = titre_pub.id_sousTitre";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
        public static ResultSet getPub(Connection Conn) throws Exception {
        
        Statement s = Conn.createStatement();
        String req = " SELECT * FROM publication";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
        }

        public static ResultSet getIdPub(String id, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM publication WHERE id_tittrePub='" + id + "' ";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }
    
  /*  public static ResultSet getImagePub(String image, Connection bdd) throws Exception {
        Statement s = bdd.createStatement();
        String req = "SELECT * FROM publication WHERE image='" + image + "' ";
        ResultSet reslSt = s.executeQuery(req);
        return reslSt;
    }*/

   
}
