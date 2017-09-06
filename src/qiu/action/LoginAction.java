package qiu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import qiu.dao.LoginDao;
import qiu.entity.Employee;


@Controller
public class LoginAction {
	private LoginDao loginDao;
	public static List<Map<String,Object>> result ;
	public Map<String, Object> msg = new HashMap<>();
	public Map<String, Object> msg2 = new HashMap<>();
	@RequestMapping("/loginAction.do")
	public ModelAndView loginCheck(Employee employee,HttpSession session ){
		Map<String ,Object>model= new HashMap<>();
		System.out.println( employee);
		result = loginDao.doLoginCheck(employee);
		if(!result.isEmpty()){
			Object employeeName= result.get(0).get("employeeName");
			Object password = result.get(0).get("password");
			session.setAttribute("name",employeeName);
			session.setAttribute("password",password);
			session.setAttribute("user", result.get(0));
			model.put("user", result.get(0));
			return new ModelAndView("redirect:/main.jsp");
		}else{
			model.put("error", "密码错误！");
			return new ModelAndView("index",model);
		}		
	}
	@RequestMapping("/passwordChange.do") 
	public ModelAndView passwordChange(HttpServletRequest request,String oldPassword,String newPassword,Employee employee){
		System.out.println(oldPassword);
		System.out.println(newPassword);
		if(!oldPassword.equals(result.get(0).get("password"))){
			msg.put("flg", "1");
			return new ModelAndView("passwordChange",msg);
		}
			employee.setPassword(newPassword);
			try {
				loginDao.doChange(employee);
				request.setCharacterEncoding("utf-8");
				msg2.put("msg2",  "<div class='center alert-success' >"
						+ "<center><h3 style='color:green'>修改成功！</h3></center>"
						+ "</div>");
				return new ModelAndView("passwordChange",msg2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				msg.put("msg2", "<div class='center alert-error' >	<h3 style='color:red'>发生错误，修改失败！</h3></div>");
				return new ModelAndView("passwordchange",msg);
			}
		
	}

	public LoginDao getLoginDao() {
		return loginDao;
	}
	@Resource(name="loginDao")
	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	
}
