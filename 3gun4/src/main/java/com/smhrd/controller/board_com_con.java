package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.commentDAO;
import com.smhrd.model.commentDTO;

public class board_com_con extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String com_content = request.getParameter("com_content");
	String id = request.getParameter("id");
	int board_num = Integer.parseInt(request.getParameter("board_num"));
	
	commentDTO dto = new commentDTO(0, board_num, com_content, null, id);
	int cnt = new commentDAO().upload_com(dto);
	
	if(cnt > 0) {
		System.out.println("댓글달기성공");
		response.sendRedirect("boardDetail.jsp?board_nums="+board_num);
	}else {
		System.out.println("댓글달기실패");
	}
	
	}


}
