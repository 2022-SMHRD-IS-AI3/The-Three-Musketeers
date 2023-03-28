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
                clear:both; 
                width:auto;
                border-top: 1px solid #444444;
                border-collapse: collapse; 
                vertical-align: middle;
              }
  td{ 
                border-color:#333333; 
                text-align:center; 
                border-top-style: solid;
                border-bottom-style: solid;
             }
              .btn {
        	background-color:#86acd9;
        	color:#fff;
        	border: 1px solid #86acd9;
        	width: 80px;
        	height: 30px;
        	font-size: 15px;
        	border-radius: 4px;
        }
        a{
        padding:10px
        }
</style>
</head>
<body>
	<div align="center">
		<br /> <b>투표작성</b>
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
						out.println("<td style='text-align: center;'>" + (i) + "<td><input type='text' name='item' style='width: 100px'></td></td>");
						out.println("</tr>");
					} //for end
					%>
				
				<tr>
					<td>복수</td>
					<td colspan=2>
					<input type="radio" name="overlap" value="1" checked>yes 
						<input type="radio" name="overlap" value="0">no
					</td>
				</tr>
				<tr>
					<td>익명</td>
					<td colspan=2>
					<input type="radio" name="type" value="1" checked>yes 
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
			</table>
				<tr>
					<a href="poll_list.jsp"><button class="btn">작성하기</button></a>
					 <a href="poll_list.jsp"><button class="btn">리스트</button></a>
				</tr>
		</form>
	</div>
</body>
</html>