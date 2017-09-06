package qiu.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import qiu.entity.Employee;
import qiu.sessionFactory.DaoBase;
@Repository("employeeDao")
public class EmployeeDao extends DaoBase{
	//查找
	public List<Map<String, Object>> doFind(){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		SqlSession session = getSessionFactory().openSession();
		try {
			
			list = session.selectList("employeeList");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	//编号查重dao
	
		public boolean doCheck(String username){
			SqlSession session = getSessionFactory().openSession();
			try {
				List<String>list = session.selectList("usernameCheck",username);
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
	
	//增加
	public int doAdd(Employee employee){
		SqlSession session = getSessionFactory().openSession();
		session.delete("employeeUpdate",employee);
		int result=0;
		try {
			 result = session.insert("employeeAdd",employee);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	
	//删除dao
		public int doDelete(String[] employeeArray){
			SqlSession session = getSessionFactory().openSession();
			if(employeeArray==null||employeeArray.equals("")){
				System.err.println("employeeArray为空");
				return 1;
			}
			int result=0;
			try {
				
					result = session.delete("employeeDelete", employeeArray);
					
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
}
