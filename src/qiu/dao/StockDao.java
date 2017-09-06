package qiu.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import qiu.sessionFactory.DaoBase;

@Repository("purchaseDao")
public class StockDao extends DaoBase{
	public List<Map<String, Object>> getValue(){
		SqlSession session = getSessionFactory().openSession();
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		try {
			list = session.selectList("purchaseValue");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	//入库信息
	public boolean purchase(Map<String, Object>map){
		SqlSession session = getSessionFactory().openSession();
		int result=0;
		try {
			result = session.insert("purchase",map);
			if(result!=0){
				session.update("buy",map);
				System.out.println("购买成功");
				return true;
			}else{
				System.err.println("购买失败");
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	
	}
	
	//产品卖出
	@RequestMapping("/sold.do")
	public boolean doSold(Map<String, Object>map){
		SqlSession session = getSessionFactory().openSession();
		try {
			int temp = session.selectOne("positive", map);
			int tmep2=Integer.parseInt((String) map.get("number"));
			if(tmep2<temp){
				int result = session.update("sold",map);
				int result2=session.insert("sold1",map);
				if(result>0&&result2>0){
					System.out.println("卖出成功！");
					return true;
				}else{
					System.out.println("卖出失败！");
					return false;
				}
				
			}else{
				System.out.println("卖出失败！");
				return false;
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
		
	}
}
