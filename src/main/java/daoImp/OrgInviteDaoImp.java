package daoImp;

import dao.DAO;
import dao.OrgInviteDao;
import entity.OrgInviteEntity;
import entity.UserEntity;

import java.sql.Timestamp;
import java.util.List;

public class OrgInviteDaoImp extends DAO<OrgInviteEntity> implements OrgInviteDao {
    @Override
    public boolean inviteUser(String content,OrgInviteEntity a,UserEntity b) {
        String sql1 = "select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        int id_org = getForValue(sql1,a.getORG_NAME());
        String sql2 = "select ID_USER from USER where NAME = ? and ID_USER not in (select ID_USER from ORG_MEMBER where ID_ORGANIZATION=?)";
        int id_user = getForValue(sql2,a.getUSER_NAME(),id_org);
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String sql3 = "insert into ORG_USER_APPLY (ID_ORGANIZATION,ID_USER,DATE,MESSAGE) value(?,?,?,?)";
        try {
            update(sql3,id_org,id_user,date,content);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean reInviteUser(OrgInviteEntity a) {
        String sql1 = "select ID_USER from USER where NAME = ?";
        int id_user = getForValue(sql1,a.getUSER_NAME());
        String sql2 = "select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        int id_org = getForValue(sql2,a.getORG_NAME());
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String sql3 = "update ORG_USER_APPLY set STATE = 0,DATE=? where ID_USER=? and ID_ORGANIZATION=? and STATE=-1";
        update(sql3,date,id_user,id_org);
        return true;
    }

    @Override
    public List<OrgInviteEntity> getlist(String name) {
        String sql1="select * from VIEW_showORGINVITE where ORG_NAME=?";
        List<OrgInviteEntity> list=getForList(sql1,name);
        return list;
    }

    @Override
    public boolean grantOrg( int current_id , String org_name ,String admin_name,int id_admin) {
        String sql1="update ORGANIZATION set ID_USER=? where NAME=? and ID_USER=?";
        String sql2="update org_member set STATU=0 where ID_USER=? and ID_ORGANIZATION=?";
        String sql3="update org_member set STATU=1 where ID_USER=? and ID_ORGANIZATION=?";
        String sql4="select NAME from user where ID_USER=?";
        String sql5="select ID_USER from ORGANIZATION where NAME=?";
        String sql6="insert into MESSAGE (ID_USER,CONTENT,DATE,ID_ORG) values(?,?,?,?)";
        String sql7="select ID_ORGANIZATION from organization where NAME=?";
        String sql8="insert into admin_log(ID_ADMIN,CONTENT,DATE) value(?,?,?)";
        int advance_id = Integer.valueOf(getForValue(sql5,org_name).toString());
        int org_id = Integer.valueOf(getForValue(sql7,org_name).toString());
        update(sql1,current_id,org_name,advance_id);
        update(sql2,advance_id,org_id);
        update(sql3,current_id,org_id);
        String user_name=getForValue(sql4,current_id);
        Timestamp NowTime = new Timestamp(new java.util.Date().getTime());
        String content1 = "管理员"+admin_name+"于"+NowTime+"任命："+user_name+"为机构"+org_name + "的管理员";
        String content2 = "您已被管理员撤销在机构："+org_name+" 的管理员职务";
        String content3 = "您已被管理员指定为机构："+org_name+" 的管理员";
        update(sql8,id_admin,content1,NowTime);
        update(sql6,advance_id,content2,NowTime,org_id);
        update(sql6,current_id,content3,NowTime,org_id);
        return true;
    }

    @Override
    public boolean deleteUser(int user_id, String org_name) {
        String sql1="select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        int org_id = getForValue(sql1,org_name);
        String sql2="delete from ORG_MEMBER where ID_USER=? and ID_ORGANIZATION=?";
        update(sql2,user_id,org_id);
        return true;
    }
}
