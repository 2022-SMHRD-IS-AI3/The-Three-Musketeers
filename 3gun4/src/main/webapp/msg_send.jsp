<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
          .btn {
           background-color:#86acd9;
           color:#fff;
           border: 1px solid #86acd9;
           width: 70px;
           height: 30px;
           font-size: 13px;
           border-radius: 4px;
        }
 
    </style>
</head>
<body>
 <form action = "send_msgcon" method="POST">
        <table  style="padding-top:50px; align:center;  border:0; cellpadding:2;" >
                <tr>
                <td height=50 align= center bgcolor=#86acd9 style="border-radius:4px;"><font size=5px color=white >MESSEGE</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class="table2" style="width:400px; ">
                 
                        <tr>
                        <td text-align="center">&nbsp받는사람</td>
                        <td><input type = text name = "msg_send" style="width:100%; height:30px;"></td>
                        </tr>
                   
                        <tr>
                        <td text-align="center">&nbsp내용</td>
                        <td><textarea name = "msg_content" style="width: 100%; height: 450px;"></textarea></td>
                        </tr>
                       </table>
                             <center>
                           <button class="btn" type = "submit">전송</button>
                           <button class="btn" type="button" onclick = "location.href='msg.jsp'">메시지함</button>
                           </center>
                </td>
                </tr>
        </table>
        </form>
 
</body>
</html>