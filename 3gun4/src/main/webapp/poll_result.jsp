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
a{
margin-top: 10px;
}

</style>
</head>
<body>
	<div align="center">
		<br />
		<h2>투표 결과</h2>
		<table border="1" width="auto">
			<tr>
				<th colspan="4"><b>질문 : </b></th>
			</tr>
			<tr>
				<td colspan="3"><b>총 투표자 : </b></td>
				<td width="40"><b>(%)</b></td>
			</tr>
			<tr>
				<td><b>항목 :</b></td>
				<td width="40"><b>(%)</b></td>
			</tr>

		</table>
	</div>
<div>
		<a href="poll.jsp"><button class="btn">다시투표</button></a> 
		<a href="poll_list.jsp"><button class="btn">닫기</button></a>
		</div>
</body>
</html>