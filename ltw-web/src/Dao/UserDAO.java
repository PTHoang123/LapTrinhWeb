import java.sql.*;
import model.User;
import util.DBConnect;


public class UserDAO {
public static User login(String email, String password) {
String sql = "SELECT * FROM users WHERE email=? AND password=?";
try (Connection con = DBConnect.getConnection();
PreparedStatement ps = con.prepareStatement(sql)) {


ps.setString(1, email);
ps.setString(2, password);


ResultSet rs = ps.executeQuery();
if (rs.next()) {
User u = new User();
u.setId(rs.getInt("id"));
u.setEmail(rs.getString("email"));
u.setFullname(rs.getString("fullname"));
u.setRole(rs.getString("role"));
return u;
}
} catch (Exception e) {
e.printStackTrace();
}
return null;
}
}