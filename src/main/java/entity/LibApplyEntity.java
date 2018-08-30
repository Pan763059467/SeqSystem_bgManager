package entity;

import java.sql.Timestamp;

public class LibApplyEntity {
    private int id_library;
    private Timestamp date;
    private String content;
    private int status;
    private String lib_name;
    private int id_user;
    private String mention;
    private String title;
    private String user_name;

    public LibApplyEntity(int id_library, Timestamp date, String content, int status, String lib_name, int id_user, String mention, String title, String user_name) {
        this.id_library = id_library;
        this.date = date;
        this.content = content;
        this.status = status;
        this.lib_name = lib_name;
        this.id_user = id_user;
        this.mention = mention;
        this.title = title;
        this.user_name = user_name;
    }

    public LibApplyEntity() {
    }

    public int getId_library() {
        return id_library;
    }

    public void setId_library(int id_library) {
        this.id_library = id_library;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getLib_name() {
        return lib_name;
    }

    public void setLib_name(String lib_name) {
        this.lib_name = lib_name;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getMention() {
        return mention;
    }

    public void setMention(String mention) {
        this.mention = mention;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
}
