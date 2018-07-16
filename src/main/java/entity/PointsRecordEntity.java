package entity;

import java.util.Date;

public class PointsRecordEntity {
    private int id_record;
    private int id_user;
    private String content;
    private Date data;
    private String name;

    public int getId_record() {
        return id_record;
    }

    public void setId_record(int id_record) {
        this.id_record = id_record;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public PointsRecordEntity() {
    }

    public PointsRecordEntity(int id_record, int id_user, String content, Date data, String name) {
        this.id_record = id_record;
        this.id_user = id_user;
        this.content = content;
        this.data = data;
        this.name = name;
    }
}
