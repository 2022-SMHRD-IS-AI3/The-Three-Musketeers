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
<body style="background:transparent;">
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
      <h2 style="color: #fff;"><%=board_content.getCategory()%></h2>
   <table>
      <tr height="5px"></tr>
      <tr>
         <td style="text-align: center;"><span class="board_title" style="color: #fff;"><%=board_content.getBoard_title()%></span></td>
         <td width="25%" style="text-align: right;"><span style="color: #fff;"><%=board_content.getId()%></span><br> <span style="color: #fff;"><%=board_content.getBoard_datetime()%></span></td>
      </tr>
      <tr>
         <td colspan="2"><img alt=""
            src="./file/<%=board_content.getBoard_photo()%>" width="300px"> <br> <span style="color: #fff;">
               <%=board_content.getBoard_content()%>
         </span></td>
      </tr>
   </table>
   
   
   <form action="board_com_con">
   
      		<input style="display: none;color: #fff;" type="submit" id="login_btn">
         	<i class="fa fa-comment fa" style="color: #fff;"></i>
            <textarea class="form-control" rows="3" name="com_content" style="background-color:#FFFFFF11; color: #fff;"></textarea>
            
            
            <%
            memberDTO info = (memberDTO) session.getAttribute("info");
            %>
            <input style="display: none" type="text" value="<%=info.getId()%>"
               name="id"> <input style="display: none" type="text"
               value="<%=board_content.getBoard_num()%>" name="board_num">
            
	</form>
		<center>
			<div class="login-box">
            <form id="frm">
            <a href="#" onclick="return chk_form()">
           	<span></span>
          	<span></span>
            <span></span>
            <span></span>
            댓글작성
            </a>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
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
   

   <%
   commentDAO dao_com = new commentDAO();
   List<commentDTO> dto_com_array = dao_com.selectAll_comment();
   %>
   <!-- Single comment-->
   <!-- <div class="media mb-4"> -->

   <div class="d-flex justify-content-between align-items-center">
      <div class="justify-content-between align-items-center" style="width: 99%">
         <%
         for (int i = dto_com_array.size()-1; i > 0; i--) {
            if (dto_com_array.get(i).getBoard_num() == board_nums) {
         %>

         <div class="ml-2" style="float: left; width: 100%;">
            <div class="h5 m-0">
               <a href="" style="color: #03e9f4; float: left;"><%=dto_com_array.get(i).getId()%>&nbsp&nbsp</a>
               <a style="color:#fff;float: right; font-size: 13px; font-weight: normal;"><%=dto_com_array.get(i).getCom_datetime()%></a>
            </div>
            <h5 class="mt-0" style="color: #fff;"><%=dto_com_array.get(i).getCom_content()%></h5>
            <hr>
         </div>
         <%
         }
         }
         %>
      </div>
   </div>
<script>
function chk_form() {
document.getElementById('login_btn').click();
}
</script>
</body>

</html>