package interceptor;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import entity.AdminEntity;

import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;
import java.util.Objects;

public class AuthorityInterceptor extends AbstractInterceptor{
        //拦截action处理的拦截方法
        @Override
        public String intercept(ActionInvocation invocation) throws Exception {
            //取得请求相关的ActionContext实例
            HttpSession session= ServletActionContext.getRequest().getSession();
            //取出名为user的session属性
            AdminEntity admin= (AdminEntity) session.getAttribute("cur_admin");
            String method =  invocation.getProxy().getMethod();
            if(admin!=null){
                if(Objects.equals(method, "jmpAdminManage")){
                    int rank=(int)session.getAttribute("admin_rank");
                    if(rank==1)
                        return invocation.invoke();
                    else{
                        ((ActionSupport) invocation.getAction()).addActionError("sorry,you don't have permission!");
                        return Action.LOGIN;
                    }
                }
                return invocation.invoke();
            }
            System.out.println(method+"/"+admin+"/before_interceptor");
            ((ActionSupport)invocation.getAction()).addActionError("sorry,not login");
            //直接返回login逻辑视图
            System.out.println(admin+"after_interceptor");
            return Action.LOGIN;
        }
}