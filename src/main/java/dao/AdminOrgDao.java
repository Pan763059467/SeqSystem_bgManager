package dao;

import entity.AdminOrgEntity;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

public interface AdminOrgDao {
    List<AdminOrgEntity> getAllMember(String org_name);
    int days(String org_name) throws ParseException;
}
