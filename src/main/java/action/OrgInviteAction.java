package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.OrgInviteDao;
import dao.OrganizationDao;
import dao.UserDao;
import daoImp.HistoryInfoDaoImp;
import daoImp.OrgInviteDaoImp;
import daoImp.OrganizationDaoImp;
import daoImp.UserDaoImp;
import entity.AdminEntity;
import entity.OrgInviteEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrgInviteAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<OrgInviteEntity>, Preparable {
    private Map<String, Object> session;
    private Map<String, Object> request;
    private Map<String, Object> dataMap;
    private OrgInviteEntity orgInvite;
    private OrgInviteDao orgInviteDao;
    private OrganizationDao org;

    public String InviteUser(){
        dataMap = new HashMap<String, Object>();
        orgInviteDao = new OrgInviteDaoImp();
        UserEntity sessionUser = (UserEntity)session.get("user");
        String content = sessionUser.getName()+"邀请你加入机构 "+orgInvite.getORG_NAME();
        boolean res=orgInviteDao.inviteUser(content,orgInvite,sessionUser);
        List<OrgInviteEntity> list=orgInviteDao.getlist(orgInvite.getORG_NAME());
        Gson gson = new Gson();
        String showOperate = gson.toJson(list);
        dataMap.put("res",res);
        dataMap.put("showOperate",showOperate);
        return SUCCESS;
    }

    public String reInviteUser(){
        dataMap = new HashMap<String, Object>();
        orgInviteDao = new OrgInviteDaoImp();
        System.out.println("InviteUser.org"+orgInvite.getORG_NAME());
        orgInviteDao.reInviteUser(orgInvite);
        List<OrgInviteEntity> list=orgInviteDao.getlist(orgInvite.getORG_NAME());
        Gson gson = new Gson();
        String showOperate = gson.toJson(list);
        dataMap.put("res",showOperate);
        return SUCCESS;
    }

    public String showList(){
        System.out.println("start showOrgInvite");
        dataMap = new HashMap<String, Object>();
        orgInviteDao = new OrgInviteDaoImp();
        System.out.println(orgInvite.getORG_NAME());
        List<OrgInviteEntity> list=orgInviteDao.getlist(orgInvite.getORG_NAME());
        Gson gson = new Gson();
        String showOperate = gson.toJson(list);
        dataMap.put("res",showOperate);
        return SUCCESS;
    }

    public String grantOrg() {
        dataMap = new HashMap<String, Object>();
        orgInviteDao = new OrgInviteDaoImp();
        AdminEntity admin;
        admin = (AdminEntity) session.get("cur_admin");
        boolean res = orgInviteDao.grantOrg(orgInvite.getID_USER(), orgInvite.getORG_NAME(),admin.getName(),admin.getId_admin());
        dataMap.put("res",res);
        return SUCCESS;
    }

    public String deleteUser(){
        dataMap = new HashMap<String, Object>();
        orgInviteDao = new OrgInviteDaoImp();
        org = new OrganizationDaoImp();
        UserDao userDao = new UserDaoImp();
        HistoryInfoDaoImp history = new HistoryInfoDaoImp();
        UserEntity sessionUser = (UserEntity) session.get("user");
        boolean res=orgInviteDao.deleteUser(orgInvite.getID_USER(),orgInvite.getORG_NAME());
        if (res) {
            String content1 = orgInvite.getUSER_NAME()+"已被您移出机构"+orgInvite.getORG_NAME();
            String Adminname = org.findAdminName(orgInvite.getID_ORGANIZATION());
            String content2 = "您已被"+Adminname+"移出机构"+orgInvite.getORG_NAME();
            Date dt=new Date();
            history.hasAcceptorDeleteORG(sessionUser.getId_user(),content1, dt,orgInvite.getORG_NAME());
            history.hasAcceptorDeleteORG(orgInvite.getID_USER(),content2, dt,orgInvite.getORG_NAME());
        }
        UserDao userdao = new UserDaoImp();
        UserEntity seesionUser=(UserEntity)session.get("user");
        List<UserEntity> orgMember = userdao.getOrgAllMem(seesionUser.getId_user(),orgInvite.getORG_NAME());
        Gson gson = new Gson();
        String json = gson.toJson(orgMember);
        dataMap.put("res",json);
        return SUCCESS;
    }
    @Override
    public OrgInviteEntity getModel() {
        return  orgInvite;
    }

    @Override
    public void prepare() throws Exception {
        orgInvite = new OrgInviteEntity();
    }

    @Override
    public void setRequest(Map<String, Object> request) {
            this.request=request;
    }

    @Override
    public void setSession(Map<String, Object> session) {
            this.session=session;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }
}
