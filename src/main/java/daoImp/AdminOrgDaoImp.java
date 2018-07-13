package daoImp;

import dao.AdminOrgDao;
import dao.DAO;

import entity.AdminOrgEntity;

import java.util.List;

public class AdminOrgDaoImp extends DAO<AdminOrgEntity> implements AdminOrgDao {
    @Override
    public List<AdminOrgEntity> getAllMember(String org_name) {
        String sql1 = "select ID_ORGANIZATION from ORGANIZATION where name=?";
        int id_org = Integer.valueOf(getForValue(sql1,org_name).toString());
        String sql2="select * from view_admin_org where ID_ORGANIZATION = ?";
        List<AdminOrgEntity> list = getForList(sql2,id_org);
        return list ;
    }
}
