package com.smhrd.model;


import java.util.List;

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
	public String select_name_bor(String id) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		String name = sqlsession.selectOne("select_name_bor",id);
		sqlsession.close();
		
		return name;
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
		for(int i =0;i<list.size();i++) {
			System.out.print(list.get(i).getName());
			System.out.print(123);
		}
		sqlsession.close();
		return list;
	}
	
	public int delete(String id) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.delete("delete", id);
		sqlsession.close();
		return cnt;
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
		}}
