package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.boardDAO;

public class delete_boardcon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String board_num = request.getParameter("board_num");
		
		boardDAO dao = new boardDAO();
		int cnt = dao.delete(board_num);
	
		if(cnt>0) {
			System.out.println(board_num + "회원삭제 완료!");
		}else {
			System.out.println("회원삭제 실패!");
		}
		response.sendRedirect("board_admin.jsp");
	
	}

}
