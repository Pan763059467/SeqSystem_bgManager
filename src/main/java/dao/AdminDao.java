package dao;

import entity.AdminEntity;
import entity.postmailEntity;

import java.util.List;

public interface AdminDao {
        boolean login(String name,String password);
        boolean SPreplacepassword(String name,String password2,String password3);
        boolean changePassword(String name,String password1,String password2,String password3);
        boolean replacePassword(String name,String password);
        boolean nameAndMail(String name, String email);
        boolean postmail(postmailEntity info, String title);
        boolean addManager(String name,String password);

        List<AdminEntity> getALL();
        AdminEntity getOne(String admin_name);
}
