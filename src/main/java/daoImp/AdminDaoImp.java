package daoImp;

import dao.AdminDao;
import dao.DAO;
import entity.AdminEntity;

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
}
