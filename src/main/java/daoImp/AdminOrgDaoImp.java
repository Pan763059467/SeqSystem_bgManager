package daoImp;

import dao.AdminOrgDao;
import dao.DAO;

import entity.AdminOrgEntity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    @Override
    public int days(String org_name) throws ParseException {
        String sql1 = "select ID_ORGANIZATION from ORGANIZATION where name=?";
        String sql2="select deadline from view_admin_org where ID_ORGANIZATION = ? and STATU = 1";
        String sql3="SELECT DATEDIFF(?,?) AS DiffDate";
        String tmp1;
        Date date1;
        int days;
        int id_org = Integer.valueOf(getForValue(sql1,org_name).toString());
        tmp1 = getForValue(sql2,id_org).toString();
        java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
        date1 = formatter.parse(tmp1);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date2 = new Date();
        String tmp2 = sdf.format(date2);
        date2 = formatter.parse(tmp2);
        days = Integer.valueOf(getForValue(sql3,date1,date2).toString());
        return days;
    }
}
