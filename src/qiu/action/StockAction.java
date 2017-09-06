package qiu.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import qiu.dao.StockDao;

//ajax获取下拉框内容
@Controller
public class StockAction {
	private StockDao purchaseDao;
	@RequestMapping("/purchase.do")
	public void getProductName(HttpServletResponse response) throws IOException{
		List<Map<String, Object>>list=purchaseDao.getValue();
		JSONArray jsonArray = JSONArray.fromObject(list);
		response.getWriter().write(jsonArray.toString());
		response.getWriter().flush();
	}
	
	@RequestMapping("/buy.do")
	public ModelAndView buyProduct(String productNo,String number,String money){
		System.out.println(productNo+number+money);
		Map<String, Object> data=new HashMap<String, Object>();
		data.put("productNo", productNo);
		data.put("number",number);
		data.put("money", money);
		boolean result = purchaseDao.purchase(data);
		Map<String , Object>map=new HashMap<>();
		if(result){		
			map.put("msg", "<div ><h3  style='color:green; text-align:center'>购买成功！</h3></div>");
			return new ModelAndView("purchase",map);
		}else{
			map.put("msg", "<div><h3  style='color:red; text-align:center'>购买失败！</h3></div>");
			return new ModelAndView("purchase",map);
		}
	}
	
	@RequestMapping("/sold.do")
	public ModelAndView sold(String productNo,String number,String money){
		Map<String, Object> data=new HashMap<String, Object>();
		data.put("productNo", productNo);
		data.put("number",number);
		data.put("money", money);
		boolean result=purchaseDao.doSold(data);
		Map<String , Object>map=new HashMap<>();
		if(result){		
			map.put("msg", "<div ><h3  style='color:green; text-align:center'>出售成功！</h3></div>");
			return new ModelAndView("sold",map);
		}else{
			map.put("msg", "<div><h3  style='color:red; text-align:center'>出售失败！</h3></div>");
			return new ModelAndView("sold",map);
		}
	}
	
	public StockDao getPurchaseDao() {
		return purchaseDao;
	}
	@Resource(name="purchaseDao")
	public void setPurchaseDao(StockDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
}
