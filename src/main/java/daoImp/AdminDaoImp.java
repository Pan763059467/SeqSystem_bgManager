package daoImp;

import dao.AdminDao;
import dao.DAO;
import entity.AdminEntity;
import entity.postmailEntity;
import util.MailUtil;

public class AdminDaoImp extends DAO<AdminEntity> implements AdminDao {
    @Override
    public boolean login(String name, String password) {
        String sql="SELECT COUNT(*) from administrator WHERE NAME=? and PASSWORD=?";
        int count=Integer.valueOf(getForValue(sql,name,password).toString());
        if(count==1) {
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

    public boolean replacepassword(String name, String password1,String password2, String password3) {
        String sql0="SELECT COUNT(*) from administrator WHERE NAME=? and PASSWORD=?";
        int count=Integer.valueOf(getForValue(sql0,name,password1).toString());
        if(count == 1){
            if (password2.equals(password3)) {
            String sql = "update administrator set password=? where name=? and sp=0";
            update(sql, password2, name);
            return true;
            }
            else return false;
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
}
