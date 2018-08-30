package daoImp;

import dao.DAO;
import dao.LibApplyDao;
import entity.LibApplyEntity;

import java.sql.Timestamp;
import java.util.List;

public class LibApplyDaoImp extends DAO<LibApplyEntity> implements LibApplyDao {
    @Override
    public List<LibApplyEntity> getAllLib() {
        String sql = "select * from view_lib_apply where STATUS = 0";
        List <LibApplyEntity> Lib = getForList(sql);
        return Lib;
    }

    @Override
    public List<LibApplyEntity> getHistory() {
        String sql = "select * from view_lib_apply where STATUS != 0";
        List <LibApplyEntity> Lib = getForList(sql);
        return Lib;
    }

    @Override
    public boolean accept(int id_library, int id_user, int id_admin, String admin_name) {
        String sql1 = "update lib_apply set STATUS = 1 where ID_LIBRARY = ?";
        String sql5 = "select NAME from library where ID_LIBRARY = ?";
        String libName = getForValue(sql5, id_library).toString();
        update(sql1, id_library);
        String sql2 = "update library set FLAG = 1 where ID_LIBRARY = ?";
        update(sql2, id_library);
        String sql3 = "insert into message(ID_USER, CONTENT, DATE) values(?, ?, ?)";
        String content = "管理员通过了您发布构件库" + libName + "的请求";
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        update(sql3, id_user, content,date);
        String sql4 = "insert into admin_log(ID_ADMIN, CONTENT, ID_USER, DATE) values(?, ?, ?, ?)";
        String adminContent = "管理员" + admin_name + "于" + date + "通过了发布构件库" + libName + "的请求";
        update(sql4, id_admin, adminContent, id_user, date);
        return true;
    }

    @Override
    public boolean refuse(int id_library, int id_user, int id_admin, String admin_name) {
        String sql1 = "update lib_apply set STATUS = -1 where ID_LIBRARY = ?";
        String sql5 = "select NAME from library where ID_LIBRARY = ?";
        String libName = getForValue(sql5, id_library).toString();
        update(sql1, id_library);
        String sql2 = "update library set FLAG = 0 where ID_LIBRARY = ?";
        update(sql2, id_library);
        String sql3 = "insert into message(ID_USER, CONTENT, DATE) values(?, ?, ?)";
        String content = "管理员拒绝了您发布构件库" + libName + "的请求";
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        update(sql3, id_user, content,date);
        String sql4 = "insert into admin_log(ID_ADMIN, CONTENT, ID_USER, DATE) values(?, ?, ?, ?)";
        String adminContent = "管理员" + admin_name + "于" + date + "拒绝了发布构件库" + libName + "的请求";
        update(sql4, id_admin, adminContent, id_user, date);
        return true;
    }
}
