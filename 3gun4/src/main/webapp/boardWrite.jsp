<%@page import="com.smhrd.model.memberDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
select {
  box-sizing: border-box;
  height:50px;
  width: 340px;
  padding: 4px;
  font-size: 20px;
  border-radius: 6px;
  color: #fff;
  background-color:#FFFFFF11;
  border-style: solid;
}
table {
	border-collapse: collapse;
	width: 100%;
}
.opt_name{
	background-color: black;
	max-height: 100px; /* 스크롤바 최대 높이 설정 */
  	overflow-y: auto;
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
.pl{
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
      }

      .pl:focus{
          border: 1px solid rgba(30,30,30,.5);
          box-sizing: border-box;
          border-radius: 10px;
          outline: 3px solid rgba(30,30,30,.5);
          border-radius: 10px;
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

.login-box form a {
  position: relative;
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 5px;
  letter-spacing: 4px
}

.login-box a:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
}

.login-box a span {
  position: absolute;
  display: block;
}

.login-box a span:nth-child(1) {
  top: 0;
  left: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, #03e9f4);
  animation: btn-anim1 1s linear infinite;
}

@keyframes btn-anim1 {
  0% {
    left: -100%;
  }
  50%,100% {
    left: 100%;
  }
}

.login-box a span:nth-child(2) {
  top: -100%;
  right: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(180deg, transparent, #03e9f4);
  animation: btn-anim2 1s linear infinite;
  animation-delay: .25s
}

@keyframes btn-anim2 {
  0% {
    top: -100%;
  }
  50%,100% {
    top: 100%;
  }
}

.login-box a span:nth-child(3) {
  bottom: 0;
  right: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(270deg, transparent, #03e9f4);
  animation: btn-anim3 1s linear infinite;
  animation-delay: .5s
}

@keyframes btn-anim3 {
  0% {
    right: -100%;
  }
  50%,100% {
    right: 100%;
  }
}

.login-box a span:nth-child(4) {
  bottom: -100%;
  left: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(360deg, transparent, #03e9f4);
  animation: btn-anim4 1s linear infinite;
  animation-delay: .75s
}

@keyframes btn-anim4 {
  0% {
    bottom: -100%;
  }
  50%,100% {
    bottom: 100%;
  }
}
</style>
</head>
<body>
	<form action="upload_boardcon" method="POST"
		enctype="multipart/form-data" id="frm">
		<h2 style="color: #fff;">글쓰기</h2>
			
					<table style="color: #fff">
						<tr>
							<td width="70px" style="text-align: center;"><strong>카테고리</strong></td>
							<td><select name="category" >
									<option class="opt_name" value="0" selected>게시판 종류</option>
									<option class="opt_name" value="공지">공지</option>
									<option class="opt_name" value="실습">실습</option>
									<option class="opt_name"  value="식당후기">식당후기</option>
							</select></td>
							<td width="100px"><input name="board_photo" type="file"
								style="float: right; align-content: center;"> <label></label>
							</td>
						</tr>
						<tr>
							<td style="text-align: center;"><strong>제목</strong></td>
							<td colspan="2"><input type=text name="board_title" style="background-color:#FFFFFF11;width: 100%; height: 30px;color: #fff; font-size: 20px"></td>
						</tr>

						<tr>
							<td style="text-align: center;"><strong>내용</strong></td>
							<td colspan="2"><textarea name="board_content" rows=30 style="background-color:#FFFFFF11;width: 100%; color: #fff; font-size: 18px"></textarea></td>
						</tr>

					</table>
					
				
   			<input style="display: none" type="submit" id="login_btn">
		
					
		<%
		memberDTO info = (memberDTO) session.getAttribute("info");
		%>
		<input style="display: none" type="text" value="<%=info.getId()%>"
			name="id">
	</form>
	<center>
            <div class="login-box">
            <form id="frm">
           	 <a href="#" onclick="return chk_form()">
     		<span></span>
    		<span></span>
      		<span></span>
      		<span></span>
      		작성완료
   			</a>
           	 <a href="board.jsp">
     		<span></span>
    		<span></span>
      		<span></span>
      		<span></span>
      		목록으로
   			</a>
   			</form>
            </div>
            </center>
<script>
function chk_form() {
document.getElementById('login_btn').click();
}
</script>
</body>
</html>