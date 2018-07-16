//        Created by IntelliJ IDEA.
//        User: wwc
//        Date: 22/12/2017
//        Time: 15:55

package action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.LibrarydiscussDao;
import daoImp.LibrarydiscussDaoImp;
import entity.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import java.util.Map;

public class DeleteLibDiscussAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<LibrarydiscussEntity>, Preparable {
    private LibrarydiscussDao librarydiscussdao;
    private LibrarydiscussEntity Libdiscuss;
    private Map<String, Object> session;
    private Map<String, Object> request;
    private Map<String, Object> dataMap;

    public String deleteDiscuss(){
        AdminEntity admin = (AdminEntity) session.get("cur_admin");
        LibrarydiscussDao librarydiscussDao = new LibrarydiscussDaoImp();
        librarydiscussDao.deleteDiscuss(Libdiscuss.getId_lib_discuss(),Libdiscuss.getId_user(),admin.getId_admin(),admin.getName());
        System.out.println("删除评论成功");
        return SUCCESS;
    }

    @Override
    public void prepare() throws Exception {
        Libdiscuss = new LibrarydiscussEntity();
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
    public LibrarydiscussEntity getModel() {
        return Libdiscuss;
    }
}

