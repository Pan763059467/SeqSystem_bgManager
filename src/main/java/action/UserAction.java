package action;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.AdminDao;
import dao.PersonalCenterDao;
import dao.UserDao;
import daoImp.UserDaoImp;
import daoImp.AdminDaoImp;
import entity.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by DELL on 2017/11/28.
 *
 * @author MJY
 */
public class UserAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<AdminEntity>, Preparable {

    private UserDao userDao;
    private PersonalCenterDao personalcenterdao;
    private PersonalCenterEntity PersonaCenter;
    private UserEntity user;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private String tempPassword;
    private String newPassword;
    private Map<String, Object> dataMap;
    private String verification;
    private String formerPassword;

    private AdminDao adminDao;
    private AdminEntity admin;

    public String login() {
        dataMap = new HashMap<String, Object>();
        adminDao = new AdminDaoImp();
        System.out.println(admin.getName()+admin.getPassword());
        boolean res = adminDao.login(admin.getName(),admin.getPassword());
        System.out.println(res);
        dataMap.put("res", res);
        if(res==true) {
            AdminEntity cur_admin = adminDao.getOne(admin.getName());
            session.put("cur_admin",cur_admin);
            session.put("admin_rank",cur_admin.getSp());
            System.out.println(cur_admin.getId_admin()+"#"+cur_admin.getSp());
        }
        return "RES";
    }

    public String registration() {
        dataMap = new HashMap<String, Object>();
        userDao = new UserDaoImp();
        int temp=(int)session.get("verification");
        String sessionVerification=Integer.toString(temp);
        System.out.println(user.getName() + " " + user.getPassword()+" "+tempPassword+" "+user.getMail()+" "+verification+" "+"session注册码:"+session.get("verification"));
        if(sessionVerification.equals(verification) && verification!="") {
            boolean res = userDao.registration(user.getName(), user.getPassword(), tempPassword, user.getMail());
            dataMap.put("res", res);
            System.out.println(res);
        }
        else{
            String res="error";
            dataMap.put("consequence",res);
            System.out.println(res);
        }
        return SUCCESS;
    }

    public String SPreplacepassword(){
        dataMap = new HashMap<String,Object>();
        adminDao = new AdminDaoImp();
        int temp = (int)session.get("replaceverification");
        String sessionReplaceVerification=Integer.toString(temp);
        System.out.println(admin.getName()+" "+" "+newPassword+" "+"session注册码:"+session.get("replaceverification")+" "+admin.getMail());
        if(sessionReplaceVerification.equals(verification) && !verification.equals("")){
            System.out.println("verificationSuccess");
            boolean res = adminDao.SPreplacepassword(admin.getName(),tempPassword,newPassword);
            dataMap.put("res",res);
        }
        else{
            String res="error";
            dataMap.put("consequence",res);
            System.out.println(res);
        }
        return SUCCESS;
    }

    public String changePassword(){
        dataMap = new HashMap<String, Object>();
        adminDao = new AdminDaoImp();
        System.out.println(admin.getName()+" "+formerPassword+" "+tempPassword+" "+newPassword);
        boolean res = adminDao.changePassword(admin.getName(),formerPassword,tempPassword,newPassword);
        System.out.println(res);
        dataMap.put("res", res);
        return SUCCESS;
    }

    public String showAllUser(){
        dataMap = new HashMap<>();
        UserDao userDao = new UserDaoImp();
        List<UserEntity> allUser = userDao.getAllUser();
        Gson gson = new Gson();
        String json = gson.toJson(allUser);
        dataMap.put("res",json);
        return "RES";
    }

