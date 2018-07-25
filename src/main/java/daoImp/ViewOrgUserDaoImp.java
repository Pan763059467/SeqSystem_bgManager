package daoImp;

import dao.DAO;
import dao.ViewOrgUserDao;
import entity.ViewOrgUserEntity;

import java.util.List;

public class ViewOrgUserDaoImp extends DAO<ViewOrgUserEntity> implements ViewOrgUserDao {
    @Override
    public List<ViewOrgUserEntity> getAllOrg() {
        String sql = "select * from view_org_user";
        List<ViewOrgUserEntity> allOrg = getForList(sql);
        return allOrg;
    }
}
