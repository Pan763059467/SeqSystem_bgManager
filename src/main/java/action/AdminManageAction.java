package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.AdminDao;
import daoImp.AdminDaoImp;
import entity.AdminEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminManageAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<AdminEntity>, Preparable {
    private AdminDao adminDao;
    private AdminEntity admin;
    private String newPassword;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private Map<String,Object> request;

    public String addManager() {
        System.out.println("start addManager");
        dataMap = new HashMap<String, Object>();
        adminDao = new AdminDaoImp();
        boolean res=adminDao.addManager(admin.getName(),admin.getPassword());
        dataMap.put("res", res);
        if(res==true) {
            session.put("admin",admin);
            System.out.println("put newadmin in session");
        }
        return "success";
    }

    public String showList(){
        dataMap = new HashMap<String, Object>();
        adminDao = new AdminDaoImp();
        List<AdminEntity> list = adminDao.getALL();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        System.out.println(list);
        return SUCCESS;
    }

    public String replacePassword(){
        dataMap = new HashMap<String, Object>();
        adminDao = new AdminDaoImp();
        System.out.println(admin.getName()+" "+newPassword+" adaasdasdaf "+admin.getId_admin()+" "+admin.getName());
        boolean res = adminDao.replacePassword(admin.getName(),newPassword);
        System.out.println(res);
        dataMap.put("res", res);
        return SUCCESS;
    }


    public String jmpAdminManage(){
        return "AdminManage";
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }
    @Override
    public AdminEntity getModel() {
        return admin;
    }

    @Override
    public void prepare() throws Exception {
        admin = new AdminEntity();
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }


    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

}
