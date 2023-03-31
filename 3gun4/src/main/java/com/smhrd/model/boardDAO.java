package com.smhrd.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class boardDAO {
	
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int upload(boardDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("upload", dto);
		sqlsession.close();
		
		return cnt;
	}
	
	public List<boardDTO> selectAll_board() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<boardDTO> list = sqlsession.selectList("selectAll_board");
		sqlsession.close();
		return list; 
	}

	public int delete_bor(int board_num) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlsession.delete("delete_bor", board_num);
		
		sqlsession.close();
		return cnt;
	}

	public boardDTO selectone(boardDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		boardDTO info_board = sqlsession.selectOne("selectone",dto);
		sqlsession.close();
		
		return info_board;
	}

	public int delete_co(int board_num) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
	
		int cnt = sqlsession.delete("delete_co", board_num);
		sqlsession.close();
		return cnt;
	}

	public int delete_bord(String id) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlsession.delete("delete_bord", id);
		sqlsession.close();
		return cnt;
	}
	
	
}
