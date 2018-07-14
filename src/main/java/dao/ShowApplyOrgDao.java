package dao;

import entity.ShowApplyOrganizationEntity;
import java.util.List;



public interface ShowApplyOrgDao {
    List<ShowApplyOrganizationEntity> getALL();
    List<ShowApplyOrganizationEntity> getOthers();
    ShowApplyOrganizationEntity getOne(int id);
    List<ShowApplyOrganizationEntity> createOrg(ShowApplyOrganizationEntity create,String admin_name,int id_admin);
    boolean refuseOrg(ShowApplyOrganizationEntity refuse,String admin_name,int id_admin);
}
