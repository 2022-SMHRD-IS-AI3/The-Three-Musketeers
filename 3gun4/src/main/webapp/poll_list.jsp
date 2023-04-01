<%@page import="com.smhrd.model.pollDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.pollDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	<div class="container managergrounp" id="container" name="container" style="width: 100%;">
		<br />
		<h2 style="color: #FFF">투표 리스트</h2>

		<hr width="100%" />

		<table class="bbsList" summary="" style="color: #000; width: 100%">
			<thead class="head">
				<tr>
					<th style="width: 50; background: #ffffff11; color: white;">번호</th>
					<th style="width: 250; background: #ffffff11; color: white;">질문</th>
					<th style="width: 200; background: #ffffff11; color: white;">작성자</th>
				</tr>
			</thead>
			<tbody class="body" style="color: #fff">
				<tr style="background-color: none">
					<%
					pollDAO dao = new pollDAO();
					List<pollDTO> dto_array = dao.selectAll_poll();
					for (int i = 0; i < dto_array.size(); i++) {
					%>
					<td align="center"><%=dto_array.get(i).getVote_num()%></td>
					<td align="center"><a
						href="poll.jsp?vote_nums=<%=dto_array.get(i).getVote_num()%>"><%=dto_array.get(i).getVote_title().toString()%></a></td>
					<td align="center"><%=dto_array.get(i).getId().toString()%></td>
				</tr>

				<%
				}
				%>
			</tbody>

		</table>
		<center>
			<div class="login-box">
				<form id="frm">
					<table>
						<tr>
							<td>
							<a href="poll_make.jsp"> 
							<span></span> 
							<span></span>
							<span></span> 
							<span></span>
									투표작성
							</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</center>
	</div>
</body>
</html>