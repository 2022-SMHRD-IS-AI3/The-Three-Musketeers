package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.boardDAO;
import com.smhrd.model.boardDTO;
import com.smhrd.model.msgDAO;
import com.smhrd.model.msgDTO;


public class send_msgcon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
			

//		String send_id = request.getParameter("send_id");
		String send_id = "asdf";
		String accept_id = request.getParameter("msg_send");
		String msg_content = request.getParameter("msg_content");
		
		System.out.println(send_id);
		System.out.println(accept_id);
		System.out.println(msg_content);
		
		msgDTO dto = new msgDTO(send_id, accept_id, msg_content);
		msgDAO dao = new msgDAO();
		
		int cnt = dao.send_msg(dto);
		
		if(cnt > 0) {
			System.out.println("메시지 전송 성공!");
			response.sendRedirect("msg.jsp");
		}else {
			System.out.println("메시지 전송 실패!");
			
		}
		
	}

}
