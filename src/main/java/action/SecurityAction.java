package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.SecurityDao;
import daoImp.SecurityDaoImp;
import entity.AdminEntity;
import entity.SecurityEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SecurityAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<SecurityEntity>, Preparable {
    private Map<String, Object> dataMap;
    private SecurityEntity securityEntity;
    private Map<String,Object> request;
    private Map<String,Object> session;


    public String showAllRules(){
        dataMap = new HashMap<>();
        SecurityDao securityDao = new SecurityDaoImp();
        List<SecurityEntity> allRule = securityDao.getSecurity();
        Gson gson = new Gson();
        String json = gson.toJson(allRule);
        dataMap.put("res",json);
        return "RES";
    }

    public String addSecurity(){
        dataMap = new HashMap<>();
        SecurityDao securityDao = new SecurityDaoImp();
        AdminEntity admin = (AdminEntity)session.get("cur_admin");
        if(securityEntity.getName()!=""&&securityEntity.getRang()!=""&&securityEntity.getSolution()!=""){
            boolean res = securityDao.addSecurity(admin.getId_admin(),securityEntity.getName(),securityEntity.getRang(),securityEntity.getSolution(),securityEntity.getExample());
            dataMap.put("res",res);
            return "RES";
        }
        else  dataMap.put("res",false);
        return "RES";
    }

    public String modified(){
        dataMap = new HashMap<>();
        SecurityDao securityDao = new SecurityDaoImp();
        AdminEntity admin = (AdminEntity)session.get("cur_admin");
        if(securityEntity.getName()!=""&&securityEntity.getRang()!=""&&securityEntity.getSolution()!="") {
            boolean res = securityDao.modified(admin.getId_admin(), securityEntity.getId_security(), securityEntity.getName(), securityEntity.getRang(), securityEntity.getSolution(), securityEntity.getExample());
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

    public SecurityEntity getUsableEntity() {
        return securityEntity;
    }

    public void setUsableEntity(SecurityEntity usableEntity) {
        this.securityEntity = usableEntity;
    }

    @Override
    public SecurityEntity getModel() {
        return securityEntity;
    }

    @Override
    public void prepare() throws Exception {
        securityEntity = new SecurityEntity();
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

