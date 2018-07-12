package dao;

import entity.postmailEntity;

public interface AdminDao {
        boolean login(String name,String password);
        boolean replacepassword(String name,String password2,String password3);
        boolean nameAndMail(String name, String email);
        boolean postmail(postmailEntity info, String title);
}
