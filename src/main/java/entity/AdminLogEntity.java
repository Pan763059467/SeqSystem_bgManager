package entity;

import java.sql.Timestamp;

public class AdminLogEntity {
    private int id_log;
    private int id_admin;
    private String content;
    private int id_user;
    private Timestamp date;
    private int id_admin_p;
    private String admin_name;

    public int getId_log() {
        return id_log;
    }

    public void setId_log(int id_log) {
        this.id_log = id_log;
    }

    public int getId_admin() {
        return id_admin;
    }

    public void setId_admin(int id_admin) {
        this.id_admin = id_admin;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getId_admin_p() {
        return id_admin_p;
    }

    public void setId_admin_p(int id_admin_p) {
        this.id_admin_p = id_admin_p;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public AdminLogEntity() {
    }

    public AdminLogEntity(int id_log, int id_admin, String content, int id_user, Timestamp date, int id_admin_p, String admin_name) {
        this.id_log = id_log;
        this.id_admin = id_admin;
        this.content = content;
        this.id_user = id_user;
        this.date = date;
        this.id_admin_p = id_admin_p;
        this.admin_name = admin_name;
    }
}
