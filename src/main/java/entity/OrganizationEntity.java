package entity;

import java.sql.Date;

public class OrganizationEntity {
    private int ID_ORGANIZATION;
    private String NAME;
    private int ID_USER;
    private Date TIME;
    private Date deadline;

    public int getID_ORGANIZATION() {
        return ID_ORGANIZATION;
    }

    public void setID_ORGANIZATION(int ID_ORGANIZATION) {
        this.ID_ORGANIZATION = ID_ORGANIZATION;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public int getID_USER() {
        return ID_USER;
    }

    public void setID_USER(int ID_USER) {
        this.ID_USER = ID_USER;
    }

    public Date getTIME() {
        return TIME;
    }

    public void setTIME(Date TIME) {
        this.TIME = TIME;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public OrganizationEntity(int ID_ORGANIZATION, String NAME, int ID_USER, Date TIME, Date deadline) {
        this.ID_ORGANIZATION = ID_ORGANIZATION;
        this.NAME = NAME;
        this.ID_USER = ID_USER;
        this.TIME = TIME;
        this.deadline = deadline;
    }

    public OrganizationEntity() {
    }
}
