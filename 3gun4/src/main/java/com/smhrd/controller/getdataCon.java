package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.scheduleDAO;
import com.smhrd.model.scheduleDTO;

public class getdataCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[getdataCon]");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		scheduleDAO dao = new scheduleDAO();
		List<scheduleDTO> dto_arr = dao.selectAll_sch();
		
		JSONArray jsonarray = new JSONArray();
		for (int i = 0; i < dto_arr.size(); i++) {
			JSONObject json = new JSONObject();
			
			json.put("id",dto_arr.get(i).getSchedule_code());
			json.put("title",dto_arr.get(i).getClass_name());
			json.put("start",dto_arr.get(i).getStart_date());
			json.put("end",dto_arr.get(i).getEnd_date());
			json.put("allDay",dto_arr.get(i).getAllday());
			
			if(dto_arr.get(i).getClass_name().equals("자바")) {
				json.put("backgroundColor","#ffafb0");
			}else if(dto_arr.get(i).getClass_name().equals("파이썬")) {
				json.put("backgroundColor","#ffafd8");
			}else if(dto_arr.get(i).getClass_name().equals("파이썬 라이브러리")) {
				json.put("backgroundColor","#eeb7b4");
			}else if(dto_arr.get(i).getClass_name().equals("크롤링")) {
				json.put("backgroundColor","#f2cfa5");
			}else if(dto_arr.get(i).getClass_name().equals("HTML/CSS")) {
				json.put("backgroundColor","#fcffb0");
			}else if(dto_arr.get(i).getClass_name().equals("JSP/Servlet")) {
				json.put("backgroundColor","#aee4ff");
			}else if(dto_arr.get(i).getClass_name().equals("Javascript")) {
				json.put("backgroundColor","#b5c7ed");
			}else if(dto_arr.get(i).getClass_name().equals("즐거운 핵심 프로젝트")) {
				json.put("backgroundColor","#c4f4fe");
			}else if(dto_arr.get(i).getClass_name().equals("라즈베리파이")) {
				json.put("backgroundColor","#bee9b4");
			}else if(dto_arr.get(i).getClass_name().equals("아두이노")) {
				json.put("backgroundColor","#fdfa87");
			}else if(dto_arr.get(i).getClass_name().equals("머신러닝")) {
				json.put("backgroundColor","#fcc6f7");
			}else if(dto_arr.get(i).getClass_name().equals("딥러닝")) {
				json.put("backgroundColor","#caa6fe");
			}else if(dto_arr.get(i).getClass_name().equals("안드로이드")) {
				json.put("backgroundColor","#ffafd8");
			}else if(dto_arr.get(i).getClass_name().equals("Spring")) {
				json.put("backgroundColor","#afffba");
			}else if(dto_arr.get(i).getClass_name().equals("React.js")) {
				json.put("backgroundColor","#e2ffaf");
			}else if(dto_arr.get(i).getClass_name().equals("Node.js")) {
				json.put("backgroundColor","#83a7a3");
			}else if(dto_arr.get(i).getClass_name().equals("하둡")) {
				json.put("backgroundColor","#acb890");
			}else if(dto_arr.get(i).getClass_name().equals("시험")) {
				json.put("backgroundColor","#ff3232");
			}else if(dto_arr.get(i).getClass_name().equals("멘토링")) {
				json.put("backgroundColor","#c3927a");
			}else if(dto_arr.get(i).getClass_name().equals("특강")) {
				json.put("backgroundColor","#bb8e61");
			}else if(dto_arr.get(i).getClass_name().equals("즐거운휴일")) {
				json.put("backgroundColor","#dfd4e4");
			}
			json.put("textColor","#000");
			System.out.println("-------------------");
			System.out.println(json.toString());
			
			jsonarray.put(json);
		}
			
			PrintWriter out = response.getWriter();
			out.print(jsonarray);
		
	}

}
