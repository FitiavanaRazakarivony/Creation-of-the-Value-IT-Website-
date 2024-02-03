package table;
import java.sql.*;


public class connexion {
    private static Connection con;
    private static String url = "jdbc:mysql://localhost:3306/etudiant";
    private static String user = "root";
    private static String password = "";

    public static Connection connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Connection established");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
