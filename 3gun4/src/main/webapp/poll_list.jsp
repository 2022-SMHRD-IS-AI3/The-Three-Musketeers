<%@page import="com.smhrd.model.memberDAO"%>
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
<link href="code/css/style.css" rel="stylesheet" />
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
<title>Insert title here</title>
<style>
.btn {
	background-color: #86acd9;
	color: #fff;
	border: 1px solid #86acd9;
	width: 100px;
	height: 30px;
	font-size: 13px;
	border-radius: 4px;
}
</style>
</head>
<body>
<% 
    pollDAO dao = new pollDAO();
    List<pollDTO> dto_array= dao.selectAll_poll();
    int page_count = 1;
    memberDAO m_dao = new memberDAO();
	try{
		page_count = Integer.parseInt(request.getParameter("page"));
		System.out.println(page_count);
	}catch(Exception e){
		
	}
    					
%>
<table class="bbsList" summary="" style="color:#000; width: 245px;">
	<h2 style="color: #FFF">투표 리스트</h2>
	<caption>투표 리스트</caption>
	<hr>
	<thead class="head">
	<tr>
		<tr>
			<th style="color: white; background: #ffffff11; width: 10%;">번호</th>
			<th style="color: white; background: #ffffff11; width: 60%;">질문</th>
			<th style="color: white; background: #ffffff11; width: 30%;">작성자</th>
		</tr>
	</tr>
	</thead>
	<tbody class="body" style="color: #fff">
	<% for(int i = dto_array.size()-1; i >=0; i--){ %>
	<tr>
		<td align="center"><%=dto_array.get(i).getVote_num()%></td>
		<td align="center"><a style="color:#fff;" href="poll.jsp?vote_nums=<%=dto_array.get(i).getVote_num() %>"><%=dto_array.get(i).getVote_title().toString()%></a></td>
		<td align="center"><%=m_dao.select_name_bor(dto_array.get(i).getId().toString())%></td>
	</tr>
	<%}%>
	</tbody>
	<tfoot class="foot">
			<tr>
				<td colspan="9" style="border-bottom: none;padding-bottom: 0px">
					<%if(page_count > 3){ %> 
						<a href="msg.jsp?page=1" class="arrow radius-right">≪</a>
					<%}
                            if(page_count <= 3 && page_count >= 1){/* 1~3 */
                           	 	for(int i = 1; i<=dto_array.size()/10+1; i++) {%>
                            		<a style="color: #fff;<%if(page_count==i){%>text-decoration: underline;<%} %>" href="msg.jsp?page=<%=i %>" class="num_box"><%=i %></a>
                            	<%} /* 처음꺼 다뜨기(5개) */ System.out.println("처음꺼 다뜨기(5개)");
                            }
                            else if(dto_array.size()/10-1 <= page_count && page_count <= dto_array.size()/10+1){/* max_page-2 <= page_count <= max_page */
                            	for(int i = dto_array.size()/10-3; i<=dto_array.size()/10+1; i++) {%>
									<a style="color: #fff<%if(page_count==i){%>text-decoration: underline;<%} %>" href="msg.jsp?page=<%=i %>" class="num_box"><%=i %></a> <%} /* 뒤에꺼 다뜨기(5개) */System.out.println("뒤에꺼 다뜨기(5개)");
                            }
                            else{
                            	for(int i = page_count-2; i<= page_count+2; i++) {%>
									<a style="color: #fff<%if(page_count==i){%>text-decoration: underline;<%} %>" href="msg.jsp?page=<%=i %>" class="num_box"><%=i %></a> <%} /* 자기중심5개까지만뜨기 */System.out.println("자기중심5개까지만뜨기");
                            } 
                            %>
							<%if(dto_array.size()/10-2 >= page_count && page_count <= dto_array.size()/10+1){ %>
                            <a href="msg.jsp?page=<%=dto_array.size()/10+1 %>" class="arrow radius-left">≫</a><!-- 맨뒤로 이동 -->
                            <%} %>
                        </td>
                    </tr>
                </tfoot>
</table>
					<center>
					<div class="login-box">
					<form id="frm">
           			<a href="poll_make.jsp">
     				<span></span>
    				<span></span>
      				<span></span>
      				<span></span>
      				투표 작성
   					</a>
   					</form>
   					</div>
					</center>

						
						
			
					
</body>
</html>