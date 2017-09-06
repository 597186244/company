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
import qiu.dao.ProductDao;
import qiu.entity.Product;

@Controller
public class ProducAction {
	private ProductDao productDao;
	//查找产品
	@RequestMapping("/productList.do")
	public void find(HttpServletResponse response){
		List<Map<String , Object>> list = new ArrayList<>();
		list=productDao.doFind();
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
	
	
	
	
	//删除产品
	@RequestMapping("/productDelete.do")
	public void delete(Integer productNo,HttpServletRequest request,HttpServletResponse response){
		String data = request.getParameter("checked");
		System.err.println(data);
		JSONArray jsonArray = JSONArray.fromObject(data);
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> l=jsonArray;
		int[] productNoArray = new int[l.size()];
		
		for(int i=0;i<productNoArray.length;i++){
			productNoArray[i]=(int) l.get(i).get("productNo");
		}
		 int result = productDao.doDelete(productNoArray);
		if(result!=0){
			try {
//				String c = "{'json':'jsonvalue','bool':true,'int':1,'double':'20.5'}";
				JSONArray c = new JSONArray();
				response.setContentType("application/json");
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(c.toString());
//				System.out.println(jsonArray.toString());
				response.getWriter().flush();
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
	
			}
		}
			
	}
	
	
	
	
	//编号查重
	@RequestMapping("/productNoCheck.do")
	public void productCheck(HttpServletResponse response, HttpServletRequest request){
		String data=request.getParameter("productNo");
		int productNo=Integer.parseInt(data);
		System.out.println(productNo);
		boolean result = productDao.doCheck(productNo);
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
	
	
	
	//增加产品
	@RequestMapping("productAdd.do")
	public void productAdd(Product product,HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println(product);
		int result = productDao.doAdd(product);
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
	
	
	public ProductDao getProduct() {
		return productDao;
	}
	@Resource(name="productDao")
	public void setProduct(ProductDao product) {
		this.productDao = product;
	}
	
}
