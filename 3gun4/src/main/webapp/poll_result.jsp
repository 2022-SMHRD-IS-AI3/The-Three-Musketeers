<%@page import="com.smhrd.model.result_pollDTO"%>
<%@page import="com.smhrd.model.pollDAO"%>
<%@page import="java.util.List"%>
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
	String[] vote_content_arr = repl_vote_content.split(",");
%>
	<div align="center">
		<br />
		<h2>투표 결과</h2>
		<hr width="auto" />
		<form name="frm" method="post" action="">
		<table border="1" width="auto">
			<tr>
				<th colspan="2" width="50"><b>질문 : <%=vote_content.getVote_title() %></b></th>

			</tr>
			<tr>
				<td><b>총 투표자 수</b></td>
				<td width="100"><b>(%)</b></td>
			</tr>
			<tr>
				<td><b>항목</b></td>
				<td width="100">
				<% for(int i=0; i<vote_content_arr.length ; i++){ %>
				<b><%=vote_content_arr[i]%>(%)</b><br>
				<%} %></td>
				
			</tr>

		</table>
			</form>
<tr>

		<a href="poll.jsp?vote_nums=<%=vote_nums %>"><button class="btn" >다시투표</button></a> 
		<a href="poll_list.jsp"><button class="btn">닫기</button></a>
	</tr>
	</div>

</body>
</html>