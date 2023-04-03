<%@page import="com.smhrd.model.result_pollDTO"%>
<%@page import="com.smhrd.model.pollDAO"%>
<%@page import="com.smhrd.model.memberDTO"%>
<%@page import="com.smhrd.model.pollDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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

.opt_name{
   background-color: black;
   max-height: 100px; /* 스크롤바 최대 높이 설정 */
     overflow-y: auto;
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
<% 
		System.out.println("[poll]");
		int vote_nums = Integer.parseInt(request.getParameter("vote_nums")); 
		pollDTO dto = new pollDTO(vote_nums);
		pollDAO dao = new pollDAO();
		
		pollDTO vote_content = dao.selectone_poll(dto);
		String repl_vote_content = vote_content.getVote_content().replaceAll("\\[", " ");
		repl_vote_content = repl_vote_content.replaceAll("\\]", "");
		repl_vote_content = repl_vote_content.replaceAll(" ", "");
		String[] vote_content_arr = repl_vote_content.split(",");
		System.out.println("Test123 "+vote_content_arr.length);
		
		
		session.setAttribute("content_arr", vote_content_arr);

	%>
		<form name="frm" method="post" action="pollcon">
	<table class="bbsList" summary="" style="color:#000; width: auto;">
   <h2 style="color: #FFF">투표 리스트</h2>
   <hr>
			   <thead class="head">
				<tr>
					<th style="color: white; background: #ffffff11" width="40%"><b>질문</b></th>
					<th colspan="2" style="color: white; background: #ffffff11" width="60%"><span><%=vote_content.getVote_title()%></span></th>
				</tr>
				</thead>
				 <tbody class="body" style="color: #fff">

				<tr>
					<td rowspan="8" style="color: white; background: #ffffff11; text-align: center"><b>항목</b></td>
					<td style="text-align: left">
					<% for(int i=0; i<vote_content_arr.length ; i++){ %>
					<input type="<% if (vote_content.getOverlap() == 0) { %>radio<% } else { %>checkbox<% } %>" name="vote_content" value="<%= vote_content_arr[i]%>"><span><%=vote_content_arr[i] %></span><br>
					<%} %>
					</td>
				
				</tr>
			</tbody>
			</table>
			<!-- <tr>
				<td colspan=3>
				<button class="btn" type="submit">투표하기</button>
			    <button class="btn" type="button" onclick="location.href='poll_list.jsp'" >뒤로가기</button></td>
			</tr> -->
			<input style="display: none" type="submit" id="login_btn">
				<% memberDTO info = (memberDTO)session.getAttribute("info");%>
                    <input style="display: none" type="text" value="<%=info.getId() %>" name="id">
                    <input style="display: none" type="text" value="<%=vote_nums %>" name="vote_num">
		</form>
	</div>
	</table>
	<center>
            <div class="login-box">
            <form id="frm">
            <a href="#" onclick="return chk_form()">
     		<span></span>
    		<span></span>
      		<span></span>
      		<span></span>
      		투표
   			</a>
           	 <a href="poll_list.jsp">
     		<span></span>
    		<span></span>
      		<span></span>
      		<span></span>
      		뒤로가기
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