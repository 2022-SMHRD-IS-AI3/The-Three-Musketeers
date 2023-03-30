package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.scheduleDAO;
import com.smhrd.model.scheduleDTO;


public class savedataCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String alldata = request.getParameter("alldata"); // string으로 받아온거저장
		
		JSONArray jsonarray = new JSONArray(alldata); // jsonarray로 변환
		System.out.println(jsonarray.toString());
		scheduleDAO dao = new scheduleDAO();
		dao.delete_all();
		
		for(int i=0; i < jsonarray.length(); i++) {
			JSONObject obj =jsonarray.getJSONObject(i);  //jsonarray에 있는 i번쨰 데이터 obj에 Jsonobject형식으로 저장
			
			String title = obj.get("title").toString(); //title에 obj에 있는 title 키의 값 가져오기
			String start = obj.get("start").toString();
			String end = obj.get("end").toString();
			String allday = obj.get("allday").toString();
			
			scheduleDTO dto = new scheduleDTO(0,title,start,end,allday);
			
			dao.insert_all(dto);
		}
		
			PrintWriter out = response.getWriter();
			out.print("SAVE OK!!");
	}

}
