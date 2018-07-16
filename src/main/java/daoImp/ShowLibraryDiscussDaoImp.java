package daoImp;

import dao.DAO;
import dao.ShowLibraryDiscussDao;
import entity.LibrarydiscussEntity;

import java.util.List;

public class ShowLibraryDiscussDaoImp extends DAO<LibrarydiscussEntity> implements ShowLibraryDiscussDao {
    @Override
    public List<LibrarydiscussEntity> getAllDiscuss() {
        String sql1="select * from view_lib_discuss";
        List<LibrarydiscussEntity> libDiscuss = getForList(sql1);
        return libDiscuss;
    }
}