    public String addPoints(){
        dataMap = new HashMap<>();
        UserDao userdao =new UserDaoImp();
        System.out.println(user.getPoints());
        boolean res = userdao.addPoints(user.getPoints());
        dataMap.put("res",res);
        return "RES";
    }
    public String postVerification(){
        userDao = new UserDaoImp();
        dataMap = new HashMap<String, Object>();
        System.out.println("helloverficication");
        int temp = (int) ((Math.random()*9+1)*100000);
        String email = user.getMail();
        session.put("verification",temp);
        System.out.println("email:"+email+"  verification:"+session.get("verification"));
        String mail = user.getMail(); //发送对象的邮箱
        String title = "快易需求助手注册验证码";
        String content = String.valueOf(temp);
        postmailEntity info = new postmailEntity();
        info.setToAddress(mail);
        info.setSubject(title);
        info.setContent(content);
        boolean res= userDao.postmail(info,title);
        dataMap.put("res",res);
        return "RES";
    }


    public String postReplacepassword(){
        adminDao = new AdminDaoImp();
        System.out.println(admin.getName()+"mail:"+admin.getMail());
        boolean confirm = adminDao.nameAndMail(admin.getName(), admin.getMail());
        System.out.println(confirm);
        if(confirm) {
            adminDao = new AdminDaoImp();
            dataMap = new HashMap<String, Object>();
            System.out.println("helloverficication");
            int temp = (int) ((Math.random() * 9 + 1) * 100000);
            String email = admin.getMail();
            session.put("replaceverification", temp);
            System.out.println("email:" + email + "  verification:" + session.get("replaceverification"));
            String mail = admin.getMail(); //发送对象的邮箱
            String title = "快易需求助手修改密码验证码";
            String content = String.valueOf(temp);
            postmailEntity info = new postmailEntity();
            postmailEntity infomyself = new postmailEntity();
            info.setToAddress(mail);
            info.setSubject(title);
            info.setContent(content);
            boolean res = adminDao.postmail(info, title);
            dataMap.put("res", res);
        }
        dataMap.put("consequence",confirm);
        return "RES";
    }

    public String jmpLogin(){
        session.put("admin",null);
        return "loginPage";
    }
    public String jmpMyprofile(){
        return "myprofilePage";
    }
    public String jmpRegistration() {
        return "registrationPage";
    }
    public String jmpReplacepassword(){
        return "replacepasswordPage";
    }
    public String jmpSPReplacepassword(){
        return "spreplacepasswordPage";
    }
    public String jmpHomepage() {
        return "homePage";
    }


    public String jmpTemp() {
        return "tempPage";
    }
    public String jmpSysManager1(){
        return "SysManager1Page";
    }
    public String jmpSysManager2(){
        return "SysManager2Page";
    }
    public String jmpNewproject(){
        return "newprojectPage";
    }

    public String jmpLibrary(){ return "libraryPage"; }
    public String jmpUserlibrary(){return "userlibraryPage";}
    public String jmpCaselibrary(){return "caselibraryPage";}
    public String jmpCommonlibrary(){return "commonlibraryPage";}
    public String jmpPicturelibrary(){return "picturelibraryPage";}
    public String jmpCommoncomponent(){return "commoncomponentPage";}
    public String jmpPicturecomponent(){return "picturecomponentPage";}
    public String jmpMycollect(){return "mycollectPage";}
    public String jmpComponent(){ return "componentPage"; }
    public String jmpCasecomponent(){return "casecomponentPage";}
    public String jmpUsercomponent(){return "usercomponentPage";}
    public String jmpCurrentProjectList() {
        return "currentProjectList";
    }
    public String jmpCompletedProjectList() {
        return "completedProjectList";
    }
    public String jmpOperationLog() {
        return "OperationLog";
    }

    public String jmpUserManager(){
        return "UserManagerPage";
    }
    public String jmpPointManager(){
        return "pointsManagerPage";
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

    public void setFormerPassword(String formerPassword) {
        this.formerPassword = formerPassword;
    }
    public void setTempPassword(String tempPassword) {
        this.tempPassword = tempPassword;
    }
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
    public void setVerification(String verification) {
        this.verification = verification;
    }
}
