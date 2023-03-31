package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class msgDAO {
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 메시지 전송
	public int send_msg(msgDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("send_msg", dto);
		sqlsession.close();
	
		return cnt;
	}
	
	// 메시지함에 나에게 온 메시지 추가
	public List<msgDTO> selectAll_msg(String id) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<msgDTO> list = sqlsession.selectList("selectAll_msg",id);
		sqlsession.close();
		
		return list; 
	}
	
	// 메시지함중에서 하나 선택  
	public msgDTO selectone(int num) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		msgDTO info_msg = sqlsession.selectOne("selectone_msg",num);
		sqlsession.close();	
		
		return info_msg;
	}

	public int delete_msg(int msg_num) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.delete("delete_msg", msg_num);
		sqlsession.close();
	
		return cnt;
	}

	
}
