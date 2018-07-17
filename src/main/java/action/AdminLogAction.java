package action;

import com.google.gson.Gson;
import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.AdminLogDao;
import daoImp.AdminLogDaoImp;
import daoImp.ShowApplyOrgDaoImp;

import entity.AdminLogEntity;
import entity.ShowApplyOrganizationEntity;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.io.FileOutputStream;
import java.sql.ResultSet;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class AdminLogAction extends ActionSupport implements RequestAware,SessionAware,ModelDriven<AdminLogEntity>,Preparable {
    private AdminLogDao AdminLogDao;
    private AdminLogEntity AdminLog;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;

    public final static String url = "jdbc:mysql://119.23.241.206:3306"; // 数据库URL
    public final static String user = "root"; // 数据库用户名
    public final static String password = "py19980321"; // 数据库密码

    public String logList(){
        dataMap = new HashMap<String, Object>();
        AdminLogDao = new AdminLogDaoImp();
        List<AdminLogEntity> list = AdminLogDao.getALL();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String export() throws Exception{
        /*
        // 建立一个Excel
        Workbook book = new HSSFWorkbook();
        // 在对应的Excel中建立一个分表
        Sheet sheet1 =(Sheet) book.createSheet("分表1");
        // 设置相应的行（初始从0开始）
        Row row =sheet1.createRow(0);
        // 在所在的行设置所在的单元格（相当于列，初始从0开始,对应的就是A列）
        Cell cell = row.createCell(0);
        // 写入相关数据到设置的行列中去。
        cell.setCellValue("相关数据");
        // 保存到计算机相应路径
        book.write( new FileOutputStream("D://a.xls"));*/

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = (Connection) DriverManager.getConnection(url, user,
                password);
        Workbook book = new HSSFWorkbook();
        DatabaseMetaData dbmt = con.getMetaData();

        ResultSet rs0 = dbmt.getTables("seq", "seq", null, new String[] {
                "TABLE", "VIEW" });
        String Table_Name = "admin_log";
        while (rs0.next()) {
                if ("seq".equals(rs0.getString("TABLE_NAME"))) {
                Table_Name = "admin_log";
                break;
                }
             }

        Sheet sheet = book.createSheet(Table_Name);

        Statement st = (Statement) con.createStatement();
        String sql = "select * from seq." + Table_Name;
        ResultSet rs = st.executeQuery(sql);
        Row row1 = sheet.createRow(0);
        ResultSetMetaData rsmd = rs.getMetaData();
        int colnum = rsmd.getColumnCount();
        for (int i = 1; i <= colnum; i++) {
            String name = rsmd.getColumnName(i);
            // 单元格
            Cell cell = row1.createCell(i - 1);
            // 写入数据
            cell.setCellValue(name);
        }
        // 设置表格信息
        int idx = 1;
        while (rs.next()) {
            // 行
            Row row = sheet.createRow(idx++);
            for (int i = 1; i <= colnum; i++) {
                String str = rs.getString(i);
                // 单元格
                Cell cell = row.createCell(i - 1);
                // 写入数据
                cell.setCellValue(str);
            }
        }
        // 保存
        book.write(new FileOutputStream("D://" + Table_Name + ".xls"));
        return SUCCESS;
    }

    @Override
    public AdminLogEntity getModel() {
        return AdminLog;
    }

    @Override
    public void prepare() throws Exception {
        AdminLog = new AdminLogEntity();
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.request = request;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = session;
    }
    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }
}
