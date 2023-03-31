package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.boardDAO;
import com.smhrd.model.commentDAO;
import com.smhrd.model.memberDAO;
import com.smhrd.model.pollDAO;

public class deletecon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		//투표삭제
		pollDAO dao_poll = new pollDAO();
		int cnt_poll = dao_poll.delete_poll_mem(id);
		
		//댓글삭제
		commentDAO dao_comm = new commentDAO();
		int cnt_comm = dao_comm.delete_comm(id);
		
		//게시물삭제
		boardDAO dao_bord = new boardDAO();
		int cnt_bord = dao_bord.delete_bord(id);
		
		
		
		
		memberDAO dao = new memberDAO();
		
		
		int cnt = dao.delete(id);
		
		if(cnt>0) {
			System.out.println(id + "회원삭제 완료!");
		}else {
			System.out.println("회원삭제 실패!");
		}
		response.sendRedirect("showmember_admin.jsp");
	}

}
