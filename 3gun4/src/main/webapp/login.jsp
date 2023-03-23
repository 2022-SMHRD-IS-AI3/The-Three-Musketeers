<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend align="center">도서관리시스템</legend>
   <form action="logincon" method="post">
      <table align="center">
         <tr>
            <td>ID</td>
            <td><input type="text" name="id"></td>
            <td rowspan="2"><input type="submit" value="로그인"></td>
         </tr>
         <tr>
            <td>PW</td>
            <td><input type="password" name="pw"></td>
         </tr>
      </table>
      <p align="center">아이디가 없다면 <a href="join.jsp">회원가입</a> 클릭</p>
   </form>
   </fieldset>
</body>
</html>