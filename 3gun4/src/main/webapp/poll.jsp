<%@page import="com.smhrd.model.result_pollDTO"%>
<%@page import="com.smhrd.model.pollDAO"%>
<%@page import="com.smhrd.model.memberDTO"%>
<%@page import="com.smhrd.model.pollDTO"%>
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
	border-top: 1px solid #444444;
	border-collapse: collapse;
	vertical-align: middle;
}

th {
	border-color: #333333;
	background: #fcfcfc;
	padding: 10px 0 10px 0;
	text-align: center;
	border-top-width: 1px;
	border-bottom-width: 2px;
	border-top-style: solid;
	border-bottom-style: solid;
}

td {
	border-color: #333333;
	text-align: center;
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
		pollDTO dto = new pollDTO(vote_nums);
		pollDAO dao = new pollDAO();
		
		pollDTO vote_content = dao.selectone_poll(dto);
		String repl_vote_content = vote_content.getVote_content().replaceAll("\\[", " ");
		repl_vote_content = repl_vote_content.replaceAll("\\]", "");
		repl_vote_content = repl_vote_content.replaceAll(" ", "");
		String[] vote_content_arr = repl_vote_content.split(",");
		System.out.println("Test123 "+vote_content_arr.length);
		
		
		session.setAttribute("content_arr", vote_content_arr);

	%>
	<div align="center">
		<br /> <b>투표</b>
		<hr width="auto" />
		<form name="frm" method="post" action="pollcon">
			<table border="1" width="100px">
				<tr>
					<th width="40px"><b>질문</b></th>
					<th colspan="2" width="60px"><span><%=vote_content.getVote_title()%></span></th>
				</tr>
				<tr>
					<td rowspan="8"><b>항목</b></td>
					<td style="text-align: left">
					<% for(int i=0; i<vote_content_arr.length ; i++){ %>
					<input type="<% if (vote_content.getOverlap() == 0) { %>radio<% } else { %>checkbox<% } %>" name="vote_content" value="<%= vote_content_arr[i]%>"><span><%=vote_content_arr[i] %></span><br>
					<%} %>
					</td>
				</tr>
			</table>
			<tr>
				<td colspan=3>
				<button class="btn" type="submit">투표하기</button>
			    <button class="btn" type="button" onclick="location.href='poll_list.jsp'" >뒤로가기</button></td>
			</tr>
				<% memberDTO info = (memberDTO)session.getAttribute("info");%>
                    <input style="display: none" type="text" value="<%=info.getId() %>" name="id">
                    <input style="display: none" type="text" value="<%=vote_nums %>" name="vote_num">
		</form>
	</div>
</body>
</html>