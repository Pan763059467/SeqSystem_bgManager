package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.LibraryDao;
import daoImp.LibraryDaoImp;
import entity.LibraryEntity;
import entity.UserEntity;
import org.apache.struts2.components.If;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LibraryAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<LibraryEntity>, Preparable {


    private LibraryDao libraryDao;
    private LibraryEntity library;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private  int page;
    private int id_user;

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String get() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryAll;
        int page=1;
        libraryAll=libraryDao.getAll((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("list",libraryAll);
        int count=libraryDao.getAllcount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getall";
    }

    public String getagain() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryAllagain;
        libraryAllagain=libraryDao.getAll((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("list",libraryAllagain);
        int count=libraryDao.getAllcount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getall";
    }

    public String getcommon() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryCommon;
        int page=1;
        int count=libraryDao.getCommoncount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        libraryCommon=libraryDao.getCommon((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listcommon",libraryCommon);
        return "getcommon";
    }

    public  String getcommonagain()
    {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryCommonagain;
        libraryCommonagain=libraryDao.getCommon((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listcommon",libraryCommonagain);
        int count=libraryDao.getCommoncount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getcommon";
    }

    public String getuser() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryUser;
        int page=1;
        int count=libraryDao.getUsercount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        libraryUser=libraryDao.getUser((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listuser",libraryUser);
        return "getuser";
    }

    public String getuseragain()
    {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryUseragain;
        libraryUseragain=libraryDao.getUser((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listuser",libraryUseragain);
        int count=libraryDao.getUsercount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getuser";
    }

    public String getcase() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryCase;
        int page=1;
        libraryCase=libraryDao.getCase((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listcase",libraryCase);
        int count=libraryDao.getCasecount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getcase";
    }

    public String getcaseagain(){
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryCaseagain;
        libraryCaseagain=libraryDao.getCase((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listcase",libraryCaseagain);
        int count=libraryDao.getCasecount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getcase";
    }

    public String getpicture() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryPicture;
        int page=1;
        int count=libraryDao.getPicturecount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        libraryPicture=libraryDao.getPicture((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listpicture",libraryPicture);
        return "getpicture";
    }

    public String getpictureagain()
    {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryPictureagain;
        libraryPictureagain=libraryDao.getPicture((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listpicture",libraryPictureagain);
        int count=libraryDao.getPicturecount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getpicture";
    }

    public String Mycollect() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> librarycollectAll;
        int page=1;
        librarycollectAll=libraryDao.getMycollect((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        System.out.println(librarycollectAll);
        ActionContext.getContext().getValueStack().set("listmycollect",librarycollectAll);
        int count=libraryDao.getMycollectcount((((UserEntity)session.get("user")).getId_user()));
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getMycollect";
    }

    public String Mycollectagain(){
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> librarycollectAllagain;
        librarycollectAllagain=libraryDao.getMycollect((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listmycollect",librarycollectAllagain);
        int count=libraryDao.getMycollectcount((((UserEntity)session.get("user")).getId_user()));
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getMycollect";
    }



    @Override
    public LibraryEntity getModel() {
        return library;
    }

    @Override
    public void prepare() throws Exception {
        library = new LibraryEntity();
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

    public void setPage(int page) {
        this.page = page;
    }
}
