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
.pl {
	width: 300px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 5px;
	padding: 12px 13px;
	font-family: 'Roboto';
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
	margin-top: 4%
}

.pl:focus {
	border: 1px solid rgba(30, 30, 30, .5);
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid rgba(30, 30, 30, .5);
	border-radius: 10px;
}

table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
	width: 500px;
}

table.table2 tr {
	width: 500px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
	width: 300px;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

.btn {
	background-color: #86acd9;
	color: #fff;
	border: 1px solid #86acd9;
	width: 100px;
	height: 50px;
	font-size: 18px;
	border-radius: 4px;
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

	<form>

		<table style="padding-top:50px; align:center; width:1020px; border:0; cellpadding:2;">
			<tr>
				<td height=50 align=center bgcolor=#86acd9
					style="border-radius: 4px;"><font size=3px color=white><%=board_content.getCategory() %></font></td>
			</tr>
			<tr>
				<td bgcolor=white>
					<table class="table2">
						<tr>
							<td>
							<span style="text-align: left; font-size: 20px; width: 650px;"><%=board_content.getBoard_title() %></span>							
							<span style="text-align: right; font-size: 15px; width: 200px; float: right; align-content:center;"><%=board_content.getId() %></span>
							<span style="text-align: right; font-size: 15px; width: 200px; float: right; align-content:center;"><%=board_content.getBoard_datetime() %></span>
							</td>
						</tr>
						<tr>
							<td><div style="position: relative; width: 1020px; height: 400px;">
									<span style="position: absolute; text-align: left; font-size: 15px; white-space: normal;">
									 <img alt="안나와!" src="./file/<%=board_content.getBoard_photo() %>"> <br> <%=board_content.getBoard_content() %></span>
								</div></td>
						</tr>
					</table>
					<center>
                    	<button class="btn" type="button" onclick = "location.href='board.jsp'">목록으로</button>
                    </center>
				</td>
			</tr>
		</table>

		
	</form>

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
				<% memberDTO info = (memberDTO)session.getAttribute("info");%>
                <input style="display: none" type="text" value="<%=info.getId() %>" name="id">
                <input style="display: none" type="text" value="<%=board_content.getBoard_num() %>" name="board_num">
			</form>
		</div>
	</div>

	<% 
	commentDAO dao_com = new commentDAO();
	List<commentDTO> dto_com_array= dao_com.selectAll_comment();
	 %>
	<!-- Single comment-->
	<!-- <div class="media mb-4"> -->

	<div class="d-flex justify-content-between align-items-center">
		<div class="justify-content-between align-items-center">
 			<%for(int i = 0; i<dto_com_array.size();i++){
				if(dto_com_array.get(i).getBoard_num() == board_nums){%>

			<div class="ml-2">
				<div class="h5 m-0">
					<a href="" style="color: blue;"><%=dto_com_array.get(i).getId() %></a>
				</div>
				<h5 class="mt-0"><%=dto_com_array.get(i).getCom_content() %></h5>
			</div>
			<%}} %>
		</div>
	</div>
</body>

</html>