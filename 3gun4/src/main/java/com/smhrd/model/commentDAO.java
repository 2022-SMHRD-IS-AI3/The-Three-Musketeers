package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class commentDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int upload_com(commentDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("upload_com", dto);
		sqlsession.close();
		
		return cnt;
	}
	
	public List<commentDTO> selectAll_comment() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<commentDTO> list = sqlsession.selectList("selectAll_comment");
		sqlsession.close();
		
		return list; 
	}

	public int delete_comm(String id) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlsession.delete("delete_comm", id);
		sqlsession.close();
		return cnt;
	}
	
}
