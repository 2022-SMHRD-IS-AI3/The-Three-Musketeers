package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.boardDAO;
import com.smhrd.model.msgDAO;

public class msg_del_con extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int msg_num = Integer.parseInt(request.getParameter("msg_num"));
		msgDAO dao = new msgDAO();
		int cnt = dao.delete_msg(msg_num);
		
		response.sendRedirect("msg.jsp?page=1");
	
	
	
	}

}
