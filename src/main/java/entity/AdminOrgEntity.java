package entity;

public class AdminOrgEntity {
    private int id_org_member;
    private int id_user;
    private int id_organization;
    private char statu;
    private String name;
    private String mail;

    public int getId_org_member() {
        return id_org_member;
    }

    public void setId_org_member(int id_org_member) {
        this.id_org_member = id_org_member;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_organization() {
        return id_organization;
    }

    public void setId_organization(int id_organization) {
        this.id_organization = id_organization;
    }

    public char getStatu() {
        return statu;
    }

    public void setStatu(char statu) {
        this.statu = statu;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public AdminOrgEntity() {
    }

    public AdminOrgEntity(int id_org_member, int id_user, int id_organization, char statu, String name, String mail) {
        this.id_org_member = id_org_member;
        this.id_user = id_user;
        this.id_organization = id_organization;
        this.statu = statu;
        this.name = name;
        this.mail = mail;
    }
}
