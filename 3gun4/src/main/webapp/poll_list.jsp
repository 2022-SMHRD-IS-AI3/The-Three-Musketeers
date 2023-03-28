<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  table { 
                display: table;
                clear:both; 
                width:auto;
                border-collapse: collapse; 
                vertical-align: middle;
              }
  th{ 
                border-color:#333333; 
                background: #fcfcfc;
                padding:10px 0 10px 0; 
                text-align:center; 
                border-top-width: 2px;
                border-bottom-width: 1px;
                border-top-style: solid;
                border-bottom-style: solid;

             }
            
</style>
</head>
<body>
<div align="center"><br/>
<h2>투표 리스트</h2>

<hr width="100%"/>
<table>
	<tr>
		<td>
		<table  border="1">
			<tr>
				<th width="50">번호</th>
				<th width="250">질문</th>
				<th width="200">작성자</th>
			</tr>
		
			<tr align="center">
				<td>1</td>
				<td>
				<a href="poll.jsp">오늘뭐먹지</a>
				</td>
				<td>먹보</td>
			</tr>
			<tr align="center">
				<td>2</td>
				<td>
				<a href="poll.jsp">오늘뭐하지</a>
				</td>
				<td>먹보</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td align="center" padding="20px">
			<a href="poll_make.jsp">투표작성하기</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>