package model;

public class User {
private int id;
private String email;
private String pass;
private String fullname;
private String role;

    public User(){};

    public User(int id, String email, String pass, String fullname, String role) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.fullname = fullname;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {return pass;}

    public void setPass(String pass) {this.pass = pass;}

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
