
import java.sql.Connection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author BRAYAN
 */
public class sousTitre {
    String sousTitre;

    public sousTitre(String sousTitre) {
        this.sousTitre = sousTitre;
    }

    public String getSousTitre() {
        return sousTitre;
    }

    public void setSousTitre(String sousTitre) {
        this.sousTitre = sousTitre;
    }
        public static void insertionTitre( String titre , Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO titre_pub values (NULL,'" + titre + "')";
        sttm.executeUpdate(sql);
        
    }    
       
}
