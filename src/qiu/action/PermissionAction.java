package qiu.action;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;
import qiu.dao.PermissionDao;
import qiu.entity.Permission;

@Controller
public class PermissionAction {
	//获取权限
	private PermissionDao permissionDao;
	@RequestMapping("/permission.do")
	public void permission(HttpServletResponse response) throws IOException{
		List<Map<String, Object>>list = permissionDao.getPermiss();
		JSONArray jsonArray = JSONArray.fromObject(list);
		response.getWriter().write(jsonArray.toString());
		response.getWriter().flush();
	}
	
	
	//修改权限
	@RequestMapping("/changePermission.do")
	public void changePermission(HttpServletResponse response,HttpServletRequest request) throws IOException{
		System.out.println(request.getParameter("permission"));
		String data= request.getParameter("permission");
		JSONArray js = JSONArray.fromObject(data);
		List<Map<String, Object>>list = js;
		Integer role = (Integer) list.get(0).get("role");
		Integer _product = (Integer) list.get(0).get("product");
		Integer _employee=(Integer)list.get(0).get("employee");
		Integer _stock=(Integer)list.get(0).get("stock");
		Integer _permission=(Integer)list.get(0).get("permission");
		
		String _product_=Integer.toBinaryString(convert(_product));
		String _employee_=Integer.toBinaryString(convert(_employee));
		String _stock_=Integer.toBinaryString(convert(_stock));
		String _permission_=Integer.toBinaryString(convert(_permission));
		
		DecimalFormat dFormat = new DecimalFormat("0000");
		String product=dFormat.format(Integer.parseInt(_product_));
		String employee=dFormat.format(Integer.parseInt(_employee_));
		String stock=dFormat.format(Integer.parseInt(_stock_));
		String permission=dFormat.format(Integer.parseInt(_permission_));
		Permission pss = new Permission();
		pss.setRole(role);
		pss.setProduct(product);
		pss.setEmployee(employee);
		pss.setStock(stock);
		pss.setPermission(permission);
		
		int result = permissionDao.doChangePermission(pss);
		if(result!=0){
			response.getWriter().write(JSONArray.fromObject("[{'msg':'success'}]").toString());
		}else{
			response.getWriter().write("");
		}
		response.getWriter().flush();
	}
	
	private Integer convert(Integer c){
		String d=c.toString();
		char[] e = d.toCharArray();
		int num=0;
		for(int i=0;i<e.length;i++){
			num=num+Integer.parseInt(String.valueOf(e[i]));
		}
		return num;
	}
	
	public PermissionDao getPermissionDao() {
		return permissionDao;
	}
	@Resource(name="permissionDao")
	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}
	
}
