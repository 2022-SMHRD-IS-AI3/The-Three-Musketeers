<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.boardDAO"%>
<%@page import="com.smhrd.model.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="UTF-8">
<link href="code/css/style.css" rel="stylesheet" />
<style>
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
	<div class="container managergrounp" id="container" name="container">
		<h3 style="color: #FFF">게시글 목록</h3>
		<hr>

            <table class="bbsList" summary="" style="color:#000">
                <caption>게시글 목록</caption>           
                <thead class="head">
                    <tr>
                    	 <tr>
							<th style="width: 55px; background: #d3d3d3;">번호</th>
							<th style="width: 95px; background: #d3d3d3;">카테고리</th>
							<th style="width: 500px; background: #d3d3d3;">제목</th>
							<th style="width: 75px; background: #d3d3d3;">작성자</th>
							<th style="width: 270px; background: #d3d3d3;">등록일</th>
						</tr>
                    </tr>    
                </thead>
                <tbody class="body" style="color: #fff">
    				<tr>
    				<% 
    				boardDAO dao = new boardDAO();
    				List<boardDTO> dto_array= dao.selectAll_board();
    				int page_count = 1;
    				for(int i = 0;i<dto_array.size(); i++){
    					if(dto_array.get(i).getCategory().toString().equals("공지")){%>
    				
    				<tr style="color: #03e9f4; background-color: none; font-weight: bold;" >
						<td><%=dto_array.get(i).getBoard_num()%></td>
						<td><%=dto_array.get(i).getCategory().toString()%></td>
						<td><a style="color:#03e9f4;" href="boardDetail.jsp?board_nums=<%=dto_array.get(i).getBoard_num() %>"><%=dto_array.get(i).getBoard_title().toString()%></a></td>
						<td><%=dto_array.get(i).getId().toString()%></td>
						<td><%=dto_array.get(i).getBoard_datetime().toString()%></td>
					</tr>
					
					<%		}
    					}
							try{
								page_count = Integer.parseInt(request.getParameter("page"));
								System.out.println(page_count);
							}catch(Exception e){
								
							}
							%>
				<%
    				try{
    				for(int i=dto_array.size()-((page_count-1)*10)-1; i>=dto_array.size()-((page_count)*10-1)-1 ; i--) {%>
                     <tr>
						<td><%=dto_array.get(i).getBoard_num()%></td>
						<td><%=dto_array.get(i).getCategory().toString()%></td>
						<td><a style="color:#fff;" href="boardDetail.jsp?board_nums=<%=dto_array.get(i).getBoard_num() %>"><%=dto_array.get(i).getBoard_title().toString()%></a></td>
						<td><%=dto_array.get(i).getId().toString()%></td>
						<td><%=dto_array.get(i).getBoard_datetime().toString()%></td>
					</tr>
					<%}
    				}catch(Exception e){
    					for(int i = i=dto_array.size()-((page_count-1)*10)-1;i>=dto_array.size()%10;i--){%>
    						<tr>
    						<td><%=dto_array.get(i).getBoard_num()%></td>
    						<td><%=dto_array.get(i).getCategory().toString()%></td>
    						<td><a style="color:#fff;" href="boardDetail.jsp?board_nums=<%=dto_array.get(i).getBoard_num() %>"><%=dto_array.get(i).getBoard_title().toString()%></a></td>
    						<td><%=dto_array.get(i).getId().toString()%></td>
    						<td><%=dto_array.get(i).getBoard_datetime().toString()%></td>
    						</tr>
    					<%}
    				}%>


				</tr>
			</tbody>
			<tfoot class="foot">
				<tr>
					<td colspan="9">
						<%if(page_count > 3){ %> <a href="board.jsp?page=1"
						class="arrow radius-right">≪</a>
					<!-- 맨앞으로 이동 --> <%}
                            if(page_count <= 3 && page_count >= 1){/* 1~3 */
                           	 	for(int i = 1; i<=dto_array.size()/10+1; i++) {%>
                            		<a style="color: #fff;<%if(page_count==i){%>text-decoration: underline;<%} %>" href="board.jsp?page=<%=i %>" class="num_box"><%=i %></a>
                            	<%} /* 처음꺼 다뜨기(5개) */ System.out.println("처음꺼 다뜨기(5개)");
                            }
                            else if(dto_array.size()/10-1 <= page_count && page_count <= dto_array.size()/10+1){/* max_page-2 <= page_count <= max_page */
                            	for(int i = dto_array.size()/10-3; i<=dto_array.size()/10+1; i++) {%>
									<a style="color: #fff<%if(page_count==i){%>text-decoration: underline;<%} %>" href="board.jsp?page=<%=i %>" class="num_box"><%=i %></a> <%} /* 뒤에꺼 다뜨기(5개) */System.out.println("뒤에꺼 다뜨기(5개)");
                            }
                            else{
                            	for(int i = page_count-2; i<= page_count+2; i++) {%>
									<a style="color: #fff<%if(page_count==i){%>text-decoration: underline;<%} %>" href="board.jsp?page=<%=i %>" class="num_box"><%=i %></a> <%} /* 자기중심5개까지만뜨기 */System.out.println("자기중심5개까지만뜨기");
                            } 
                            %>
							<%if(dto_array.size()/10-2 >= page_count && page_count <= dto_array.size()/10+1){ %>
                            <a href="board.jsp?page=<%=dto_array.size()/10+1 %>" class="arrow radius-left">≫</a><!-- 맨뒤로 이동 -->
                            <%} %>
                        </td>
                    </tr>    
                </tfoot>
            </table>
            <center>
            <div class="login-box">
            <form id="frm">
            <table>
            <tr>
            <td>
           	 <a href="boardWrite.jsp">
     		<span></span>
    		<span></span>
      		<span></span>
      		<span></span>
      		게시글 작성
   			</a>
   			</td>
   			</tr>
   			</table>
   			</form>
            </div>
       		</center>
        </div>
    </body>
</html>
</body>
</html>