<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.memberDAO"%>
<%@page import="com.smhrd.model.memberDTO"%>
<%@page import="com.smhrd.model.msgDTO"%>
<%@page import="com.smhrd.model.msgDAO"%>
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
<% int msg_num  = Integer.parseInt(request.getParameter("num_msg"));
msgDAO dao = new msgDAO();
msgDTO info_msg = dao.selectone(msg_num);
memberDTO info = (memberDTO) session.getAttribute("info");
memberDAO dao_m = new memberDAO();
List<memberDTO> mem_list = dao_m.selectAll();
%>

<img alt="" src="./code/뒤로가기.png" onclick="location.href='msg.jsp'" style="position: absolute;margin-left:320px;margin-top: -2px; filter:invert(100%);width: 50px; cursor: pointer">
<img alt="" src="./code/삭제하기.png" onclick="location.href='msg_del_con?msg_num=<%=info_msg.getMsg_num() %>'" style="position: absolute;margin-left:370px;margin-top: -6px; filter:invert(100%);width: 50px; cursor: pointer">

      <table class="bbsList" summary="" style="color:#000; width: 425px;">
		<h2 style="color: #FFF">메시지 내용</h2>
		
		<hr>
		<thead class="head">		
		<tr>	
			<tr>
				<th style="color: white; background: #ffffff11; width: 50%;">보낸사람<br><%=info_msg.getSend_name() %></th>
				<th style="color: white; background: #ffffff11; width: 50%;">보낸시간<br><%=info_msg.getMsg_datetime() %></th>
			</tr>
			<tr style="color: white; background: #ffffff11;" height="360px"><td colspan="2" style="vertical-align: top;padding: 9px;"><%=info_msg.getMsg_content() %></td></tr>
		</tr>
		</thead>
		<tbody  class="body" style="color: #fff">
				
		</tbody>
		
	</table>
                    <div class="login-box" style="position: absolute;top: 590px;">
            		<form id="frm" action = "send_msgcon" method="POST">
            		<input style="display: none" name="send_name" value="<%=info.getName() %>">
            		<input style="display: none" type="submit" id="sub_btn">
            		<table>
                    <tr>
                        <td style="text-align: right;color: #fff;vertical-align: top;font-size: 18px">받는사람</td>
                        <td>
                        	<select name="accept_name" style="width:346px;">
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
           			<a href="#" onclick="return chk_form()" style="margin-top: -19px">
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