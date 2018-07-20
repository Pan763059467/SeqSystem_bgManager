package dao;

import entity.PointsRulesEntity;

import java.util.List;

public interface PointsRulesDao {
    List<PointsRulesEntity> getAll();
    boolean modified(int points,int id_admin,String name_admin,String content,int id_rule);
}
