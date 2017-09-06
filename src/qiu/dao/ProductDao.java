package qiu.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import qiu.entity.Product;
import qiu.sessionFactory.DaoBase;

@Repository("productDao")
public class ProductDao extends DaoBase{
//查找Dao
	public List<Map<String, Object>> doFind(){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		SqlSession session = getSessionFactory().openSession();
		try {
			
			list = session.selectList("productList");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	
	//删除dao
	public int doDelete(int[] productNoArray){
		SqlSession session = getSessionFactory().openSession();
		if(productNoArray==null||productNoArray.equals("")){
			System.err.println("product为空");
			return 1;
		}
		int result=0;
		try {
			
				result = session.delete("productDelete", productNoArray);
				
			if(result!=0){
				System.out.println("删除成功！");
			}else{
				System.out.println("删除失败");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			session.close();
		}
		return result;
	}
	
	
	//编号查重dao
	
	public boolean doCheck(int productNo){
		SqlSession session = getSessionFactory().openSession();
		try {
			List<String>list = session.selectList("productNoCheck",productNo);
			if(list.isEmpty()){
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
		
	}


//增加 修改产品
	public int doAdd(Product product){
		SqlSession session = getSessionFactory().openSession();
		session.delete("productUpdate",product);
		int result=0;
		try {
			 result = session.insert("productAdd",product);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}

}