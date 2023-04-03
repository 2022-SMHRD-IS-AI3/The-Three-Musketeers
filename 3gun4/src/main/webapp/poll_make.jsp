<%@page import="com.smhrd.model.boardDAO"%>
<%@page import="com.smhrd.model.pollDAO"%>
<%@page import="com.smhrd.model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height: 500px">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="code/css/style.css" rel="stylesheet" />
<style>
table {
   display: table;
   clear: both;
   width: auto;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   vertical-align: middle;
}

td {
   border-color: #333333;
   text-align: center;
   border-bottom-style: solid;
}

.btn {
   background-color: #86acd9;
   color: #fff;
   border: 1px solid #86acd9;
   width: 80px;
   height: 30px;
   font-size: 15px;
   border-radius: 4px;
}

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
<form name="frm" method="post" action="upload_pollcon">
<table class="bbsList" summary="" style="color:#000; width: 245px;">

   <h2 style="color: #FFF">투표작성</h2>
   <caption>투표작성</caption>
   <hr>
   <tbody class="body" style="color: #fff ">
   
      <tr>
         <td><b>질문</b></td>
         <td colspan="2"><input name="vote_title" size="17"></td>
      </tr>
      <tr>
         <td rowspan="7" style="border-right-color: #eeeeee;border-right-style: solid;border-right-width: 1px;">항목</td>
         <td class="a" style='text-align: center;width: 10px;'>1</td>
         <td class="a" id='cont_box'><input type='text' name="vote_content" id="content" style='width: 100px'></td>
      </tr>
      <tr>
         <td colspan='2' style='text-align: center;'>
         <span onclick="addRow()">항목 추가</span> 
         <span href="#" onclick="delRow()">항목 삭제</span>
         </td>
      </tr>
      
            <input type="radio" name="overlap" value="0" checked style="display: none" >

   </tbody>
   <tfoot class="foot">
      
    </tfoot>
</table>

      <input style="display: none" type="submit" id="login_btn">
               <% memberDTO info = (memberDTO)session.getAttribute("info");%>
                    <input style="display: none" type="text" value="<%=info.getId() %>" name="id">

</form>
<center>
            <div class="login-box">
            <form id="frm">
            <a href="#" onclick="return chk_form()">
     		<span></span>
    		<span></span>
      		<span></span>
      		<span></span>
      		작성하기
   			</a>
           	 <a href="poll_list.jsp">
     		<span></span>
    		<span></span>
      		<span></span>
      		<span></span>
      		리스트
   			</a>
   </form>
   </div>
         </center>
   <script>
      function addRow() {
         var table = document.querySelector("table"); // 테이블 요소 선택
         var rowCount = table.rows.length; // 테이블의 행 개수

         if (rowCount > 6) {
            alert("최대 5개까지 추가할 수 있습니다!")
            return;
         }
         
         
         var row = table.insertRow(rowCount - 1); // 새로운 행 추가
         // 새로운 셀 추가
         var cell1 = row.insertCell(0);
         var cell2 = row.insertCell(1);

         // 행 번호 표시 셀 추가
         cell1.className = "a";
         cell1.style.textAlign = "center";
         cell1.innerHTML = rowCount - 2;

         // 입력 필드 셀 추가
         cell2.className = "a";
         cell2.innerHTML = "<input type='text' name='vote_content' id='content' style='width: 100px'>";

      }

      function delRow() {
         var table = document.querySelector("table"); // 테이블 요소 선택
         var rowCount = table.rows.length; // 테이블의 행 개수

         // 마지막 행 삭제
         if (rowCount <= 4) { // 최소 1개 이상의 입력 필드가 있도록 제한
            alert("더 이상 삭제할 수 없습니다.");
            return;
         }
         table.deleteRow(rowCount - 3);
      }
      function chk_form() {
    	  document.getElementById('login_btn').click();
    	  }
   </script>

</body>
</html>