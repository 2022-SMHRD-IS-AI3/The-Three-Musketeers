package com.smhrd.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.memberDAO;
import com.smhrd.model.memberDTO;
import com.smhrd.model.pollDAO;
import com.smhrd.model.pollDTO;

public class upload_pollcon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String vote_title = request.getParameter("vote_title");
		String[] vote_content_arr = request.getParameterValues("vote_content");
		int overlap = Integer.parseInt(request.getParameter("overlap"));
		String id = request.getParameter("id");
		String vote_content = Arrays.toString(vote_content_arr);
		
		System.out.println(vote_title);
		System.out.println(vote_content);
		System.out.println(overlap);
		System.out.println(id);
		
		pollDTO dto = new pollDTO(0, vote_title, vote_content, overlap, id);
		pollDAO dao = new pollDAO();
		int cnt = dao.upload_poll(dto);  
		if(cnt > 0) {
			System.out.println("투표작성 성공!");
			response.sendRedirect("poll_list.jsp");
		}else {
			System.out.println("투표작성 실패!");
			
		}
		
	}

}
