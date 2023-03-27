<%@page import="com.smhrd.model.memberDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.pl{
    		width: 300px;
    		border: 1px solid #ccc;
    		box-sizing: border-box;
    		border-radius: 5px;
    		padding: 12px 13px;
    		font-family: 'Roboto';
    		font-style: normal;
    		font-weight: 400;
    		font-size: 14px;
    		line-height: 16px;
    		margin-top:4%    		
		}

		.pl:focus{
    		border: 1px solid rgba(30,30,30,.5);
    		box-sizing: border-box;
    		border-radius: 10px;
    		outline: 3px solid rgba(30,30,30,.5);
    		border-radius: 10px;
		}
		
        table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                border-top: 1px solid #ccc;
                margin : 20px 10px;
        }
        table.table2 tr {
                 width: 100px;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
        }
        table.table2 td {
                 width: 300px;            
                 padding: 10px;
   
                 border-bottom: 1px solid #ccc;
        }
        .btn {
        	background-color:#86acd9;
        	color:#fff;
        	border: 1px solid #86acd9;
        	width: 100px;
        	height: 50px;
        	font-size: 18px;
        	border-radius: 4px;
        }
 
</style>
</head>
<body>
  <form action = "upload_boardcon" method="POST" enctype="multipart/form-data">
        <table  style="padding-top:50px" align = center width=700 border=0 cellpadding=2 >
                <tr>
                <td height=50 align= center bgcolor=#86acd9 style="border-radius:4px;"><font size=5px color=white >글쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class="table2">
                        <tr>
                        <td>카테고리</td>
                        <td>
        					<select name="category" id="" class="pl">
            					<option value="0" selected>게시판 종류</option>
            					<option value="공지">공지</option>
            					<option value="실습">실습</option>
            					<option value="식당후기">식당후기</option>
        					</select>
        					<input name="board_photo" type="file" style="float: right; align-content: center;">
      					<label></label>
    					</td>
    					
                        </tr>
 
                        <tr>
                        <td>제목</td>
                        <td><input type = text name = "board_title" size=90 ></td>
                        </tr>
 
                        <tr>
                        <td>내용</td>
                        <td><textarea name = "board_content" cols=92 rows=15></textarea></td>
                        </tr>
 						
                        </table>
                          <center>
                        	<button  class="btn" type = "submit">작성</button>
                       	  </center>
                </td>
                </tr>
        </table>
        					<% memberDTO info = (memberDTO)session.getAttribute("info");%>
                        	<input style="display: none" type="text" value="<%=info.getId() %>" name="id">
        </form>
 
</body>
</html>