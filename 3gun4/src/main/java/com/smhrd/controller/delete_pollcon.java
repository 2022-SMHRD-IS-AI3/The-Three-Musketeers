package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.boardDAO;
import com.smhrd.model.pollDAO;

public class delete_pollcon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String vote_num = request.getParameter("vote_num");
		
		pollDAO dao = new pollDAO();
		int cnt = dao.delete_poll(vote_num);
	
		if(cnt>0) {
			System.out.println(vote_num + "투표삭제 완료!");
		}else {
			System.out.println("투표삭제 실패!");
		}
		response.sendRedirect("poll_admin.jsp");
	
	}

}
