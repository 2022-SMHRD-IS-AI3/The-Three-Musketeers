<%@page import="com.smhrd.model.pollDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.pollDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	display: table;
	clear: both;
	width: auto;
	border-collapse: collapse;
	vertical-align: middle;
}

th {
	border-color: #333333;
	background: #fcfcfc;
	padding: 10px 0 10px 0;
	text-align: center;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
}

.btn {
	background-color: #86acd9;
	color: #fff;
	border: 1px solid #86acd9;
	width: 80px;
	height: 30px;
	font-size: 15px;
	border-radius: 4px;
}
</style>
</head>
<body>
<% 
		int vote_nums = Integer.parseInt(request.getParameter("vote_nums")); 
		System.out.println(vote_nums);
		pollDTO dto = new pollDTO(vote_nums);
		pollDAO dao = new pollDAO();
		
		pollDTO vote_content = dao.selectone_poll(dto);
	%>
	<div align="center">
		<br />
		<h2>투표 리스트</h2>

		<hr width="100%" />
		<table>
			<tr>
				<td>
					<table border="1">
						<tr>
							<th width="50">번호</th>
							<th width="250">질문</th>
							<th width="200">작성자</th>
						</tr>

						<tr align="center">
						<% 
    				pollDAO dao = new pollDAO();
    				List<pollDTO> dto_array= dao.selectAll_poll();
    				for(int i = 0;i<dto_array.size(); i++){
    					%>
						<td><%=dto_array.get(i).getVote_num()%></td>
						<td><a href="poll.jsp?vote_nums=<%=dto_array.get(i).getVote_num() %>"><%=dto_array.get(i).getVote_title().toString()%></a></td>
						<td><%=dto_array.get(i).getId().toString()%></td>
					</tr>
					
					<%}%>
			
					</table>
				</td>
			</tr>
			<tr>
				<td align="center" padding="20px">
				<a href="poll_make.jsp"><button class="btn">투표작성</button></a></td>
			</tr>
		</table>
	</div>
</body>
</html>