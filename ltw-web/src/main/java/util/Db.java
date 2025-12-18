package util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public final class Db {
  private static final String PROPS = "/db.properties";
  private static volatile boolean driverLoaded = false;

  private Db() {}

  private static void ensureDriverLoaded() {
    if (driverLoaded) return;
    synchronized (Db.class) {
      if (driverLoaded) return;
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        driverLoaded = true;
      } catch (ClassNotFoundException e) {
        throw new RuntimeException("MySQL JDBC driver not found on classpath", e);
      }
    }
  }

  public static Connection getConnection() {
    try (InputStream in = Db.class.getResourceAsStream(PROPS)) {
      if (in == null) throw new IllegalStateException("Missing " + PROPS + " on classpath");
      Properties p = new Properties();
      p.load(in);

      String url = p.getProperty("db.url");
      String user = p.getProperty("db.user");
      String pass = p.getProperty("db.password");

      ensureDriverLoaded();
      return DriverManager.getConnection(url, user, pass);
    } catch (Exception e) {
      throw new RuntimeException("DB connection failed", e);
    }
  }
}