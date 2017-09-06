package qiu.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import qiu.sessionFactory.DaoBase;

@Repository("soldAndBuy")
public class SoldAndBuyDao extends DaoBase{
	public List<Map<String, Object>> doFind(){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		SqlSession session = getSessionFactory().openSession();
		try {
			
			list = session.selectList("stockList");
			list.toString();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
}
