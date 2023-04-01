<%@page import="com.smhrd.model.mainDAO"%>
<%@page import="com.smhrd.model.mainDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<html>
<head>
<title>Future Imperfect by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<style>
body {
   margin: 0;
   padding: 0;
   font-family: sans-serif;
   background: linear-gradient(#FFFFFF, #86acd9);
}

.login-box {
   width: 300px;
   padding: 20px;
   background: rgba(0, 0, 0, .5);
   box-sizing: border-box;
   box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
   border-radius: 10px;
}

.login-box h2 {
   margin: 0 0 0px;
   padding: 0;
   color: #fff;
   text-align: center;
}

.login-box .user-box {
   position: relative;
}

.login-box .user-box input {
   width: 100%;
   padding: 10px 0;
   font-size: 16px;
   color: #fff;
   margin-bottom: 30px;
   border: none;
   border-bottom: 1px solid #fff;
   outline: none;
   background: transparent;
}

.login-box .user-box label {
   position: absolute;
   top: 0;
   left: 0;
   padding: 10px 0;
   font-size: 16px;
   color: #fff;
   pointer-events: none;
   transition: .5s;
}

.login-box .user-box input:focus ~ label, .login-box .user-box input:valid 
    ~ label {
   top: -20px;
   left: 0;
   color: #03e9f4;
   font-size: 12px;
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
   margin-top: 10px;
   letter-spacing: 4px
}

.login-box a:hover {
   background: #03e9f4;
   color: #fff;
   border-radius: 5px;
   box-shadow: 0 0 5px #03e9f4, 0 0 25px #03e9f4, 0 0 50px #03e9f4, 0 0
      100px #03e9f4;
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
   String name = (String) session.getAttribute("name");
   String id = (String) session.getAttribute("id");
   %>

  
 <img alt="" src="./code/절절포문구.png" style="position: absolute;margin-left:500px;margin-top: 25px;">
 <img alt="" src="./code/삼총사로고.png" style="position: absolute;margin-left:6px;margin-top: 21px; width: 400px">
 <img alt="" src="./code/채팅창위.png" style="position: fixed;margin-left:1580px;margin-top: 41px; width: 400px">
 
   
<div>
<div style="height: 2200px;float: left;width: 350px;"> <!-- 사이드바 -->
   <div class="login-box" style="float:left; margin-left: 50px;margin-top: 180px;"> <!-- 프로필카드 -->
      <form id="frm">
         <%
         memberDTO info = (memberDTO) session.getAttribute("info");
         
         %>
         <h2><%=info.getName()%>(<%=info.getId()%>)<br>님 환영합니다.
         </h2>
         <table align="center">
            <tr>
               <td><a href="mem_edit.jsp"> <span></span> <span></span> <span></span>
                     <span></span> 정보수정
               </a></td>
               <td><a href="logout.jsp"> <span></span> <span></span> <span></span>
                     <span></span> 로그아웃
               </a></td>
            </tr>
            <%
            if (info.getId().equals("admin")) {
            %>
            <tr>
               <td><a href="showmember_admin.jsp"> <span></span> <span></span>
                     <span></span> <span></span> 학생관리
               </a></td>
               <td><a href="board_admin.jsp"> <span></span> <span></span>
                     <span></span> <span></span> 보드관리
               </a></td>
            </tr>
            <tr>
               <td><a href="calendar_admin.jsp"> <span></span> <span></span>
                     <span></span> <span></span> 일정관리
               </a></td>
               <td><a href="main_edit.jsp"> <span></span> <span></span> <span></span>
                     <span></span> 링크관리
               </a></td>
            </tr>
            <tr>
           		<td><a href="poll_admin.jsp"> <span></span> <span></span>
                     <span></span> <span></span> 투표관리
               </a></td>
            </tr>
            <%
            }
            %>
         </table>
      </form>
   
   	</div>
 		<div class="login-box" style="height: 290px; float: right; text-align: center; margin-top: 50px"><!-- QR코드 -->
   			<img alt="" src="./code/qr코드.png" style="margin-top: 27px">
   		</div>  
 		<div class="login-box" style="height: 385px; float: right; text-align: center; margin-top: 50px"><!-- 줌주소 -->
   			<form id='frm'>
   			<%
   			mainDAO dao_main = new mainDAO();
   			mainDTO btn_arr = dao_main.selectOne_main();
   			
   			%>
   			<center>
           			<a href="<%=btn_arr.getZoom() %>" target="_blank" style="font-size: 30px;width: 200px; height: 80px;">
     				<span></span>
    				<span></span>
      				<span></span>
      				<span></span>
      				<p style="margin-top: 20px">줌주소</p>
   					</a>
   					<br>
   					<a href="<%=btn_arr.getRecode() %>" target="_blank" style="font-size: 30px;width: 200px; height: 80px;margin-top: 10px">
     				<span></span>
    				<span></span>
      				<span></span>
      				<span></span>
      				<p style="margin-top: 20px">녹화영상</p>
   					</a>
   					<br>
   					<a href="<%=btn_arr.getLongtime() %>" target="_blank" style="font-size: 30px;width: 200px; height: 80px;margin-top: 10px">
     				<span></span>
    				<span></span>
      				<span></span>
      				<span></span>
      				<p style="margin-top: 20px">연장신청</p>
   					</a>
   					</form>
					</center>
					
   			</form>
   		</div>  
 		
   		
   		<div class="login-box" style="float: right; margin-top: 50px; height: 540px;"><!-- 투표 -->
      		<form id="frm">
         		<iframe src="poll_list.jsp" id="ContentUrl2" name="ContentUrl2" scrolling="auto" frameborder="0" title="투표" width="100%" style="height:500px; display: block;"></iframe>
      		</form>
   		</div>
   	</div>
   <div class="login-box" style="float:left; margin-left: 50px; margin-top: 180px; width: 1100px"> <!-- 캘린더 -->
      <form id="frm">
         <iframe src='calendar_view.jsp' id="ContentUrl" name="ContentUrl" scrolling="auto" frameborder="0" onload="setFrameHeight()" title="캘린더" width="100%" style="display: block;"></iframe>
      </form>
   </div>
   <div class="login-box" style="float:left; margin-left: 50px; margin-top: 50px; width: 1100px">  <!-- 게시판 -->
      <form id="frm">
         <iframe src="board.jsp" id="ContentUrl1" name="ContentUrl1" scrolling="auto" frameborder="0" onload="setFrameHeight1()" title="게시판" width="100%"; style="display: block;"></iframe>
      </form>
   </div>
   <div class="login-box" style="position: fixed;left:1550px;top:770px; width:480px; height: 250px"> <!-- 메시지보내기 -->
   	   <form id="frm">
   	   		<iframe src="" id="ContentUrl4" name="ContentUrl4" scrolling="auto" frameborder="0" onload="setFrameHeight4()" title="메시지보기" width="100%"; style="display: block;"></iframe>
   	   </form>
   </div>
   <div class="login-box" style="position: fixed;left:1550px;top:180px; width:480px; height: 540px"> <!-- 메시지목록 -->
   	   <form id="frm">
   	   		<iframe src="msg.jsp" id="ContentUrl3" name="ContentUrl3" scrolling="auto" frameborder="0" onload="" title="메시지보기" width="100%"; style="display: block; height: 800px"></iframe>
   	   </form>
   </div>
   
   

			
			

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</div>
<script>
function setFrameHeight(){
    if (ContentUrl.document != null) {
        document.all.ContentUrl.style.height = ContentUrl.document.body.scrollHeight + 30 + "px";
    }
}
function setFrameHeight1(){
    if (ContentUrl1.document != null) {
        document.all.ContentUrl1.style.height = ContentUrl1.document.body.scrollHeight + 30 + "px";
    }
}
/* function setFrameHeight2(){
    if (ContentUrl2.document != null) {
        document.all.ContentUrl2.style.height = ContentUrl2.document.body.scrollHeight + 30 + "px";
    }
} */

</script>
</body>
</html>