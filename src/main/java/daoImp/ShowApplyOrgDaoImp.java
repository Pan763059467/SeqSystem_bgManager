package daoImp;

import dao.DAO;
import dao.ShowApplyOrgDao;
import entity.ShowApplyOrganizationEntity;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class ShowApplyOrgDaoImp extends DAO<ShowApplyOrganizationEntity> implements ShowApplyOrgDao {
    @Override
    public List<ShowApplyOrganizationEntity> getALL() {
        String sql="select * from VIEW_showAPPLYORG where STATE=0";
        List<ShowApplyOrganizationEntity> ShowApply = getForList(sql);
        return ShowApply;
    }

    @Override
    public List<ShowApplyOrganizationEntity> getOthers() {
        String sql="select * from VIEW_showAPPLYORG where STATE=1 or STATE=-1";
        List<ShowApplyOrganizationEntity> ShowOthers = getForList(sql);
        return ShowOthers;
    }

    @Override
    public ShowApplyOrganizationEntity getOne(int id) {
        String sql="select * from VIEW_showAPPLYORG where ID_ORG_APPLY=?";
        ShowApplyOrganizationEntity One= get(sql,id);
        return One;
    }

    @Override
    public List<ShowApplyOrganizationEntity> createOrg(ShowApplyOrganizationEntity create,String admin_name,int id_admin) {
        String sql1="update ORG_APPLY set STATE=1 where ID_ORG_APPLY=?";
        String sql2="insert into ORGANIZATION (NAME,ID_USER,TIME) value(?,?,?)";
        String sql3="select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        String sql4="insert into ORG_MEMBER (ID_USER,ID_ORGANIZATION,STATU) value(?,?,?)";
        String sql5="insert into admin_log(ID_ADMIN,CONTENT,DATE) value(?,?,?)";
        Timestamp NowTime = new Timestamp(new java.util.Date().getTime());
        update(sql1,create.getId_org_apply());
        update(sql2,create.getOrg_name(),create.getId_user(),NowTime);
        int id_org=getForValue(sql3,create.getOrg_name());
        int statu = 1;
;       update(sql4,create.getId_user(),id_org,statu);
        String sql="select * from VIEW_showAPPLYORG where STATE=0";
        String content = "管理员"+admin_name+"于"+NowTime+"同意"+create.getName()+"成立机构："+create.getOrg_name();
        List<ShowApplyOrganizationEntity> ShowApply = getForList(sql);
        update(sql5,id_admin,content,NowTime);
        return ShowApply;
    }

    @Override
    public boolean refuseOrg(ShowApplyOrganizationEntity refuse,String admin_name,int id_admin) {
        String sql1="update ORG_APPLY set STATE=-1 where ID_ORG_APPLY=?";
        String sql2="insert into admin_log(ID_ADMIN,CONTENT,DATE) value(?,?,?)";
        update(sql1,refuse.getId_org_apply());
        Timestamp NowTime = new Timestamp(new java.util.Date().getTime());
        String content = "管理员"+admin_name+"于"+NowTime+"拒绝"+refuse.getName()+"成立机构："+refuse.getOrg_name();
        update(sql2,id_admin,content,NowTime);
        return true;
    }
}
