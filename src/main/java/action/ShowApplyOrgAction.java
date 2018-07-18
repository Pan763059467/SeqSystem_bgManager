package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.ApplyOrganizationDao;
import dao.ShowApplyOrgDao;
import daoImp.ApplyOrganizationDaoImp;
import daoImp.HistoryInfoDaoImp;
import daoImp.ShowApplyOrgDaoImp;
import entity.AdminEntity;
import entity.ShowApplyOrganizationEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



public class ShowApplyOrgAction extends ActionSupport implements RequestAware,SessionAware,ModelDriven<ShowApplyOrganizationEntity>,Preparable {
    private ShowApplyOrgDao ShowApplyOrgDao;
    private ShowApplyOrganizationEntity ShowApplyOrganization;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;


    public String showList() {
        dataMap = new HashMap<String, Object>();
        ShowApplyOrgDao = new ShowApplyOrgDaoImp();
        List<ShowApplyOrganizationEntity> list = ShowApplyOrgDao.getALL();
        Gson gson = new Gson();
        String json = gson.toJson(list);
//        JsonArray jsonArray = new JsonParser().parse(json).getAsJsonArray();
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String showOthers() {
        dataMap = new HashMap<String, Object>();
        ShowApplyOrgDao = new ShowApplyOrgDaoImp();
        List<ShowApplyOrganizationEntity> list = ShowApplyOrgDao.getOthers();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String agreeOrg(){
        dataMap = new HashMap<String, Object>();
        int id_org_apply=ShowApplyOrganization.getId_org_apply();
        ShowApplyOrgDao = new ShowApplyOrgDaoImp();
        HistoryInfoDaoImp history = new HistoryInfoDaoImp();
        ShowApplyOrganization = ShowApplyOrgDao.getOne(id_org_apply);
        AdminEntity admin = (AdminEntity)session.get("cur_admin");
        List<ShowApplyOrganizationEntity> list=ShowApplyOrgDao.createOrg(ShowApplyOrganization,admin.getName(),admin.getId_admin());
        String content = "机构："+ShowApplyOrganization.getOrg_name()+" 审核已通过,扣除5积分";
        Date dt=new Date();
        history.hasAcceptorGrantORG( ShowApplyOrganization.getId_user(),content, dt,ShowApplyOrganization.getOrg_name());
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        List<ShowApplyOrganizationEntity> otherList = ShowApplyOrgDao.getOthers();
        Gson gson1 = new Gson();
        String json2 = gson1.toJson(otherList);
        dataMap.put("res2",json2);
        return SUCCESS;
    }

    public String refuseOrg(){
        dataMap = new HashMap<String, Object>();
        System.out.println("start refuseOrg");
        int id_org_apply=ShowApplyOrganization.getId_org_apply();
        ShowApplyOrgDao = new ShowApplyOrgDaoImp();
        HistoryInfoDaoImp history = new HistoryInfoDaoImp();
        ShowApplyOrganization = ShowApplyOrgDao.getOne(id_org_apply);
        AdminEntity admin = (AdminEntity)session.get("cur_admin");
        System.out.println(admin);
        ShowApplyOrgDao.refuseOrg(ShowApplyOrganization,admin.getName(),admin.getId_admin());
        List<ShowApplyOrganizationEntity> list=ShowApplyOrgDao.getALL();
        String content = "管理员未通过机构："+ShowApplyOrganization.getOrg_name()+" 的申请";
        Date dt=new Date();
        history.hasRefuseApplyORG( ShowApplyOrganization.getId_user(),content, dt,ShowApplyOrganization.getOrg_name());
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        List<ShowApplyOrganizationEntity> otherList = ShowApplyOrgDao.getOthers();
        Gson gson1 = new Gson();
        String json2 = gson1.toJson(otherList);
        dataMap.put("res2",json2);
        return SUCCESS;
    }
    @Override
    public ShowApplyOrganizationEntity getModel() {
        return ShowApplyOrganization;
    }

    @Override
    public void prepare() throws Exception {
        ShowApplyOrganization = new ShowApplyOrganizationEntity();
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
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
}
