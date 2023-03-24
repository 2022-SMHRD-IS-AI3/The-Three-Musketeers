package com.smhrd.model;

import java.sql.ResultSet;

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
	
	// 아이디 중복확인
		public boolean check(String id) {
			boolean check = false;
			SqlSession session = sqlSessionFactory.openSession(true);
			String name = session.selectOne("check", id);
			session.close();
			
			if(name!= null) {
				check = true;
			}
			
			return check;
		}
}
