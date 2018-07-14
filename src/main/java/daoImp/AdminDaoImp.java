package daoImp;

import dao.AdminDao;
import dao.DAO;
import entity.AdminEntity;
import entity.postmailEntity;
import util.MailUtil;

import java.sql.Timestamp;
import java.util.List;

public class AdminDaoImp extends DAO<AdminEntity> implements AdminDao {
    @Override
    public boolean login(String name, String password) {
        String sql="SELECT COUNT(*) from administrator WHERE NAME=? and PASSWORD=?";
        int count=Integer.valueOf(getForValue(sql,name,password).toString());
        if(count==1) {
            String sql1="SELECT ID_ADMIN FROM administrator where name=?";
            int id_admin = Integer.valueOf(getForValue(sql1,name).toString());
            Timestamp createDate = new Timestamp(new java.util.Date().getTime());
            String content = "管理员" + name + "于" + createDate + "登录管理系统";
            String sql2 = "insert into admin_log(ID_ADMIN,CONTENT,DATE) value(?,?,?)";
            update(sql2,id_admin,content,createDate);
            return true;
        }
        else return false;
    }

    public boolean SPreplacepassword(String name, String password2, String password3) {
        if (password2.equals(password3)) {
            String sql = "update administrator set password=? where name=? and sp=1";
            update(sql, password2, name);
            return true;
        } else return false;
    }

    public boolean changePassword(String name, String password1,String password2, String password3) {
        String sql0="SELECT COUNT(*) from administrator WHERE NAME=? and PASSWORD=? and sp=?";
        int count=Integer.valueOf(getForValue(sql0,name,password1,0).toString());
        if(count == 1){
            if (password2.equals(password3)) {
            String sql = "update administrator set password=? where name=?";
            update(sql, password2, name);
            return true;
            }
            else return false;
        } else return false;
    }

    public boolean replacePassword(String name, String password) {
        String sql0="SELECT COUNT(*) from administrator WHERE NAME=? and sp=0";
        int count=Integer.valueOf(getForValue(sql0,name).toString());
        if(count == 1){
                String sql = "update administrator set password=? where name=?";
                update(sql, password, name);
                //操作
                String sql1="SELECT ID_ADMIN FROM administrator where name=?";
                int id_admin = Integer.valueOf(getForValue(sql1,name).toString());
                Timestamp createDate = new Timestamp(new java.util.Date().getTime());
                String content = "管理员" + name + "于" + createDate + "登录管理系统";
                String sql2 = "insert into admin_log(ID_ADMIN,CONTENT,DATE) value(?,?,?)";
                update(sql2,id_admin,content,createDate);
                return true;
        } else return false;
    }

    public boolean nameAndMail(String name, String email) {
        String sql = "select count(*) from administrator where name=? and MAIL=?";
        int count = Integer.valueOf(getForValue(sql, name, email).toString());
        if (count == 1)
            return true;
        else
            return false;
    }

    public boolean postmail(postmailEntity info, String title){
        if (Integer.parseInt(info.getContent())>=100000 && Integer.parseInt(info.getContent())<=999999){
            try {
                MailUtil.sendTextMail(info);
            } catch (Exception e) {
                System.out.print("'" + title + "'的邮件发送失败！");
                e.printStackTrace();
                return false;
            }
            return true;
        }
        else
            return false;
    }

    public boolean addManager(String name, String password) {
        String sql = "insert into administrator(name,password) values(?,?)";
        System.out.println(name + password);
        update(sql, name, password);
        return true;
    }

    public List<AdminEntity> getALL() {
        String sql="select * from administrator where sp=0";
        List<AdminEntity> ManagerList = getForList(sql);
        return ManagerList;
    }
}
