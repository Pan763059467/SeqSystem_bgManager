package dao;

import entity.SecurityEntity;
import java.util.List;

public interface SecurityDao {
    boolean addSecurity(int id_admin,String name,String rang,String solution,String example);
    boolean modified(int id_admin,int id_security,String name,String rang,String solution,String example);
    List<SecurityEntity> getSecurity();
}
