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
.btn {
   background-color: #86acd9;
   color: #fff;
   border: 1px solid #86acd9;
   width: 70px;
   height: 30px;
   font-size: 13px;
   border-radius: 4px;
}
</style>
</head>
<body>
<% int msg_num  = Integer.parseInt(request.getParameter("num_msg"));
msgDAO dao = new msgDAO();
msgDTO info_msg = dao.selectone(msg_num);
%>
      <table
         style="padding-top: 50px; align: center; border: 1; cellpadding: 2;">
         <tr>
            <td height=50 align=center bgcolor=#86acd9
               style="border-radius: 4px;"><font size=5px color=white>MESSEGE</font></td>
         </tr>
         <tr>
            <td bgcolor=white>
               <table class="table2" style="width: 400px;">

                  <tr>
                     <td style="width: 100%;"><span><%=info_msg.getSend_name() %></span></td>
                  </tr>
                  <tr>
                  <tr>
                     <td
                        style="width: 100%; border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
                        <span><%=info_msg.getMsg_content() %></span></td>
                  </tr>

                  <tr>
                     <td style="width: 100%; height: 30px; text-align:right;"><%= info_msg.getMsg_datetime() %></td>
                  </tr>

               </table>
               <center>
                  <button class="btn" type="button"
                     onclick="location.href='msg.jsp'">메시지함</button>
               </center>
            </td>
         </tr>
      </table>
   </form>

</body>
</html>