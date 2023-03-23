package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.memberDAO;
import com.smhrd.model.memberDTO;

public class joincon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phonenum = request.getParameter("phonenum");
		String class_name = request.getParameter("class_name");
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(class_name);
		System.out.println(phonenum);
		
		memberDTO dto = new memberDTO(id, pw, name, phonenum, class_name);
		memberDAO dao = new memberDAO();
		int cnt = dao.join(dto);
		
		if(cnt > 0) {
			System.out.println("회원가입 성공!");
			response.sendRedirect("join.jsp");
		}else {
			System.out.println("회원가입 실패!");
			
		}
	}

}
