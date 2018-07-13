package dao;

import entity.AdminOrgEntity;
import java.util.List;

public interface AdminOrgDao {
    List<AdminOrgEntity> getAllMember(String org_name);
}
