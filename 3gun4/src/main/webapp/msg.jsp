<%@page import="com.smhrd.model.msgDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<% List<msgDTO> send = (List<msgDTO>)request.getAttribute("msglist"); %>
      <table
         style="padding-top: 0px; align: center; border: 0; cellpadding: 2;">
         <tr>
            <td height=50 align=center bgcolor=#86acd9
               style="border-radius: 4px;"><font size=5px color=white>MESSEGE</font></td>
         </tr>
         <tr>
            <td bgcolor=white>
            <%if(send != null){ %>
            <% for(int i=0;i<send.size();i++){ %>
               <table class="table2"
                  style="width: 400px; border-bottom: 1px solid #ddd;">
                  <tr>
                     <td><a href="msg_send.jsp?num_msg=<%=send.get(i).getMsg_num() %>"><%= send.get(i).getSend_id()%></a></td>
                     <td style="widht: 100%; align: right"><%=send.get(i).getMsg_datetime()%></td>
                  </tr>
               </table>
               <%} %>
           <% }else{%>
            <table class="table2"
                  style="width: 400px; border-bottom: 1px solid #ddd;">
                  <tr>
                     <td><a href=""></a></td>
                     <td style="widht: 100%; align: right"></td>
                  </tr>
               </table>
               <%} %>
               <br>
               <center>
                  <button class="btn" type="button"
                     onclick="location.href='msg_send.jsp'">메시지 보내기</button>
               </center>
               </div>
</body>
</html>