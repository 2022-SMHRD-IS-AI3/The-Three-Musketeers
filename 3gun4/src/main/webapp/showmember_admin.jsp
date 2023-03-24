<%@page import="com.smhrd.model.memberDTO"%>
<%@page import="com.smhrd.model.memberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	memberDAO dao = new memberDAO();
	List<memberDTO> list = dao.selectAll();
%>
<body style="text-align: center;">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<caption><h2>회원관리페이지</h2></caption>
							<tr>
								<td>아이디</td>
								<td>이름</td>
								<td>전화번호</td>							
							</tr>
							<% for(int i=0; i<list.size();i++){%>
								<tr>
									<td><%=list.get(i).getId()() %></td>
									<td><%=list.get(i).getName() %></td>
									<td><%=list.get(i).getPhonenum() %></td>
									<td><a href="DeleteCon?email=<%=list.get(i).getId()%>">회원삭제</a></td>
								</tr>
							<%} %>
						</table>
					</nav>		
					<a href="main.jsp" class="button next scrolly">되돌아가기</a>	
			</div>

</body>
</html>