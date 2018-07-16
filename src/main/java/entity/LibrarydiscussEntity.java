package entity;

import java.sql.Timestamp;
import java.util.Date;

public class LibrarydiscussEntity {

    private int id_lib_discuss;
    private int id_user;
    private int id_library;
    private String content;
    private Timestamp time;
    private String user_name;
    private String library_name;

    public int getId_lib_discuss() {
        return id_lib_discuss;
    }

    public void setId_lib_discuss(int id_lib_discuss) {
        this.id_lib_discuss = id_lib_discuss;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_library() {
        return id_library;
    }

    public void setId_library(int id_library) {
        this.id_library = id_library;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getLibrary_name() {
        return library_name;
    }

    public void setLibrary_name(String library_name) {
        this.library_name = library_name;
    }

    public LibrarydiscussEntity(int id_lib_discuss, int id_user, int id_library, String content, Timestamp time, String user_name, String library_name) {
        this.id_lib_discuss = id_lib_discuss;
        this.id_user = id_user;
        this.id_library = id_library;
        this.content = content;
        this.time = time;
        this.user_name = user_name;
        this.library_name = library_name;
    }

    public LibrarydiscussEntity() {
    }
}
