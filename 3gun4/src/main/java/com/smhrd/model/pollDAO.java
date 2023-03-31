package com.smhrd.model;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class pollDAO {
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//투표 작성
	public int upload_poll(pollDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("upload_poll", dto);
		sqlsession.close();
		
		return cnt;
	}
	
	//투표 리스트에
	public List<pollDTO> selectAll_poll() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<pollDTO> list = sqlsession.selectList("selectAll_poll");
		sqlsession.close();
		return list; 
	}

	//투표 삭제
	public int delete_poll(String vote_num) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.delete("delete_poll", vote_num);
		sqlsession.close();
		return cnt;
	}
	
	//투표 목록 중 하나 선택
	public pollDTO selectone_poll(pollDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		pollDTO info_poll = sqlsession.selectOne("selectone_poll",dto);
		sqlsession.close();
		
		return info_poll;
	}
	
	//투표 결과 업데이트
	public int update_poll(result_pollDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		System.out.println("Test213 "+dto.getVote_content());
		int cnt = sqlsession.insert("update_poll", dto);
		sqlsession.close();
		
		return cnt;
	}
	
	//투표참여 인원 카운트
	public String count_poll(String id) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		result_pollDTO info_result_poll = sqlsession.selectOne("count_poll", id);
		sqlsession.close();
		
		return id;
	}
	
	//투표결과 목록 중 하나 선택
	public List<result_pollDTO> selectAll_resultpoll(result_pollDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<result_pollDTO> info_result_poll = sqlsession.selectList("selectAll_resultpoll",dto);
	
		sqlsession.close();
		
		return info_result_poll;
	}
}
