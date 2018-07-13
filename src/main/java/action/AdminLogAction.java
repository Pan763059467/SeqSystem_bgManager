package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.AdminLogDao;
import daoImp.AdminLogDaoImp;
import daoImp.ShowApplyOrgDaoImp;

import entity.AdminLogEntity;
import entity.ShowApplyOrganizationEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminLogAction extends ActionSupport implements RequestAware,SessionAware,ModelDriven<AdminLogEntity>,Preparable {
    private AdminLogDao AdminLogDao;
    private AdminLogEntity AdminLog;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;

    public String logList(){
        dataMap = new HashMap<String, Object>();
        AdminLogDao = new AdminLogDaoImp();
        List<AdminLogEntity> list = AdminLogDao.getALL();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        System.out.println(list);
        return SUCCESS;
    }
    @Override
    public AdminLogEntity getModel() {
        return AdminLog;
    }

    @Override
    public void prepare() throws Exception {
        AdminLog = new AdminLogEntity();
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.request = request;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = session;
    }
    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }
}
