package qiu.sessionFactory;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;

public class DaoBase {
	private  SqlSessionFactory sessionFactory;
	
	public  SqlSessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource(name="sqlSessionFactory")
	public void setSessionFactory(SqlSessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
}
