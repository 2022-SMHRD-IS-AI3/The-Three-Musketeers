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
              th{ 
                border-color:#333333; 
                background: #fcfcfc;
                padding:10px 0 10px 0; 
                text-align:center; 
                border-top-width: 1px;
                border-bottom-width: 2px;
                border-top-style: solid;
                border-bottom-style: solid;
             }
  td{ 
                border-color:#333333; 
                text-align:center; 
                border-top-style: solid;
                border-bottom-style: solid;
             }
             a{
             padding-bottom:10px;
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
					<th colspan="2"><input name="question" size="17"></th>
				</tr>
				<tr>
					<td rowspan="8"><b>항목</b></td>
					<%
					for (int i = 1; i <= 4; i++) {
						out.println("<td style='text-align: center;'>" + (i) + "<td><input type='radio' name='item' style='width: 100px'></td></td>");
						out.println("</tr>");
					} //for end
					%>
				</tr>
			</table>
				<tr>
					<td colspan=3><a href="poll_result.jsp"><button class="btn">투표하기</button></a></td>
				</tr>
		</form>
	</div>
</body>
</html>