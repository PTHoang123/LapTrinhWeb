package dao;

import model.User;

public class AuthDao extends BaseDao {

    public User getUserByUsername(String username) {
        return get().withHandle(h ->
                h.createQuery("SELECT * FROM users WHERE username = :u")
                        .bind("u", username)
                        .mapToBean(User.class)
                        .first()
        );
    }
}

