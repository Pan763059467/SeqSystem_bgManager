package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.AccessoryDao;
import dao.CatalogDao;
import dao.ProDiscussDao;
import daoImp.ProDiscussDaoImp;
import entity.AdminEntity;
import entity.ProDiscussEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DocDiscussAction  extends ActionSupport implements RequestAware, SessionAware, ModelDriven<ProDiscussEntity>, Preparable {

    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private String disContent;
    private String catalogIndex;
    private int id_document;
    private CatalogDao catalogDao;
    private ProDiscussDao proDiscussDao;
    private AccessoryDao accessoryDao;
    private ProDiscussEntity proDiscussEntity;
    private int page;
    private int projectId;

    public String docDisList(){
        dataMap = new HashMap<String, Object>();
        proDiscussDao = new ProDiscussDaoImp();
        List<ProDiscussEntity> list = proDiscussDao.getALL();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String deleteDiscuss(){
        dataMap = new HashMap<String, Object>();
        proDiscussDao = new ProDiscussDaoImp();
        AdminEntity seesionAdmin=(AdminEntity)session.get("cur_admin");
        boolean res = proDiscussDao.deleteDiscuss(seesionAdmin.getId_admin(),proDiscussEntity.getId_pro_discuss(),proDiscussEntity.getId_user());
        System.out.println(res);
        dataMap.put("res", res);
        return SUCCESS;
    }

    public Map<String, Object> getRequest() {
        return request;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getSession() {
        return session;
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

    public String getDisContent() {
        return disContent;
    }

    public void setDisContent(String disContent) {
        this.disContent = disContent;
    }

    public String getCatalogIndex() {
        return catalogIndex;
    }

    public void setCatalogIndex(String catalogIndex) {
        this.catalogIndex = catalogIndex;
    }

    public int getId_document() {
        return id_document;
    }

    public void setId_document(int id_document) {
        this.id_document = id_document;
    }

    public CatalogDao getCatalogDao() {
        return catalogDao;
    }

    public void setCatalogDao(CatalogDao catalogDao) {
        this.catalogDao = catalogDao;
    }

    public ProDiscussDao getProDiscussDao() {
        return proDiscussDao;
    }

    public void setProDiscussDao(ProDiscussDao proDiscussDao) {
        this.proDiscussDao = proDiscussDao;
    }

    public AccessoryDao getAccessoryDao() {
        return accessoryDao;
    }

    public void setAccessoryDao(AccessoryDao accessoryDao) {
        this.accessoryDao = accessoryDao;
    }

    public ProDiscussEntity getProDiscussEntity() {
        return proDiscussEntity;
    }

    public void setProDiscussEntity(ProDiscussEntity proDiscussEntity) {
        this.proDiscussEntity = proDiscussEntity;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }
    @Override
    public void prepare() throws Exception {
        proDiscussEntity=new ProDiscussEntity();
    }

    public DocDiscussAction() {
    }

    public DocDiscussAction(Map<String, Object> request, Map<String, Object> session, Map<String, Object> dataMap, String disContent, String catalogIndex, int id_document, CatalogDao catalogDao, ProDiscussDao proDiscussDao, AccessoryDao accessoryDao, ProDiscussEntity proDiscussEntity, int page, int projectId) {
        this.request = request;
        this.session = session;
        this.dataMap = dataMap;
        this.disContent = disContent;
        this.catalogIndex = catalogIndex;
        this.id_document = id_document;
        this.catalogDao = catalogDao;
        this.proDiscussDao = proDiscussDao;
        this.accessoryDao = accessoryDao;
        this.proDiscussEntity = proDiscussEntity;
        this.page = page;
        this.projectId = projectId;
    }
    public ProDiscussEntity getModel() {
        return proDiscussEntity;
    }
}
