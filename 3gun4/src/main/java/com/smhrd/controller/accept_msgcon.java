package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.memberDTO;
import com.smhrd.model.msgDAO;
import com.smhrd.model.msgDTO;


public class accept_msgcon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		memberDTO info = (memberDTO)session.getAttribute("info");
	
		msgDAO dao = new msgDAO();
		List<msgDTO> cnt = dao.selectAll_msg(info.getId());
		
		if(cnt != null) {
			RequestDispatcher rd = request.getRequestDispatcher("msg.jsp");
			request.setAttribute("msglist", cnt);
		    rd.forward(request, response);
		}else {
			System.out.println("메시지함 실패!");
			
		}
		
	}
}

