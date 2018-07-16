package entity;

import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by DELL on 2017/12/25.
 *
 * @author MJY
 */
public class ProDiscussEntity {
    private int id_pro_discuss;
    private int id_user;
    private String user_name;
    private String pro_name;
    private String doc_name;
    private int id_catalog;
    private Timestamp time;
    private String content;

    private int id_Project;
    private int id_Document;
    private List<File> MyFile;
    private List<String> MyFileFileName;
    private List<AccessoryEntity> accessoryEntityList;

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public String getDoc_name() {
        return doc_name;
    }

    public void setDoc_name(String doc_name) {
        this.doc_name = doc_name;
    }

    public int getId_pro_discuss() {
        return id_pro_discuss;
    }

    public void setId_pro_discuss(int id_pro_discuss) {
        this.id_pro_discuss = id_pro_discuss;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_catalog() {
        return id_catalog;
    }

    public void setId_catalog(int id_catalog) {
        this.id_catalog = id_catalog;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId_Project() {
        return id_Project;
    }

    public void setId_Project(int id_Project) {
        this.id_Project = id_Project;
    }

    public int getId_Document() {
        return id_Document;
    }

    public void setId_Document(int id_Document) {
        this.id_Document = id_Document;
    }

    public List<File> getMyFile() {
        return MyFile;
    }

    public void setMyFile(List<File> myFile) {
        MyFile = myFile;
    }

    public List<String> getMyFileFileName() {
        return MyFileFileName;
    }

    public void setMyFileFileName(List<String> myFileFileName) {
        MyFileFileName = myFileFileName;
    }

    public List<AccessoryEntity> getAccessoryEntityList() {
        return accessoryEntityList;
    }

    public void setAccessoryEntityList(List<AccessoryEntity> accessoryEntityList) {
        this.accessoryEntityList = accessoryEntityList;
    }

    public ProDiscussEntity(int id_pro_discuss, int id_user, String user_name, String pro_name, String doc_name, int id_catalog, Timestamp time, String content, int id_Project, int id_Document, List<File> myFile, List<String> myFileFileName, List<AccessoryEntity> accessoryEntityList) {
        this.id_pro_discuss = id_pro_discuss;
        this.id_user = id_user;
        this.user_name = user_name;
        this.pro_name = pro_name;
        this.doc_name = doc_name;
        this.id_catalog = id_catalog;
        this.time = time;
        this.content = content;
        this.id_Project = id_Project;
        this.id_Document = id_Document;
        MyFile = myFile;
        MyFileFileName = myFileFileName;
        this.accessoryEntityList = accessoryEntityList;
    }

    public ProDiscussEntity() {
    }

    @Override
    public String toString() {
        return "ProDiscussEntity{" +
                "id_pro_discuss=" + id_pro_discuss +
                ", id_user=" + id_user +
                ", user_name='" + user_name + '\'' +
                ", pro_name='" + pro_name + '\'' +
                ", doc_name='" + doc_name + '\'' +
                ", id_catalog=" + id_catalog +
                ", time=" + time +
                ", content='" + content + '\'' +
                ", id_Project=" + id_Project +
                ", id_Document=" + id_Document +
                ", MyFile=" + MyFile +
                ", MyFileFileName=" + MyFileFileName +
                '}';
    }
}
