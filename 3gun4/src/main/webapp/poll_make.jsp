<%@page import="com.smhrd.model.boardDAO"%>
<%@page import="com.smhrd.model.pollDAO"%>
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
	clear: both;
	width: auto;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	vertical-align: middle;
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
		<br /> <b>투표작성</b>
		<hr width="auto" />
		<form name="frm" method="post" action="upload_pollcon">
			<table border="1" width="100px">
				<tr>
					<td><b>질문</b></td>
					<td colspan="2"><input name="vote_title" size="17"></td>
				</tr>
				<tr>
					<td rowspan="6"><b>항목</b></td>
					<td class="a" style='text-align: center;'>1</td>
					<td class="a" id='cont_box'><input type='text' name="vote_content" id="content" style='width: 100px'></td>
				</tr>

				<tr>
					<td colspan='2' style='text-align: center;'>
					<span onclick="addRow()">항목 추가</span> 
					<span href="#" onclick="delRow()">항목 삭제</span>
					</td>
				</tr>

				<tr>
					<td>복수</td>
					<td colspan=2>
					<input type="radio" name="overlap" value="1" checked>yes 
					<input type="radio" name="overlap" value="0">no
					</td>
				</tr>
			<!-- 	<tr>
					<td>익명</td>
					<td colspan=2>
					<input type="radio" name="anonymity" value="1" checked>yes 
					<input type="radio" name="anonymity" value="0">no
					</td>
				</tr> -->
			</table>
			<tr>
				<td colspan="3">
					<button class="btn" type="submit">작성하기</button> 
					<button class="btn" type="button" onclick = "location.href='poll_list.jsp'">리스트</button>
				</td>
			</tr>
					<% memberDTO info = (memberDTO)session.getAttribute("info");%>
                    <input style="display: none" type="text" value="<%=info.getId() %>" name="id">
		</form>
	</div>
	<script>
		function addRow() {
			var table = document.querySelector("table"); // 테이블 요소 선택
			var rowCount = table.rows.length; // 테이블의 행 개수

			if (rowCount > 7) {
				alert("최대 5개까지 추가할 수 있습니다!")
				return;
			}
			
			
			var row = table.insertRow(rowCount - 2); // 새로운 행 추가
			// 새로운 셀 추가
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);

			// 행 번호 표시 셀 추가
			cell1.className = "a";
			cell1.style.textAlign = "center";
			cell1.innerHTML = rowCount - 2;

			// 입력 필드 셀 추가
			cell2.className = "a";
			cell2.innerHTML = "<input type='text' name='vote_content' id='content' style='width: 100px'>";

		}

		function delRow() {
			var table = document.querySelector("table"); // 테이블 요소 선택
			var rowCount = table.rows.length; // 테이블의 행 개수

			// 마지막 행 삭제
			if (rowCount <= 4) { // 최소 1개 이상의 입력 필드가 있도록 제한
				alert("더 이상 삭제할 수 없습니다.");
				return;
			}
			table.deleteRow(rowCount - 3);
		}
	</script>

</body>
</html>