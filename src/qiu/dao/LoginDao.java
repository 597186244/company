package qiu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import qiu.entity.Employee;
import qiu.sessionFactory.DaoBase;

@Repository("loginDao")
public class LoginDao extends DaoBase{
	//登陆验证
	public List<Map<String, Object>> doLoginCheck(Employee employee){
		SqlSession session = getSessionFactory().openSession();
		List<Map<String, Object>> list =  session.selectList("login",employee);	
		return list;
	}
	
	//修改密码
	public void doChange(Employee employee){
		SqlSession session = getSessionFactory().openSession();
		try {
			session.update("passwordChange", employee);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
}
