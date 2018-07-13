//        Created by IntelliJ IDEA.
//        User: wwc
//        Date: 22/12/2017
//        Time: 15:55

package action;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.AdminOrgDao;
import dao.OrganizationDao;
import dao.ShowOrgProjectDao;
import dao.UserDao;
import daoImp.AdminOrgDaoImp;
import daoImp.OrganizationDaoImp;
import daoImp.ShowOrgProjectDaoImp;
import daoImp.UserDaoImp;
import entity.AdminOrgEntity;
import entity.OrganizationEntity;
import entity.ShowOrgProjectEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrganizationAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<OrganizationEntity>, Preparable {
    private OrganizationDao organizationdao;
    private OrganizationEntity organization;
    private Map<String, Object> session;
    private Map<String, Object> request;
    private Map<String, Object> dataMap;

    public String quitorg(){
        organizationdao = new OrganizationDaoImp();
        UserEntity user = (UserEntity) session.get("user");
        System.out.println(user.getName());
        organizationdao.quit(user.getName());
        return "quitorg";
    }

    public String jmpOrgManager1(){
        dataMap = new HashMap<String, Object>();
        organizationdao = new OrganizationDaoImp();
        List<OrganizationEntity> list = organizationdao.getAllOrg();
        ActionContext.getContext().getValueStack().set("list",list);
        System.out.println(list+"OrgAction");
        return "OrgManager1Page";
}

    public String jmpSysManager2(){
        dataMap = new HashMap<String, Object>();
        organizationdao = new OrganizationDaoImp();
        List<OrganizationEntity> list = organizationdao.getAllOrg();
        ActionContext.getContext().getValueStack().set("list",list);
        System.out.println(list+"OrgAction");
        return "SysManager2Page";
    }

    public String showAllMember(){
        dataMap = new HashMap<String, Object>();
        UserDao userdao = new UserDaoImp();
        UserEntity seesionUser=(UserEntity)session.get("user");
        List<UserEntity> orgMember = userdao.getOrgAllMem(seesionUser.getId_user(),organization.getNAME());
        Gson gson = new Gson();
        String json = gson.toJson(orgMember);
        System.out.println("OrgAllMember"+json);
        dataMap.put("res",json);
        return "display";
    }

    public String showAdminOrg(){
        dataMap = new HashMap<String, Object>();
        AdminOrgDao adminOrgDao = new AdminOrgDaoImp();
        List<AdminOrgEntity> AdminOrg = adminOrgDao.getAllMember(organization.getNAME());
        System.out.println(AdminOrg);
        Gson gson = new Gson();
        String json = gson.toJson(AdminOrg);
        dataMap.put("res",json);
        return "display";
    }
    public String showAllProject(){
        dataMap = new HashMap<String, Object>();
        ShowOrgProjectDao showOrgProjectDao = new ShowOrgProjectDaoImp();
        List<ShowOrgProjectEntity> orgProject = showOrgProjectDao.getOrgPro(organization.getNAME());
        Gson gson = new Gson();
        String json = gson.toJson(orgProject);
        System.out.println("OrgAllProject"+json);
        dataMap.put("res",json);
        return "display";
    }

    public String showHistoryProject(){
        dataMap = new HashMap<String, Object>();
        ShowOrgProjectDao showOrgProjectDao = new ShowOrgProjectDaoImp();
        System.out.println(organization.getNAME());
        List<ShowOrgProjectEntity> orgProject = showOrgProjectDao.getOrgHisPro(organization.getNAME());
        Gson gson = new Gson();
        String json = gson.toJson(orgProject);
        System.out.println("OrgAllHisProject"+json);
        dataMap.put("res",json);
        return "display";
    }

    public String jmpOrgManager2(){
        dataMap = new HashMap<String, Object>();
        organizationdao = new OrganizationDaoImp();
        UserEntity seesionUser=(UserEntity)session.get("user");
        List<OrganizationEntity> list = organizationdao.getMyOrg(seesionUser.getId_user());
        ActionContext.getContext().getValueStack().set("list",list);
        System.out.println(list);
        return "OrgManager2Page";
    }

    @Override
    public void prepare() throws Exception {
        organization = new OrganizationEntity();
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


    @Override
    public OrganizationEntity getModel() {
        return organization;
    }
}

