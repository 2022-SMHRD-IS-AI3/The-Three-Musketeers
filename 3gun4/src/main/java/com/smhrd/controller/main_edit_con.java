package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.mainDAO;
import com.smhrd.model.mainDTO;

public class main_edit_con extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String zoom = request.getParameter("zoom");
		String recode = request.getParameter("recode");
		String longtime = request.getParameter("longtime");
		
		mainDAO dao_main = new mainDAO();
		int cnt_main = dao_main.delete_main();
		
		mainDTO dto_main = new mainDTO(zoom, recode, longtime);
		int cnt_main_insert = dao_main.insert_main(dto_main);
		
		response.sendRedirect("main.jsp");
	}

}
