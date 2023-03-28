<%@page import="com.smhrd.model.memberDTO"%>
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
</style>
<script>
		function addBox() {
			var box = document.createElement("div");
			box.innerHTML = "<input type='text'>";
			document.getElementById("container").appendChild(box);
		}
	</script>
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
					<td rowspan="6"><b>항목</b></td>
				<td style='text-align: center;'>1</td>
				<td><input type='text' name='item' style='width: 100px'></td>
				</tr>
				<% for (int i = 2; i <= 5; i++) { %>
				<tr id='row<%= i %>' style='display:none;'>
					<td style='text-align: center;'><%= i %></td>
					<td><input type='text' name='item' style='width: 100px'></td>
				</tr>
				<% } %>
				<tr>
					<td colspan='2' style='text-align: center;'><a href='#' onclick='addRow(); return false;'>항목 추가</a></td>
				</tr>
				
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
					<td colspan="3">
					<button class="btn" type="submit">작성하기</button>
					 <a href="poll_list.jsp"><button class="btn">리스트</button></a>
					 </td>
				</tr>
					<%-- <% memberDTO info = (memberDTO)session.getAttribute("info");%>
                    <input style="display: none" type="text" value="<%=info.getId() %>" name="id"> --%>
		</form>
	</div>
	<script>
		var index = 2;
		function addRow() {
			document.getElementById('row'+index).style.display = '';
			index++;
			if (index > 5) {
				alert("최대 5개의 항목을 추가할 수 있습니다.");
			}
		}
	</script>
</body>
</html>