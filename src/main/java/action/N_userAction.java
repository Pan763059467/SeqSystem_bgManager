package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.UserDao;
import daoImp.UserDaoImp;
import entity.AdminEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
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
        boolean res = userDao.lock(user.getId_user());
        dataMap.put("res", res);
        return SUCCESS;
    }

    public String unlock(){
        dataMap = new HashMap<>();
        UserDao userDao = new UserDaoImp();
        boolean res = userDao.unlock(user.getId_user());
        dataMap.put("res", res);
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
    public void setRequest(Map<String, Object> map) {

    }

    @Override
    public void setSession(Map<String, Object> map) {

    }
}
