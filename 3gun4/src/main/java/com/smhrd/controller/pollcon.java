package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.pollDAO;
import com.smhrd.model.pollDTO;
import com.smhrd.model.result_pollDTO;

public class pollcon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int vote_num = Integer.parseInt(request.getParameter("vote_num"));
		String vote_content = request.getParameter("vote_content");
		String id = request.getParameter("id");
		int count = Integer.parseInt(request.getParameter("count"));
		String vote_result = request.getParameter("vote_result");
		String[] vote_content_arr = vote_content.split(",");
		
		System.out.println(vote_num);
		System.out.println(vote_content);
		System.out.println(id);
		System.out.println(count);
		System.out.println(vote_result);
		System.out.println(vote_content_arr);
		
		for(int i=0; i<vote_content.length();i++) {
			vote_content_arr[i]=vote_content.toString();
			System.out.println(vote_content_arr);
		}
		
		result_pollDTO dto = new result_pollDTO(vote_num, vote_content, id, count, vote_result);
		pollDAO dao = new pollDAO();
		int cnt = dao.update_poll(dto);
		if(cnt > 0) {
			System.out.println("투표 성공!");
			response.sendRedirect("poll_list.jsp");
		}else {
			System.out.println("투표 실패!");
			
		}
		
		
	
}

}

