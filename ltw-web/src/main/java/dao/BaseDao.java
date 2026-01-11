package dao;

import org.jdbi.v3.core.Jdbi;

public class BaseDao {

    private static Jdbi jdbi;

    static {
        jdbi = Jdbi.create(
                "jdbc:mysql://localhost:3306/userdb?useSSL=false&serverTimezone=UTC",
                "root",
                ""
        );
    }

    protected Jdbi get() {
        return jdbi;
    }
}
