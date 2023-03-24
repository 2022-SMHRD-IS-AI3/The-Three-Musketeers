package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.memberDAO;

public class deletecon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
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
