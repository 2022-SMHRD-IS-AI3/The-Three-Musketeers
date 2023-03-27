<%@page import="com.smhrd.model.boardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style>
html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
  background: linear-gradient(#FFFFFF, #86acd9);
}

#wrapper {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 700px;
  padding: 50px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
}

#wrapper table{
  width: 100%;
  border-top: 1px solid #86acd9;
  border-collapse: collapse;
}

#wrapper h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}
#wrapper tr {
  border-bottom: 1px solid #86acd9;
  padding: 10px;
  color: #fff;
}

#wrapper td {
  position: relative;
  border-bottom: 1px solid #86acd9;
  padding: 10px;
}

#wrapper td input {
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

#wrapper td label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

#wrapper a {
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
  letter-spacing: 4px;
}

#wrapper a:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
}

#wrapper a span {
  position: absolute;
  display: block;
}

#wrapper a span:nth-child(1) {
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

#wrapper a span:nth-child(2) {
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

#wrapper a span:nth-child(3) {
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

#wrapper a span:nth-child(4) {
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
<body style="text-align: center;">
<%
	boardDAO dao = new boardDAO();
	List<boardDTO> list = dao.selectAll_board();
%>
<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<caption><h2>게시글관리페이지</h2></caption>
							<tr>
								<td>순번</td>
								<td>제목</td>
								<td>작성자</td>							
							</tr>
							<% for(int i=0; i<list.size();i++){%>
								<tr>
									<td><%=list.get(i).getBoard_num() %></td>
									<td><%=list.get(i).getBoard_title() %></td>
									<td><%=list.get(i).getId() %></td>
									<td><a href="delete_boardcon?board_num=<%=list.get(i).getBoard_num()%>">게시글삭제</a></td>
								</tr>
							<%} %>
						</table>
					</nav>		
					<a href="main.jsp" class="button next scrolly">
					<span></span>
    			<span></span>
      			<span></span>
      			<span></span>
					되돌아가기</a>	
			</div>
</body>
</html>