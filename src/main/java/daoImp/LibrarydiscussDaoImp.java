package daoImp;

import dao.DAO;
import dao.LibrarydiscussDao;
import entity.LibrarydiscussEntity;

import java.sql.Timestamp;
import java.util.List;
import java.util.Date;

public class LibrarydiscussDaoImp extends DAO<LibrarydiscussEntity> implements LibrarydiscussDao{

   public int getcount(int id_library)
   {
       String sql="select count(*) from LIB_DISCUSS where ID_LIBRARY=?";
       int count=Integer.valueOf(getForValue(sql,id_library).toString());
       return count;
   }
   public List<LibrarydiscussEntity> getAll(int id_library,int num1,int num2)
    {
        String sql="SELECT LIB_DISCUSS.ID_LIB_DISCUSS,LIB_DISCUSS.TIME,LIB_DISCUSS.CONTENT,`USER`.`NAME`,LIB_DISCUSS.ID_LIBRARY,LIB_DISCUSS.ID_USER FROM`USER`RIGHT JOIN LIB_DISCUSS ON LIB_DISCUSS.ID_USER = `USER`.ID_USER WHERE LIB_DISCUSS.ID_LIBRARY=?  ORDER BY LIB_DISCUSS.ID_LIB_DISCUSS DESC limit ?,?";
        List<LibrarydiscussEntity> librarydiscuss1=getForList(sql,id_library,num1,num2);
        return librarydiscuss1;
    }
   public boolean insert(int id_user, int id_library, Date time,String content)
    {

        if(!content.trim().equals("")) {
            String sql="insert into LIB_DISCUSS (ID_USER,ID_LIBRARY,TIME,CONTENT) values(?,?,?,?)";
            update(sql, id_user, id_library, time, content);
            return true;
        }
        else
            return false;
    }
    public boolean delete(int id_lib_discuss)
    {
        if(id_lib_discuss!=0)
        {
            String sql="delete from LIB_DISCUSS where id_lib_discuss=?";
            update(sql, id_lib_discuss);
            return true;
        }
        else
            return  false;
    }

    @Override
    public boolean deleteDiscuss(int id_lib_discuss, int id_user, int admin_id, String admin_name) {
       if(id_lib_discuss!=0){
           String sql1="delete from LIB_DISCUSS where ID_LIB_DISCUSS=?";
           String sql2="insert into message(ID_USER,CONTENT,DATE) value(?,?,?)";
           String sql3="insert into admin_log(ID_ADMIN,CONTENT,DATE) value(?,?,?)";
           String sql4="select CONTENT from lib_discuss where ID_LIB_DISCUSS=?";
           String sql5="select NAME from USER where ID_USER = ?";
           String sql6="select LIBRARY_NAME from view_lib_discuss where ID_LIB_DISCUSS=?";
           String user_name = getForValue(sql5,id_user);
           String library_name = getForValue(sql6,id_lib_discuss);
           Timestamp NowTime = new Timestamp(new java.util.Date().getTime());
           String content1 = getForValue(sql4,id_lib_discuss);
           String content2 = "管理员"+admin_name+"于"+NowTime+"删除用户"+user_name+"在构件库"+library_name+"的评论"+content1;
           String content3 = "管理员删除了您在构件库"+library_name+"的评论"+content1;
           update(sql1,id_lib_discuss);
           update(sql2,id_user,content3,NowTime);
           update(sql3,admin_id,content2,NowTime);
           return true;
       }
       else
        return false;
    }

}
