package dao;

import entity.UsableEntity;

import java.util.List;

/**
 * Created by DELL on 2018/1/4.
 *
 * @author MJY
 */
public interface UsableDao {
    boolean addUsable(int id_admin,String name,String rang,String solution,String example);
    boolean modified(int id_admin,int id_usable,String name,String rang,String solution,String example);
    List<UsableEntity> getUsable();
}
