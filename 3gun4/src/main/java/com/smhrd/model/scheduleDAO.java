package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class scheduleDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int delete_all() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.delete("delete_all");
		sqlsession.close();
		return cnt;
		
	}

	public int insert_all(scheduleDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("insert_all", dto);
		sqlsession.close();
		return cnt;
	}
	
	public List<scheduleDTO> selectAll_sch(){
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<scheduleDTO> list = sqlsession.selectList("selectAll_sch");
		sqlsession.close();
		return list;
	}
	
	
}
