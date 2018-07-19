package daoImp;

import dao.DAO;
import dao.PointsRulesDao;
import entity.PointsRulesEntity;

import java.util.List;

public class PointsRulesDaoImp extends DAO<PointsRulesEntity> implements PointsRulesDao {
    public List<PointsRulesEntity> getAll() {
        String sql = "select * from points_rule ";
        List<PointsRulesEntity> rules = getForList(sql);
        return rules;
    }
}
