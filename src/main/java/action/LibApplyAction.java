package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.LibApplyDao;
import daoImp.LibApplyDaoImp;
import entity.AdminEntity;
import entity.LibApplyEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LibApplyAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<LibApplyEntity>, Preparable {
    private LibApplyEntity libapply;
    private LibApplyDao libapplydao;
    private Map<String, Object> session;
    private Map<String, Object> dataMap;

    public String showLibList(){
        dataMap = new HashMap<String, Object>();
        libapplydao = new LibApplyDaoImp();
        List<LibApplyEntity> list = libapplydao.getAllLib();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String showHistory() {
        dataMap = new HashMap<String, Object>();
        libapplydao = new LibApplyDaoImp();
        List<LibApplyEntity> list = libapplydao.getHistory();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        System.out.println(json);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String saveIdLib(){
        session.put("id_library",libapply.getId_library());
        return SUCCESS;
    }

    public String jmpSysManager5Page(){
        return "SysManager5Page";
    }

    public String accept() {
        dataMap = new HashMap<String, Object>();
        libapplydao = new LibApplyDaoImp();
        AdminEntity admin;
        admin = (AdminEntity) session.get("cur_admin");
        boolean res = libapplydao.accept(libapply.getId_library(), libapply.getId_user(), admin.getId_admin(), admin.getName());
        dataMap.put("res", res);
        List<LibApplyEntity> list = libapplydao.getHistory();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res2",json);
        return SUCCESS;
    }

    public String refuse() {
        dataMap = new HashMap<String, Object>();
        libapplydao = new LibApplyDaoImp();
        AdminEntity admin;
        admin = (AdminEntity) session.get("cur_admin");
        boolean res = libapplydao.refuse(libapply.getId_library(), libapply.getId_user(), admin.getId_admin(), admin.getName());
        dataMap.put("res", res);
        List<LibApplyEntity> list = libapplydao.getHistory();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res2",json);
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
//        this.request = request;
    }



    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    @Override
    public void prepare() throws Exception {
        libapply = new LibApplyEntity();
    }

    @Override
    public LibApplyEntity getModel() {
        return libapply;
    }
}
