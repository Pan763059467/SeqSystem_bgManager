package dao;

import entity.LibApplyEntity;

import java.util.List;

public interface LibApplyDao {
    List<LibApplyEntity> getAllLib();
    List<LibApplyEntity> getHistory();
    boolean accept(int id_library, int id_user, int id_admin, String admin_name);
    boolean refuse(int id_library, int id_user, int id_admin, String admin_name);
}
