package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Arrays;

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
		System.out.println("[pollcon]");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int vote_num = Integer.parseInt(request.getParameter("vote_num"));
		
		String[] vote_content = request.getParameterValues("vote_content");
		String id = request.getParameter("id");
		
		
		System.out.println(vote_num);
		System.out.println(Arrays.toString(vote_content));
		System.out.println(id);
		
		for(int i=0; i<vote_content.length;i++) {
			System.out.println(vote_content[i]);
		}
		
		result_pollDTO dto = new result_pollDTO(vote_num,Arrays.toString(vote_content), id);
		pollDAO dao = new pollDAO();
		int sel_cnt = dao.overcheck(dto);
		
		if(sel_cnt >0) {
			
			 PrintWriter writer = response.getWriter(); writer.
			 println("<script>alert('이미 해당 투표를 했습니다.'); location.href='poll_result.jsp?vote_nums="+vote_num+"';</script>"); writer.close();
			 
		}else {
			int cnt = dao.update_poll(dto);
			if(cnt > 0) {
				System.out.println("투표 성공!");
				response.sendRedirect("poll_result.jsp?vote_nums="+vote_num);
			}else {
				System.out.println("투표 실패!");
				
			}
			
		}
		
			
	
}

}

