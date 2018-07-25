package entity;

import java.sql.Date;

public class ViewOrgUserEntity {
    private int ID_ORGANIZATION;
    private String ORG_NAME;
    private int ID_USER;
    private Date TIME;
    private String USER_NAME;
    private String MAIL;

    public int getID_ORGANIZATION() {
        return ID_ORGANIZATION;
    }

    public void setID_ORGANIZATION(int ID_ORGANIZATION) {
        this.ID_ORGANIZATION = ID_ORGANIZATION;
    }

    public String getORG_NAME() {
        return ORG_NAME;
    }

    public void setORG_NAME(String ORG_NAME) {
        this.ORG_NAME = ORG_NAME;
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

    public String getUSER_NAME() {
        return USER_NAME;
    }

    public void setUSER_NAME(String USER_NAME) {
        this.USER_NAME = USER_NAME;
    }

    public String getMAIL() {
        return MAIL;
    }

    public void setMAIL(String MAIL) {
        this.MAIL = MAIL;
    }

    public ViewOrgUserEntity() {
    }

    public ViewOrgUserEntity(int ID_ORGANIZATION, String ORG_NAME, int ID_USER, Date TIME, String USER_NAME, String MAIL) {
        this.ID_ORGANIZATION = ID_ORGANIZATION;
        this.ORG_NAME = ORG_NAME;
        this.ID_USER = ID_USER;
        this.TIME = TIME;
        this.USER_NAME = USER_NAME;
        this.MAIL = MAIL;
    }
}
