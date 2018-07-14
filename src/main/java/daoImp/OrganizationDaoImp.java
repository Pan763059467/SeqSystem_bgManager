//        Created by IntelliJ IDEA.
//        User: wwc
//        Date: 22/12/2017
//        Time: 15:55

package daoImp;

import dao.DAO;
import dao.OrganizationDao;
import dao.UserDao;
import entity.ApplyOrganizationEntity;
import entity.OrganizationEntity;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class OrganizationDaoImp extends DAO<OrganizationEntity> implements OrganizationDao {

    @Override
    public List<OrganizationEntity> getMatched(int id_User, String name) {
        name="%"+name+"%";
        String sql = "select * from VIEW_ORGINFO where ID_USER = ? and NAME LIKE ?";
        return getForList(sql,id_User,name);
    }

    @Override
    public List<OrganizationEntity> getMyOrg(int id) {
        String sql = "select NAME from ORGANIZATION where ID_USER=?";
        List<OrganizationEntity> MyOrgList = getForList(sql,id);
        return MyOrgList;
    }

    @Override
    public OrganizationEntity getOne(String name) {
        String sql = "select * from ORGANIZATION where NAME = ? ";
        return get(sql,name);
    }

    @Override
    public List<OrganizationEntity> getAll() {
        String sql = "select * from ORGANIZATION";
        List<OrganizationEntity> list = getForList(sql);
        return list;
    }

    @Override
    public void quit(String NAME) {
        String sql = "delete from VIEW_MYORGANIZATION where NAME = ?";
        update(sql,NAME);
    }

    @Override
    public String findName(int ID_ORGANIZATION) {
        String sql = "select NAME from ORGANIZATION where ID_ORGANIZATION = ?";
        String name = getForValue(sql,ID_ORGANIZATION);
        System.out.println("orgName:"+name);
        return name;
    }
    @Override
    public String findAdminName(int ID_ORGANIZATION) {
        //查询机构管理员ID
        String sql0 = "select ID_USER from ORGANIZATION where ID_ORGANIZATION = ?";
        int AdminID = getForValue(sql0,ID_ORGANIZATION);
        //查询机构管理员名字
        String sql1 = "select NAME from USER where ID_USER = ?";
        String AdminName = getForValue(sql1,AdminID);
        System.out.println("adminname:"+AdminName);
        return AdminName;
    }

    @Override
    public List<OrganizationEntity> getAllOrg() {
        String sql = "select NAME from ORGANIZATION";
        List<OrganizationEntity> MyOrgList = getForList(sql);
        return MyOrgList;
    }

    @Override
    public boolean disbandOrg(String org_name,String admin_name,int id_admin) {
        String sql1 = "select ID_ORGANIZATION from organization where NAME=?";
        String sql2 = "update project set ID_ORGANIZATION=null where ID_ORGANIZATION=?";
        String sql3 = "delete from org_user_apply where ID_ORGANIZATION=?";
        String sql4 = "delete from org_member where ID_ORGANIZATION=?";
        String sql5 = "delete from organization where ID_ORGANIZATION=?";
        String sql6 = "insert into admin_log(ID_ADMIN,CONTENT,DATE) value(?,?,?)";
        Timestamp NowTime = new Timestamp(new java.util.Date().getTime());
        String content = "管理员"+admin_name+"于"+NowTime+"解散机构："+org_name;
        int id_org = Integer.valueOf(getForValue(sql1,org_name).toString());
        update(sql2,id_org);
        update(sql3,id_org);
        update(sql4,id_org);
        update(sql5,id_org);
        update(sql6,id_admin,content,NowTime);
        return true;
    }


    @Override
    public boolean isIn(int id_user,int id_org) {
        String sql = "select count(*) from ORG_MEMBER where ID_USER = ? and ID_ORGANIZATION = ?";
        if (Integer.valueOf(getForValue(sql,id_user,id_org).toString())>0)
            return true;
        else
            return false;
    }
}
