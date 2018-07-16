package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.AdminDao;
import dao.ShowPointsRecordDao;
import dao.UserDao;
import daoImp.AdminDaoImp;
import daoImp.ShowPointsRecordDaoImp;
import daoImp.UserDaoImp;
import entity.AdminEntity;
import entity.PointsRecordEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class N_userAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<UserEntity>, Preparable {
    private UserEntity user;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private UserDao userDao;


    public String lock(){
        dataMap = new HashMap<>();
        UserDao userDao = new UserDaoImp();
        AdminEntity seesionAdmin=(AdminEntity)session.get("cur_admin");
        boolean res = userDao.lock(user.getId_user(),seesionAdmin.getId_admin());
        dataMap.put("res", res);
        return SUCCESS;
    }

    public String unlock(){
        dataMap = new HashMap<>();
        UserDao userDao = new UserDaoImp();
        AdminEntity seesionAdmin=(AdminEntity)session.get("cur_admin");
        boolean res = userDao.unlock(user.getId_user(),seesionAdmin.getId_admin());
        dataMap.put("res", res);
        return SUCCESS;
    }

    public String addPoints(){
        dataMap = new HashMap<>();
        UserDao userdao =new UserDaoImp();
        System.out.println(user.getPoints());
        AdminEntity seesionAdmin=(AdminEntity)session.get("cur_admin");
        boolean res = userdao.addPoints(user.getPoints(),seesionAdmin.getId_admin(),seesionAdmin.getName());
        dataMap.put("res",res);
        return "RES";
    }

    public String showPointsRecord(){
        dataMap = new HashMap<>();
        ShowPointsRecordDao showRecordDao= new ShowPointsRecordDaoImp();
        int id_user = (int) session.get("record_user_id");
        List<PointsRecordEntity> recordlist = showRecordDao.showPointsRecord(id_user);
        Gson gson = new Gson();
        String json = gson.toJson(recordlist);
        System.out.println(recordlist);
        dataMap.put("res",json);
        return "RES";
    }

    public String jmpPointsRecordPage(){
        return "PointsRecordPage";
    }

    public String saveRecordId(){
        session.put("record_user_id",user.getId_user());
        session.put("record_user_name",user.getName());
        System.out.println(user.getId_user()+" " + user.getName());
        return SUCCESS;
    }

    @Override
    public UserEntity getModel() {
        return user;
    }

    @Override
    public void prepare() throws Exception {
        user = new UserEntity();
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
}
