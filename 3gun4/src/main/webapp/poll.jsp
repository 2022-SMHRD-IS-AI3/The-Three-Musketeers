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

	<div align="center">
		<br /> <b>투표</b>
		<hr width="auto" />
		<form name="frm" method="post" action="poll_list.jsp">
			<table border="1" width="100px">
				<tr>
					<th><b>질문</b></th>
					<th colspan="2"><span></span></th>
				</tr>
				<tr>
					<td rowspan="8"><b>항목</b></td>
					<span></span>
				</tr>
			</table>
			<tr>
				<td colspan=3>
				<button class="btn" type="button" onclick = "location.href='poll_result.jsp'">투표하기</button>
			    <a href="poll_list.jsp"><button class="btn">뒤로가기</button></a></td>
			</tr>
		
		</form>
	</div>
</body>
</html>