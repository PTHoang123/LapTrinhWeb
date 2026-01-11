package dao;

import java.sql.*;
import model.User;
import util.DBConnect;


public class UserDAO {

    public static boolean emailExists(String email) {
        String sql = "SELECT 1 FROM user WHERE email = ?";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            return rs.next(); // CHỈ true khi TỒN TẠI
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static User login(String email, String password) {
String sql = "SELECT * FROM user WHERE email=? AND pass=?";
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

public static boolean register(String fullname, String email, String password) {
    String sql = "INSERT INTO user(fullname,email,pass) VALUES(?,?,?)";
    try (Connection con = DBConnect.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, fullname);
        ps.setString(2, email);
        ps.setString(3, password);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace(); // hiển thị lỗi để biết lý do thất bại
        return false;
    }
}

public static boolean updatePassword(String email, String password) {
    String sql = "UPDATE user SET pass=? WHERE email=?";
    try (Connection con = DBConnect.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, password);
        ps.setString(2, email);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        return false;
    }
}
}
