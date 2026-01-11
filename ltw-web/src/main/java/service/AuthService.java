package service;

import dao.AuthDao;
import model.User;

public class AuthService {
    AuthDao ad = new AuthDao();

    public  User checkLogin(String username, String pass) {
        User u = ad.getUserByUsername(username);
        if (u == null) return null;
        if(u.getPass().equals(pass)) {
            u.setPass("");
            return u;
        }
        return null;
    }
}
