<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.result_pollDTO"%>
<%@page import="com.smhrd.model.pollDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.pollDTO"%>
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
	clear: both;
	width: auto;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	vertical-align: middle;
}

th {
	border-color: #333333;
	background: #fcfcfc;
	padding: 10px 0 10px 0;
	text-align: center;
	border-top-width: 1px;
	border-bottom-width: 2px;
	border-top-style: solid;
	border-bottom-style: solid;
}

td {
	border-color: #333333;
	text-align: center;
	border-top-style: solid;
	border-bottom-style: solid;
}

.btn {
	background-color: #86acd9;
	color: #fff;
	border: 1px solid #86acd9;
	width: 80px;
	height: 30px;
	font-size: 15px;
	border-radius: 4px;
}

</style>
</head>
<body>
<%
System.out.println("[poll_result]");
	int vote_nums = Integer.parseInt(request.getParameter("vote_nums")); 
	pollDTO dto = new pollDTO(vote_nums);
	result_pollDTO dtor = new result_pollDTO(vote_nums);
    pollDAO dao = new pollDAO();
   
    
    List<result_pollDTO> vote_rcontent = dao.selectAll_resultpoll(dtor);

    System.out.println("Test12 "+vote_rcontent.size());
    
    //투표한 사람 수 
/*   	String id = request.getParameter("id");
  	result_pollDTO dr = new result_pollDTO(id);
    int count = dao.count_poll(id); */
    
    //투표한 내용이 들어간 배열
    ArrayList<String> vote_content_arr = new ArrayList<String>(); 
    
	for(int i=0;i<vote_rcontent.size();i++){
		String content  = vote_rcontent.get(i).getVote_content();
		System.out.println("콘텐츠 어떤거나와"+content);
	 	String repl_vote_content = content.replaceAll("\\[", " ");
		repl_vote_content = repl_vote_content.replaceAll("\\]", "");
		repl_vote_content = repl_vote_content.replaceAll(" ", "");
		vote_content_arr.add(repl_vote_content);
	
		// System.out.println("Content "+content);
	}
	
	System.out.println("추가 이후 " +vote_content_arr);
	
	
	pollDTO vote_content = dao.selectone_poll(dto);
	String repl_vote_content = vote_content.getVote_content().replaceAll("\\[", " ");
	repl_vote_content = repl_vote_content.replaceAll("\\]", "");
	repl_vote_content = repl_vote_content.replaceAll(" ", "");
	
	//항목 들어간 배열
	String[] vote_content_arr2 = repl_vote_content.split(",");
	System.out.println("Test123 "+vote_content_arr2.length);
	
	//항목에 따른 갯수
	int[] vote_content_cnt = new int[vote_content_arr2.length];
	
	if(vote_content.getOverlap() == 0){
			
	//중복x
 	for(int i = 0 ; i<vote_content_arr.size();i++){
		
		String data = vote_content_arr.get(i);
		System.out.println(data);
		
		int index = 0;
	
		System.out.println("---------");
		for(int j=0;j<vote_content_cnt.length;j++){
			System.out.println(vote_content_arr2[j]);
			
			if(data.equals(vote_content_arr2[j])){
				System.out.println("TResat");
				index = j;
			}
		}
		System.out.println("---------");
		
		vote_content_cnt[index]=vote_content_cnt[index]+1 ;
			
	} 
	
	} else {
		//중복 o
		System.out.println("길이 : "+vote_content_cnt.length);
		
	 	for(int i = 0;i<vote_content_arr.size();i++){
			
			String data = vote_content_arr.get(i);
			System.out.println(data);
			
			int index = 0;
		
			System.out.println("---------");
			for(int j=0;j<vote_content_cnt.length;j++){
				System.out.println(vote_content_arr2[j]);
				
				if(data.equals(vote_content_arr2[j])){
					System.out.println("TResat");
					index = j;
				}
			}
			System.out.println("---------");
			
			vote_content_cnt[index]=vote_content_cnt[index]+1 ;
			
				
		} 
	}

/* 	ArrayList<String> content_list = new ArrayList<String>();
	
	for(int i=0;i<vote_content_arr.size();i++){
		content_list.add(vote_content_arr.get(i));
		
		if(i>0&&content_list.get(i).equals(content_list.get(i-1))){
			i--;
		}
	}
	 */

%>
	<div align="center">
		<br />
		<h2>투표 결과</h2>
		<hr width="auto" />
		<form name="frm" method="post" action="resultcon">
		<table border="1" width="auto">
			<tr>
				<th colspan="2" width="50"><b>질문 : <%=vote_content.getVote_title() %></b></th>

			</tr>
			<%int allcount=0; %>
			<tr>
				<td><b>항목</b></td>
				<td width="100">
			<% for(int i=0; i<vote_content_arr2.length ; i++){ %>
				<b><%=vote_content_arr2[i]%> :<%= vote_content_cnt[i]%> 명</b><br>
					<% allcount += vote_content_cnt[i]; %>
				<%} %></td>
				
			</tr>
			<tr>
				<td><b>총 투표자 수</b></td>
				<td width="100"><b><%=allcount %>(명)</b></td>
			</tr>

		</table>
			</form>
<tr>

		<a href="poll.jsp?vote_nums=<%=vote_nums %>"><button class="btn" >다시투표</button></a> 
		<a href="poll_list.jsp"><button class="btn">닫기</button></a>
	</tr>
	</div>

</body>
</html>