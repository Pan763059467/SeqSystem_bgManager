package dao;

import entity.OrgInviteEntity;
import entity.UserEntity;

import java.util.List;

public interface OrgInviteDao {
    boolean inviteUser(String content, OrgInviteEntity a, UserEntity b);
    boolean reInviteUser(OrgInviteEntity a);
    List<OrgInviteEntity> getlist(String name);
    boolean grantOrg(int current_id, String org_name,String admin_name,int id_admin);
    boolean deleteUser(int id, String org_name);
}
