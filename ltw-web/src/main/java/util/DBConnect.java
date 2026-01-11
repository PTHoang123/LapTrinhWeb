package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
public static Connection getConnection() {
try {
Class.forName("com.mysql.cj.jdbc.Driver");

    System.out.println("Connecting to DB: test");

return DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC",
"root",
""
);
} catch (Exception e) {
e.printStackTrace();
}
return null;
}
}
