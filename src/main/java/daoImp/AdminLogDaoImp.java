package daoImp;

import dao.AdminLogDao;
import dao.DAO;
import entity.AdminLogEntity;

import java.util.List;

public class AdminLogDaoImp extends DAO<AdminLogEntity> implements AdminLogDao {
    @Override
    public List<AdminLogEntity> getALL() {
        String sql="select * from view_admin_log";
        List<AdminLogEntity> LogList = getForList(sql);
        return LogList;
    }
}
