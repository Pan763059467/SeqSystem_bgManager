package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.PointsRulesDao;
import daoImp.PointsRulesDaoImp;
import entity.AdminEntity;
import entity.PointsRulesEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PointsRulesAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<PointsRulesEntity>, Preparable {
    private Map<String, Object> dataMap;
    private PointsRulesEntity pointsrules;
    private Map<String,Object> session;
    private Map<String,Object> request;

    public String showAllRules(){
            dataMap = new HashMap<>();
            PointsRulesDao pointsRulesDao = new PointsRulesDaoImp();
            List<PointsRulesEntity> allRule = pointsRulesDao.getAll();
            Gson gson = new Gson();
            String json = gson.toJson(allRule);
            dataMap.put("res",json);
            return "RES";
    }

    public String modified(){
        dataMap = new HashMap<>();
        PointsRulesDao pointsrulesdao = new PointsRulesDaoImp();
        AdminEntity admin = (AdminEntity)session.get("cur_admin");
        boolean res = pointsrulesdao.modified(pointsrules.getPoints(),admin.getId_admin(),admin.getName(),pointsrules.getContent(),pointsrules.getId_rule());
        dataMap.put("res",res);
        return SUCCESS;
    }

    @Override
    public PointsRulesEntity getModel() {
            return pointsrules;
    }

    @Override
    public void prepare() throws Exception {
            pointsrules = new PointsRulesEntity();
    }
    public String jmpPointsRules(){
        return "PointRulesPage";
    }
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }
}
