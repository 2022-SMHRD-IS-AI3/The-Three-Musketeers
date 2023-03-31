package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class mainDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	public int delete_main() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.delete("delete_main");
		sqlsession.close();
		return cnt;
	}
	public int insert_main(mainDTO dto_main) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("insert_main", dto_main);
		sqlsession.close();
		
		return cnt;
	}
	public mainDTO selectOne_main() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		mainDTO cnt = sqlsession.selectOne("selectOne_main");
		sqlsession.close();
		return cnt;
	}

}
