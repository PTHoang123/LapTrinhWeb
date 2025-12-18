package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbSmokeTest {
  public static void main(String[] args) {
    try (Connection c = Db.getConnection();
         Statement st = c.createStatement();
         ResultSet rs = st.executeQuery("SELECT 1")) {

      rs.next();
      System.out.println("DB OK, SELECT 1 = " + rs.getInt(1));
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(1);
    }
  }
}