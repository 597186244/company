package qiu.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;
import qiu.dao.SoldAndBuyDao;

@Controller
public class SoldAndBuyAction {
	private SoldAndBuyDao soldAndBuyAction;
	@RequestMapping("/soldAndBuy.do")
	public void find(HttpServletResponse response){
		List<Map<String , Object>> list = new ArrayList<>();
		list=soldAndBuyAction.doFind();
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
	public SoldAndBuyDao getSoldAndBuyAction() {
		return soldAndBuyAction;
	}
	@Resource(name="soldAndBuy")
	public void setSoldAndBuyAction(SoldAndBuyDao soldAndBuyAction) {
		this.soldAndBuyAction = soldAndBuyAction;
	}
	
}
