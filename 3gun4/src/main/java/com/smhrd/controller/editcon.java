package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.memberDAO;
import com.smhrd.model.memberDTO;

public class editcon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phonenum = request.getParameter("phonenum");
		String class_name = request.getParameter("class_name");
	
		memberDTO dto = new memberDTO(id, pw, name, phonenum, class_name);
		
		memberDAO dao = new memberDAO();
		int cnt = dao.update(dto);
		
		if(cnt>0) {
			System.out.println("회원정보수정 성공");
			HttpSession session = request.getSession();
			session.setAttribute("info", dto);
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("회원정보수정 실패");
			response.sendRedirect("edit_fail.jsp");
		}
		
		
	}

}
