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
<legend align="center">회원가입</legend>
   <form action="joincon" method="post">
      <table>
         <tr>
            <td>ID</td>
            <td><input type="text" name="id"></td>
         </tr>
         <tr>
            <td>PW</td>
            <td><input type="password" name="pw"></td>
         </tr>
         <tr>
            <td>NAME</td>
            <td><input type="text" name="name"></td>
            <td rowspan="2"><input type="submit" value="전송"></td>
         </tr>
         <tr>
            <td>phonenum</td>
            <td><input type="text" name="phonenum"></td>
         </tr>
         <tr>
            <td>class_name</td>
            <td><input type="text" name="class_name"></td>
         </tr>
      </table>
   </form>
</legend>
</fieldset>

</body>
</html>