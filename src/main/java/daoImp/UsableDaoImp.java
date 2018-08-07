package daoImp;

import dao.DAO;
import dao.UsableDao;
import dao.UserDao;
import entity.UsableEntity;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by DELL on 2018/1/4.
 *
 * @author MJY
 */
public class UsableDaoImp  extends DAO<UsableEntity> implements UsableDao {
    @Override
    public List<UsableEntity> getUsable() {
        String sql="select * from USABLE";
        return getForList(sql);
    }
    public boolean addUsable(int id_admin,String name,String rang,String solution,String example){
        String sql1 = "insert into usable(NAME,RANG,SOLUTION,EXAMPLE) values(?,?,?,?)";
        String sql2 = "select NAME from administrator where ID_ADMIN = ?";
        String sql3 = "insert into admin_log(ID_ADMIN,CONTENT,DATE) values(?,?,?)";
        update(sql1,name,rang,solution,example);
        String ad_name = String.valueOf(getForValue(sql2,id_admin).toString());
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        String content = "管理员" + ad_name + "于" + createDate +"新增“" + name + "”可用性";
        update(sql3,id_admin,content,createDate);
        return true;
    }

    public boolean modified(int id_admin,int id_usable,String name,String rang,String solution,String example){
        String sql1 = "update usable set NAME = ? , RANG = ? , SOLUTION = ? , EXAMPLE = ? where ID_USABLE = ?";
        String sql2 = "select NAME from administrator where ID_ADMIN = ?";
        String sql3 = "insert into admin_log(ID_ADMIN,CONTENT,DATE) values(?,?,?)";
        update(sql1,name,rang,solution,example,id_usable);
        String ad_name = String.valueOf(getForValue(sql2,id_admin).toString());
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        String content = "管理员" + ad_name + "于" + createDate +"修改第"+ id_usable +"条可用性";
        update(sql3,id_admin,content,createDate);
        return true;
    }
}
