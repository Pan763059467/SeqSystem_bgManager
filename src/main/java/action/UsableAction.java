package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.UsableDao;
import daoImp.UsableDaoImp;
import entity.AdminEntity;
import entity.PointsRulesEntity;
import entity.UsableEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UsableAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<UsableEntity>, Preparable {
    private Map<String, Object> dataMap;
    private UsableEntity usableEntity;
    private Map<String,Object> request;
    private Map<String,Object> session;


    public String showAllRules(){
        dataMap = new HashMap<>();
        UsableDao usableDao = new UsableDaoImp();
        List<UsableEntity> allRule = usableDao.getUsable();
        Gson gson = new Gson();
        String json = gson.toJson(allRule);
        dataMap.put("res",json);
        return "RES";
    }

    public String addUsable(){
        dataMap = new HashMap<>();
        UsableDao usableDao = new UsableDaoImp();
        AdminEntity admin = (AdminEntity)session.get("cur_admin");
        if(usableEntity.getName()!=""&&usableEntity.getRang()!=""&&usableEntity.getSolution()!=""){
            boolean res = usableDao.addUsable(admin.getId_admin(),usableEntity.getName(),usableEntity.getRang(),usableEntity.getSolution(),usableEntity.getExample());
            dataMap.put("res",res);
            return "RES";
        }
        else  dataMap.put("res",false);
        return "RES";
    }

    public String modified(){
        dataMap = new HashMap<>();
        UsableDao usableDao = new UsableDaoImp();
        AdminEntity admin = (AdminEntity)session.get("cur_admin");
        if(usableEntity.getName()!=""&&usableEntity.getRang()!=""&&usableEntity.getSolution()!="") {
            boolean res = usableDao.modified(admin.getId_admin(), usableEntity.getId_usable(), usableEntity.getName(), usableEntity.getRang(), usableEntity.getSolution(), usableEntity.getExample());
            dataMap.put("res", res);
            return "RES";
        }
        else  dataMap.put("res",false);
        return "RES";
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public UsableEntity getUsableEntity() {
        return usableEntity;
    }

    public void setUsableEntity(UsableEntity usableEntity) {
        this.usableEntity = usableEntity;
    }

    @Override
    public UsableEntity getModel() {
        return usableEntity;
    }

    @Override
    public void prepare() throws Exception {
        usableEntity = new UsableEntity();
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
