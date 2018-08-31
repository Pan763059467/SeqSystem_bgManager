package action;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.LibrarydiscussDao;
import dao.StructureDao;
import dao.LibraryDao;
import daoImp.LibraryDaoImp;
import daoImp.LibrarydiscussDaoImp;
import daoImp.StructureDaoImp;
import entity.*;
import org.apache.struts2.components.If;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import util.Json;
import com.google.gson.Gson;

import java.util.*;

public class StructureAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<StructureEntity>, Preparable {
    private StructureDao structureDao;
    private LibrarydiscussDao librarydiscussDao;
    private LibraryDao libraryDao;
    private LibraryEntity library;
    private LibrarydiscussEntity librarydiscuss;
    private StructureEntity structure;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private String id_template;
    private int page;
    private int pagedis;


    public String get()
    {
        structureDao = new StructureDaoImp();
        librarydiscussDao = new LibrarydiscussDaoImp();
        libraryDao=new LibraryDaoImp();



        library=libraryDao.getOne(structure.getId_library());
        request.put("library",library);

        Gson gson = new Gson();

        List<StructureEntity> structureAll;
        if(id_template=="通用"){
            structureAll=structureDao.getAll(structure.getId_library(),(page-1)*9,(page-1)*0+9);
            int count=structureDao.count(structure.getId_library());
            if(count%9==0&&count!=0) {
                int num = count / 9;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num = 1;
                request.put("num", num);
            }
            else if(count%9!=0)
            {
                int num = count / 9 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_library",structure.getId_library());
            request.put("id_template",id_template);
            List csList=new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   CommonStructureEntity cs = gson.fromJson(structureAll.get(i).getContent(), CommonStructureEntity.class);
                csList.add(cs);
            }
            ActionContext.getContext().getValueStack().set("list1",csList);
        }
        else if(id_template=="用户") {
            structureAll=structureDao.getAll(structure.getId_library(),(page-1)*4,(page-1)*0+4);
            int count=structureDao.count(structure.getId_library());
            if(count%4==0&&count!=0) {
                int num = count / 4;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num=1;
                request.put("num", num);
            }
            else if(count%4!=0)
            {
                int num = count / 4 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_library",structure.getId_library());
            request.put("id_template",id_template);
            List usList=new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   UserStructureEntity us = gson.fromJson(structureAll.get(i).getContent(), UserStructureEntity.class);
                usList.add(us);
            }
            System.out.println(usList);
            System.out.println(structureAll);
            ActionContext.getContext().getValueStack().set("list2",usList);
        }
        else if(id_template=="用例") {
            structureAll=structureDao.getAll(structure.getId_library(),(page-1)*2,(page-1)*0+2);
            int count=structureDao.count(structure.getId_library());
            if(count%2==0&&count!=0) {
                int num = count / 2;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num=1;
                request.put("num", num);
            }
            else if(count%2!=0)
            {
                int num = count / 2 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_library",structure.getId_library());
            request.put("id_template",id_template);
            List funList=new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   FunStructureEntity funs = gson.fromJson(structureAll.get(i).getContent(), FunStructureEntity.class);
                funList.add(funs);
            }
            ActionContext.getContext().getValueStack().set("list3",funList);
        }
        else if(id_template=="图片")
        {
            structureAll=structureDao.getAll(structure.getId_library(),(page-1)*4,(page-1)*0+4);
            int count=structureDao.count(structure.getId_library());
            if(count%4==0&&count!=0) {
                int num = count / 4;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num=1;
                request.put("num", num);
            }
            else if(count%4!=0)
            {
                int num = count / 4 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_library",structure.getId_library());
            request.put("id_template",id_template);
            List psList=new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   PictureStructureEntity ps = gson.fromJson(structureAll.get(i).getContent(), PictureStructureEntity.class);
                psList.add(ps);
            }
            ActionContext.getContext().getValueStack().set("list4",psList);
        }

        return "get";
    }
    @Override
    public StructureEntity getModel() {
        return structure;
    }

    @Override
    public void prepare() throws Exception {
        structure = new StructureEntity();
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

    public void setId_template(String id_template) {
        this.id_template = id_template;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public void setPagedis(int pagedis) {
        this.pagedis = pagedis;
    }
}
