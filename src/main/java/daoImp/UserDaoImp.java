package daoImp;

import dao.DAO;
import dao.UserDao;
import entity.UserEntity;
import entity.postmailEntity;
import util.MailUtil;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by DELL on 2017/11/28.
 *
 * @author MJY
 */
public class UserDaoImp extends DAO<UserEntity> implements UserDao {
    public boolean login(String name,String password)
    {
        String sql="SELECT COUNT(*) from USER WHERE NAME=? and PASSWORD=?";
//        String sql1 = "SELECT STATUS FROM USER WHERE NAME=? and PASSWORD=?";
//        String sql2 = "UPDATE USER SET STATUS = 1 WHERE NAME=? AND PASSWORD=?";
        int count=Integer.valueOf(getForValue(sql,name,password).toString());
//        int status = Integer.valueOf(getForValue(sql1,name,password).toString());
        if(count==1) {
//            update(sql2,name,password);
            return true;
        }
        else return false;
    }

    public boolean registration(String name, String password1, String password2, String mail) {
            String sql = "insert into USER(NAME,PASSWORD,MAIL) values(?,?,?)";
            try {
                updateThrowException(sql, name, password1,mail);
            }catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
           return true;
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

    public boolean replacePassword(String name, String password2, String password3) {
        if (password2.equals(password3)) {
            String sql = "update USER set password=? where name=?";
            update(sql, password2, name);
            return true;
        } else return false;
    }

    public boolean nameAndMail(String name, String email) {
        String sql = "select count(*) from USER where name=? and MAIL=?";
        int count = Integer.valueOf(getForValue(sql, name, email).toString());
        if (count == 1)
            return true;
        else
            return false;
    }

    public boolean edit(String username, String qq, String address, String tel, String introduce, String gender) {
        String sql = "update USER set qq=?,address=?,tel=?,introduce=?,gender=? where name=?";
        System.out.println(username + qq + address  + tel + introduce + gender);
        update(sql, qq, address, tel, introduce, gender, username);
        return true;
    }

    public UserEntity getOne(String name) {
        String sql = "select * from USER where name=?";
        UserEntity user1 = get(sql, name);
        return user1;
    }
    public UserEntity getOne1(int id) {
        String sql = "select * from USER where ID_USER=?";
        UserEntity user1 = get(sql, id);
        return user1;
    }

    public List<UserEntity> getAll() {
        String sql = "select * from USER ";
        List<UserEntity> user1 = getForList(sql);
        return user1;
    }

    public int Mycollectcount(int id_user){
        String sql="SELECT COUNT(*) from LIB_COLLECT WHERE ID_USER=? ";
        int count=Integer.valueOf(getForValue(sql,id_user).toString());
        return count;
    }

    public int orgManager(int id){
        String sql="select count(*) from ORGANIZATION where ID_USER=?";
        int count = Integer.valueOf(getForValue(sql,id).toString());
        return count;
    }

    public int sysManager(int id){
        String sql="select count(*) from USER_RANK where ID_USER=? and ID_RANK=1";
        int count = Integer.valueOf(getForValue(sql,id).toString());
        return count;
    }

    @Override
    public int projectNumberNow(int id) {
        String sql="select count(*) from VIEW_projectMember where ID_USER=? and STATE=1";
        int count = Integer.valueOf(getForValue(sql,id).toString());
        return count;
    }

    @Override
    public int projectNumberHistory(int id) {
        String sql="select count(*) from VIEW_projectMember where ID_USER=? and STATE=0";
        int count = Integer.valueOf(getForValue(sql,id).toString());
        return count;
    }

    @Override
    public int nowNews(int id) {
        String sql1="select count(*) from VIEW_PROJECT_APPLY where ID_USER=? and STATE=0";
        int count1 = Integer.valueOf(getForValue(sql1,id).toString());
        String sql2="select count(*) from VIEW_ORG_USER_APPLY where ID_USER=? and STATE=0";
        int count2 = Integer.valueOf(getForValue(sql2,id).toString());
        int count=count1+count2;
        return count;
    }

    @Override
    public List<UserEntity> getOrgAllMem(int user_id,String name){
        String sql1 = "select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        int id_org=getForValue(sql1,name);
        System.out.println(id_org);
        String sql2 = "select ID_USER,NAME,MAIL,TEL from USER where ID_USER=any(select ID_USER from ORG_MEMBER where ID_ORGANIZATION=? and ID_USER!=?)";
        List<UserEntity> list=getForList(sql2,id_org,user_id);
        return list;
    }
    @Override
    public String FindName(int id_user){
        String sql = "select NAME from USER where ID_USER=?";
        String name = getForValue(sql,id_user);
        return name;
    }

    @Override
    public List<UserEntity> getAllUser() {
        String sql1="select * from user";
        List<UserEntity> list = getForList(sql1);
        return list;
    }


}
