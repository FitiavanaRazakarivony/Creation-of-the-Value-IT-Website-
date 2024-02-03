package table;

import java.sql.Connection;

public class contact {

    String contact_visit;

    public contact(String contact_visit) {
        this.contact_visit = contact_visit;
    }

    public String getContact_visit() {
        return contact_visit;
    }

    public void setContact_visit(String contact_visit) {
        this.contact_visit = contact_visit;
    }
    
    public static void insertionContact(String contact_visit ,String id_visit, Connection Conn) throws Exception {

        java.sql.Statement sttm = Conn.createStatement();
        String sql = "INSERT INTO contact values (NULL, NOW(),'" + contact_visit + "','" + id_visit + "')";
        sttm.executeUpdate(sql);
        
    }  
}
