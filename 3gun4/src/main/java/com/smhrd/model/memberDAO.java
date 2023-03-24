package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class memberDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int join(memberDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("join", dto);
		sqlsession.close();
		
		return cnt;
	}
	
	public memberDTO login(memberDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		memberDTO info = sqlsession.selectOne("login",dto);
		sqlsession.close();
		
		return info;
	}

	public int update(memberDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.update("update",dto);
		sqlsession.close();
		
		return cnt;
	}
	public List<memberDTO> selectAll() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<memberDTO> list = sqlsession.selectList("selectAll");
		sqlsession.close();
		return list;
	}
	
	public int delete(String id) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.delete("delete", id);
		sqlsession.close();
		return cnt;
	}
}
