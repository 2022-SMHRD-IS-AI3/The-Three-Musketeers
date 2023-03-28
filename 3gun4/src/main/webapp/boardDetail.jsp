<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.commentDAO"%>
<%@page import="com.smhrd.model.commentDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.memberDTO"%>
<%@page import="com.smhrd.model.boardDAO"%>
<%@page import="com.smhrd.model.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

button {
	background-color: #86acd9;
	color: white;
	font-weight: bold;
	font-size: 18px;
	padding: 12px;
	text-align: center;
	border: 0;
}

th {
	background-color: #86acd9;
	border-radius: 4px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	padding: 12px;
	text-align: center;
}

td {
	padding: 12px;
	border: 1px solid #ddd;
}

.board_title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

.board_info {
	font-size: 14px;
	color: #999;
	margin-bottom: 10px;
}

.board_photo {
	max-width: 100%;
	height: auto;
	margin-bottom: 10px;
}

.board_content {
	font-size: 16px;
	line-height: 1.5;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<!-- 부트스트랩 연결 -->
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->

	<link
		href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet"
		integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
		crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
	<%
	int board_nums = Integer.parseInt(request.getParameter("board_nums"));
	System.out.println(board_nums);
	boardDTO dto = new boardDTO(board_nums);
	boardDAO dao = new boardDAO();

	boardDTO board_content = dao.selectone(dto);
	%>
	<table>
		<tr>
			<th colspan="2" style="text-align: center; "><font size=5px
				color=white><%=board_content.getCategory()%></font></th>
		</tr>
		<tr height="5px"></tr>
		<tr>
			<td style="text-align: center;"><span class="board_title"><%=board_content.getBoard_title()%></span></td>
			<td width="25%" style="text-align: right;"><span><%=board_content.getId()%></span><br> <span><%=board_content.getBoard_datetime()%></span></td>
		</tr>
		<tr>
			<td colspan="2"><img alt=""
				src="./file/<%=board_content.getBoard_photo()%>"> <br> <span>
					<%=board_content.getBoard_content()%>
			</span></td>
		</tr>
	</table>
	<tr>
		<center>
			<button type="button" onclick="location.href='board.jsp'" style="border-radius: 8px; margin: 5px;">목록으로</button>
		</center>
	</tr>



	<!-- 댓글 작성-->
	<div class="card mb-2">
		<div class="card-header bg-light" style="color: #86acd9;">
			<i class="fa fa-comment fa" style="color: #86acd9;"></i> 댓글
		</div>
		<div class="card-body">
			<form action="board_com_con">
				<div class="form-group">
					<textarea class="form-control" rows="3" name="com_content"></textarea>

				</div>
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<button class="btn btn-outline-primary" type="submit">작성</button>
						</div>
					</div>
				</div>
				<%
				memberDTO info = (memberDTO) session.getAttribute("info");
				%>
				<input style="display: none" type="text" value="<%=info.getId()%>"
					name="id"> <input style="display: none" type="text"
					value="<%=board_content.getBoard_num()%>" name="board_num">
			</form>
		</div>
	</div>

	<%
	commentDAO dao_com = new commentDAO();
	List<commentDTO> dto_com_array = dao_com.selectAll_comment();
	%>
	<!-- Single comment-->
	<!-- <div class="media mb-4"> -->

	<div class="d-flex justify-content-between align-items-center">
		<div class="justify-content-between align-items-center" style="width: 900px">
			<%
			for (int i = dto_com_array.size()-1; i > 0; i--) {
				if (dto_com_array.get(i).getBoard_num() == board_nums) {
			%>

			<div class="ml-2" style="display: flex;">
				<div class="h5 m-0">
					<a href="" style="color: blue;"><%=dto_com_array.get(i).getId()%>&nbsp&nbsp</a>
				</div>
				<h5 class="mt-0"><%=dto_com_array.get(i).getCom_content()%></h5>
			</div>
			<hr>
			<%
			}
			}
			%>
		</div>
	</div>
</body>

</html>