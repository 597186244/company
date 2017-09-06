package qiu.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import qiu.entity.Permission;
import qiu.sessionFactory.DaoBase;

@Repository("permissionDao")
public class PermissionDao extends DaoBase{
	public List<Map<String, Object>> getPermiss() {
		// TODO Auto-generated method stub
		SqlSession session = getSessionFactory().openSession();
		List<Map<String,Object>>list = new ArrayList<Map<String,Object>>();
		try {
			list = session.selectList("getPermission");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	
	//修改权限
	public int doChangePermission(Permission permission){
		SqlSession session = getSessionFactory().openSession();
		int result=0;
		try {
			result = session.update("changePermission",permission);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	
}
