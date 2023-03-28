<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<br /> <b>투표</b>
		<hr width="auto" />
		<form name="frm" method="post" action="poll_list.jsp">
			<table border="1" width="100px">
				<tr>
					<td><b>질문</b></td>
					<td colspan="2"><input name="question" size="17"></td>
				</tr>
				<tr>
					<td rowspan="10"><b>항목</b></td>
					<%
					for (int i = 1; i <= 4; i++) {
						out.println("<td style='text-align: center;'>" + (i) + "<td><input type='radio' name='item' style='width: 100px'></td></td>");
						out.println("</tr>");
					} //for end
					%>
				</tr>
				<tr>
					<td colspan=3><a href="poll_result.jsp"><input type="button" value="투표하기"></a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>