package qiu.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;
import qiu.dao.EmployeeDao;
import qiu.entity.Employee;
@Controller
public class EmployeeAction {
	private EmployeeDao employeeDao;
	//查找
	@RequestMapping("/employeeList.do")
	public void find(HttpServletResponse response){
		List<Map<String , Object>> list = new ArrayList<>();
		list=employeeDao.doFind();
		for(int i=0;i<list.size();i++){
			if(list.get(i).get("role").equals("1")){
				list.get(i).put("role", "普通人");
			}
			if(list.get(i).get("role").equals("2")){
				list.get(i).put("role", "采购员");
			}
			if(list.get(i).get("role").equals("3")){
				list.get(i).put("role", "售货员");
			}
			if(list.get(i).get("role").equals("4")){
				list.get(i).put("role", "管理员");				
			}
		}
		System.out.println(list.toString());
		JSONArray jsonArray= JSONArray.fromObject(list);
		response.setContentType("application/json");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(jsonArray.toString());
			response.getWriter().flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//增加
	@RequestMapping("/employeeAdd.do")
	public void productAdd(Employee employee,HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println(employee);
		int result = employeeDao.doAdd(employee);
		if(result!=0){
			response.getWriter().write("success");
			response.getWriter().flush();
			System.out.println("插入成功");
		}else{
			response.getWriter().write("error");
			response.getWriter().flush();
			System.err.println("插入失败");
		}
	}
	
	
	//编号查重
	@RequestMapping("/usernameCheck.do")
	public void productCheck(HttpServletResponse response, HttpServletRequest request){
		String username=request.getParameter("username");
		System.out.println(username);
		boolean result = employeeDao.doCheck(username);
		if(result){
			try {
				response.getWriter().write("success");
				response.getWriter().flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				response.getWriter().write("error");
				response.getWriter().flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	//删除
	@RequestMapping("/employeeDelete.do")
	public void delete(String username,HttpServletRequest request,HttpServletResponse response){
		String data = request.getParameter("checked");
		System.err.println(data);
		JSONArray jsonArray = JSONArray.fromObject(data);
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> l=jsonArray;
		String[] employeeArray = new String[l.size()];
		
		for(int i=0;i<employeeArray.length;i++){
			employeeArray[i]=(String) l.get(i).get("username");
		}
		 int result = employeeDao.doDelete(employeeArray);
		if(result!=0){
			try {
				JSONArray c = new JSONArray();
				c.add("{msg:'success'}");
				System.err.println(c.toString());
				response.setContentType("application/json");
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(c.toString());
				response.getWriter().flush();
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
	
			}
		}
			
	}
	
	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}
	@Resource(name="employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
}
