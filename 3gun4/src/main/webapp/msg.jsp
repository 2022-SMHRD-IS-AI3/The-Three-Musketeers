<%@page import="com.smhrd.model.memberDAO"%>
<%@page import="com.smhrd.model.msgDAO"%>
<%@page import="com.smhrd.model.memberDTO"%>
<%@page import="com.smhrd.model.msgDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	memberDTO info = (memberDTO) session.getAttribute("info");
	
	memberDAO dao = new memberDAO();
	List<memberDTO> mem_list = dao.selectAll();
	%>
	

	<%
	msgDAO msg_dao = new msgDAO();
	List<msgDTO> msg_dao_array = msg_dao.selectAll_msg(info.getName());
	
	int page_count = 1;
	try{
		page_count = Integer.parseInt(request.getParameter("page"));
		System.out.println(page_count);
	}catch(Exception e){
		
	}
	%>
	<table class="bbsList" summary="" style="color:#000; width: 425px;">
		<h2 style="color: #FFF">메시지 함</h2>
		<caption>메시지 함</caption>
		<hr>
		<thead class="head">		
		<tr>	
			<tr>
				<th style="color: white; background: #ffffff11; width: 50%;">보낸사람</th>
				<th style="color: white; background: #ffffff11; width: 50%;">시간</th>
			</tr>
		</tr>
		</thead>
		<tbody  class="body" style="color: #fff">
			<%
			try{
				for(int i=msg_dao_array.size()-((page_count-1)*10)-1; i>=msg_dao_array.size()-((page_count)*10-1)-1 ; i--) {
			%>
				<td style="display: none;"><%=msg_dao_array.get(i).getMsg_num()%></td>
			<tr>
				<td>
					<a style="color:#fff;" href="msg_accept.jsp?num_msg=<%=msg_dao_array.get(i).getMsg_num() %>"><%=msg_dao_array.get(i).getSend_name()%></a>
				</td>
				<td style="widht: 100%; align: right">
					<%=msg_dao_array.get(i).getMsg_datetime() %>
				</td>
			</tr>
			<%
				}
			}catch(Exception e){
				
			}
			%>
		</tbody>
		<tfoot class="foot">
			<tr>
				<td colspan="9" style="border-bottom: none;">
					<%if(page_count > 3){ %> 
						<a href="msg.jsp?page=1" class="arrow radius-right">≪</a>
					<%}
                            if(page_count <= 3 && page_count >= 1){/* 1~3 */
                           	 	for(int i = 1; i<=msg_dao_array.size()/10+1; i++) {%>
                            		<a style="color: #fff;<%if(page_count==i){%>text-decoration: underline;<%} %>" href="msg.jsp?page=<%=i %>" class="num_box"><%=i %></a>
                            	<%} /* 처음꺼 다뜨기(5개) */ System.out.println("처음꺼 다뜨기(5개)");
                            }
                            else if(msg_dao_array.size()/10-1 <= page_count && page_count <= msg_dao_array.size()/10+1){/* max_page-2 <= page_count <= max_page */
                            	for(int i = msg_dao_array.size()/10-3; i<=msg_dao_array.size()/10+1; i++) {%>
									<a style="color: #fff<%if(page_count==i){%>text-decoration: underline;<%} %>" href="msg.jsp?page=<%=i %>" class="num_box"><%=i %></a> <%} /* 뒤에꺼 다뜨기(5개) */System.out.println("뒤에꺼 다뜨기(5개)");
                            }
                            else{
                            	for(int i = page_count-2; i<= page_count+2; i++) {%>
									<a style="color: #fff<%if(page_count==i){%>text-decoration: underline;<%} %>" href="msg.jsp?page=<%=i %>" class="num_box"><%=i %></a> <%} /* 자기중심5개까지만뜨기 */System.out.println("자기중심5개까지만뜨기");
                            } 
                            %>
							<%if(msg_dao_array.size()/10-2 >= page_count && page_count <= msg_dao_array.size()/10+1){ %>
                            <a href="msg.jsp?page=<%=msg_dao_array.size()/10+1 %>" class="arrow radius-left">≫</a><!-- 맨뒤로 이동 -->
                            <%} %>
                        </td>
                    </tr>
                </tfoot>
	</table>
                    <div class="login-box" style="position: absolute;top: 590px;">
            		<form id="frm" action = "send_msgcon" method="POST">
            		<input style="display: none" name="send_name" value="<%=info.getName() %>">
            		<input style="display: none" type="submit" id="sub_btn">
            		<table>
                    <tr>
                        <td style="text-align: right;color: #fff;vertical-align: top;font-size: 18px">받는사람</td>
                        <td>
                        	<select name="accept_name">
                        	<%
							for (int i = 0; i < mem_list.size(); i++) {
							%>
                        		<option class="opt_name" value="<%=mem_list.get(i).getName() %>"><%=mem_list.get(i).getName() %></option>
                        	<%
							}
							%>
                        	</select>
                        </td>
                    </tr>
                    <tr height="5px"></tr>
                   
                    <tr>
                        <td style="text-align: right;color: #fff;vertical-align: top;font-size: 18px;">내용</td>
                        <td><textarea name = "msg_content" style="right:0 ;color: #fff;width: 340px; height: 90px; background-color:#FFFFFF11 "></textarea></td>
                    </tr>
                    </table>
                    <br>
                    <center>
           			<a href="#" onclick="return chk_form()">
     				<span></span>
    				<span></span>
      				<span></span>
      				<span></span>
      				메시지 작성
   					</a>
   					</form>
					</center>
            		</div>
		
            
<script>
function chk_form() {
document.getElementById('sub_btn').click();
}
</script>
	
		
	
</body>
</html>