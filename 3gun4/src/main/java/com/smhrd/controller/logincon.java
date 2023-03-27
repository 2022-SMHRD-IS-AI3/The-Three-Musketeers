package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.memberDAO;
import com.smhrd.model.memberDTO;

import oracle.net.ns.SessionAtts;

public class logincon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		memberDTO dto = new memberDTO(id, pw);
		memberDAO dao = new memberDAO();

		memberDTO loginDTO = dao.login(dto);
		
		
		
		if (loginDTO != null) {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("info", loginDTO);
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("로그인 실패");
			
			response.sendRedirect("login_fail.jsp");
		}
	}

}
