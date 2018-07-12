package entity;

import java.sql.Timestamp;

public class AdminEntity {
    private int id_admin;
    private String name;
    private String password;
    private String mail;

    public int getId_admin() {
        return id_admin;
    }

    public void setId_admin(int id_admin) {
        this.id_admin = id_admin;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public AdminEntity(int id_admin, String name, String password, String mail) {
        this.id_admin = id_admin;
        this.name = name;
        this.password = password;
        this.mail = mail;
    }

    public AdminEntity() {
    }
}
