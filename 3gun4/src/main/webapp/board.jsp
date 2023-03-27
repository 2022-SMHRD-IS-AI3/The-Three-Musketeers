<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.boardDAO"%>
<%@page import="com.smhrd.model.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>
	<!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <link href="code/css/style.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container managergrounp" id="container" name="container" >
            <h3>게시글 목록</h3>
            <hr>         
            
            

            <table class="bbsList" summary="">
                <caption>게시글 목록</caption>           
                <thead class="head">
                    <tr>
                     <tr>
						<th style="width: 55px;">번호</th>
						<th style="width: 95px;">카테고리</th>
						<th style="width: 500px;">제목</th>
						<th style="width: 75px;">작성자</th>
						<th style="width: 270px;">등록일</th>
					</tr>
                    </tr>    
                </thead>
                <tbody class="body">
    				<tr>
    				<% 
    				boardDAO dao = new boardDAO();
    				List<boardDTO> dto_array= dao.selectAll_board();
    				int page_count = 1;
    				for(int i = 0;i<dto_array.size(); i++){
    					if(dto_array.get(i).getCategory().toString().equals("공지")){%>
    				
    				<tr style="color: red; background-color: #F2F3F5;">
						<td><%=dto_array.get(i).getBoard_num()%></td>
						<td><%=dto_array.get(i).getCategory().toString()%></td>
						<td><%=dto_array.get(i).getBoard_title().toString()%></td>
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
						<td><%=dto_array.get(i).getBoard_title().toString()%></td>
						<td><%=dto_array.get(i).getId().toString()%></td>
						<td><%=dto_array.get(i).getBoard_datetime().toString()%></td>
					</tr>
					<%}
    				}catch(Exception e){
    					for(int i = i=dto_array.size()-((page_count-1)*10)-1;i>=dto_array.size()%10;i--){%>
    						<tr>
    						<td><%=dto_array.get(i).getBoard_num()%></td>
    						<td><%=dto_array.get(i).getCategory().toString()%></td>
    						<td><%=dto_array.get(i).getBoard_title().toString()%></td>
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
                        	<%if(page_count > 3){ %>
                            <a href="board.jsp?page=1" class="arrow radius-right">≪</a><!-- 맨앞으로 이동 -->
                            
                            <%}
                            if(page_count <= 3 && page_count >= 1){/* 1~3 */
                           	 	for(int i = 1; i<=dto_array.size()/10+1; i++) {%>
                            		<a href="board.jsp?page=<%=i %>" class="num_box"><%=i %></a>
                            	<%} /* 처음꺼 다뜨기(5개) */ System.out.println("처음꺼 다뜨기(5개)");
                            }else if(dto_array.size()/10-1 <= page_count && page_count <= dto_array.size()/10+1){/* max_page-2 <= page_count <= max_page */
                            	for(int i = dto_array.size()/10-3; i<=dto_array.size()/10+1; i++) {%>
                        		<a href="board.jsp?page=<%=i %>" class="num_box"><%=i %></a>
                        	<%} /* 뒤에꺼 다뜨기(5개) */System.out.println("뒤에꺼 다뜨기(5개)");
                            }else{
                            	for(int i = page_count-2; i<= page_count+2; i++) {%>
                        		<a href="board.jsp?page=<%=i %>" class="num_box"><%=i %></a>
                        	<%} /* 자기중심5개까지만뜨기 */System.out.println("자기중심5개까지만뜨기");
                            } 
                            %>
							<%if(dto_array.size()/10-2 >= page_count && page_count <= dto_array.size()/10+1){ %>
                            <a href="board.jsp?page=<%=dto_array.size()/10+1 %>" class="arrow radius-left">≫</a><!-- 맨뒤로 이동 -->
                            <%} %>
                        </td>
                    </tr>    
                </tfoot>
            </table>
            <div class="btn_wrap">
                <a class="btn_org" href="boardWrite.jsp"><span class="txt_white">게시글 작성</span></a>
            </div>
        </div>
       
    </body>
</html>
</body>
</html>