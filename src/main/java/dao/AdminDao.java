package dao;

import entity.AdminEntity;
import entity.postmailEntity;

import java.util.List;

public interface AdminDao {
        boolean login(String name,String password);
        boolean SPreplacepassword(String name,String password2,String password3);
        boolean changePassword(String name,String password1,String password2,String password3);
        boolean replacePassword(int SP_id, String name,String password);
        boolean nameAndMail(String name, String email);
        boolean postmail(postmailEntity info, String title);
        boolean addManager(int SP_id,String name,String password);
        boolean deleteManager(int SP_id,int id_admin);

        List<AdminEntity> getALL();
        AdminEntity getOne(String admin_name);
}
