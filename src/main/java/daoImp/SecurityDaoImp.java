package daoImp;

import dao.DAO;
import dao.SecurityDao;
import entity.SecurityEntity;

import java.sql.Timestamp;
import java.util.List;

public class SecurityDaoImp extends DAO<SecurityEntity> implements SecurityDao {
    @Override
    public List<SecurityEntity> getSecurity() {
        String sql="select * from security";
        return getForList(sql);
    }
    public boolean addSecurity(int id_admin,String name,String rang,String solution,String example){
        String sql1 = "insert into security(NAME,RANG,SOLUTION,EXAMPLE) values(?,?,?,?)";
        String sql2 = "select NAME from administrator where ID_ADMIN = ?";
        String sql3 = "insert into admin_log(ID_ADMIN,CONTENT,DATE) values(?,?,?)";
        if(example==""){example = "暂无";}
        update(sql1,name,rang,solution,example);
        String ad_name = String.valueOf(getForValue(sql2,id_admin).toString());
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        String content = "管理员" + ad_name + "于" + createDate +"新增“" + name + "”安全性";
        update(sql3,id_admin,content,createDate);
        return true;
    }

    public boolean modified(int id_admin,int id_security,String name,String rang,String solution,String example){
        String sql1 = "update security set NAME = ? , RANG = ? , SOLUTION = ? , EXAMPLE = ? where ID_SECURITY = ?";
        String sql2 = "select NAME from administrator where ID_ADMIN = ?";
        String sql3 = "insert into admin_log(ID_ADMIN,CONTENT,DATE) values(?,?,?)";
        if(example==""){example = "暂无";}
        update(sql1,name,rang,solution,example,id_security);
        String ad_name = String.valueOf(getForValue(sql2,id_admin).toString());
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        String content = "管理员" + ad_name + "于" + createDate +"修改第"+ id_security +"条安全性";
        update(sql3,id_admin,content,createDate);
        return true;
    }
}
