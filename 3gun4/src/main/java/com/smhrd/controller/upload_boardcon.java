package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.boardDAO;
import com.smhrd.model.boardDTO;

public class upload_boardcon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String path = request.getServletContext().getRealPath("file");
		System.out.println(path);
		
		int maxSize = 10*1024*1024;
		
		String encoding = "UTF-8";
		
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
		
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		String board_photo = request.getParameter("board_photo");
		String board_photo_en = URLEncoder.encode(board_photo, "UTF-8");
		String category = request.getParameter("category");
		String id = request.getParameter("id");
	
		boardDTO dto = new boardDTO(0, board_title, board_content, board_photo_en, null, category, id);
		
		int cnt = new boardDAO().upload(dto);
		
		HttpSession session = request.getSession();
		session.setAttribute("info", boardDTO);
		response.sendRedirect("main.jsp");
		
		if(cnt > 0) {
			System.out.println("업로드 성공");
		}else {
			System.out.println("업로드 실패");
		}
		
	
	
	
	
	
	
	
	}

}
