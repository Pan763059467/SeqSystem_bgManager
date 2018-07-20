package daoImp;

import dao.DAO;
import dao.PointsRulesDao;
import entity.PointsRulesEntity;

import java.sql.Timestamp;
import java.util.List;

public class PointsRulesDaoImp extends DAO<PointsRulesEntity> implements PointsRulesDao {
    public List<PointsRulesEntity> getAll() {
        String sql = "select * from points_rule ";
        List<PointsRulesEntity> rules = getForList(sql);
        return rules;
    }

    public boolean modified(int points, int id_admin, String name_admin, String content, int id_rule) {
        String sql1="update points_rule set points = ? where ID_RULE= ?";
        String sql2="insert into admin_log(ID_ADMIN,CONTENT,DATE) value(?,?,?)";
        update(sql1,points,id_rule);
        Timestamp NowTime = new Timestamp(new java.util.Date().getTime());
        String content1 = "管理员"+name_admin+"于"+NowTime+"修改规则“"+content+"”的积分为"+points;
        update(sql2,id_admin,content1,NowTime);
        return true;
    }
}
