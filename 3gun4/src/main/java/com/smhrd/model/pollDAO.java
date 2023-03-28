package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class pollDAO {
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int upload_poll(pollDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("upload_poll", dto);
		sqlsession.close();
		
		return cnt;
	}
	
	public List<pollDTO> selectAll_poll() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<pollDTO> list = sqlsession.selectList("selectAll_poll");
		sqlsession.close();
		return list; 
	}

	public int delete_poll(String vote_num) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.delete("delete_poll", vote_num);
		sqlsession.close();
		return cnt;
	}
	public pollDTO selectone_poll(pollDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		pollDTO info_poll = sqlsession.selectOne("selectone_poll",dto);
		sqlsession.close();
		
		return info_poll;
	}
}
