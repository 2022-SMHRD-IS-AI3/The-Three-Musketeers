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
select {
  box-sizing: border-box;
  height:50px;
  width: 340px;
  padding: 4px;
  font-size: 20px;
  border-radius: 6px;
  color: #fff;
  background-color:#FFFFFF11;
  border-style: solid;
}

.opt_name{
   background-color: black;
   max-height: 100px; /* 스크롤바 최대 높이 설정 */
     overflow-y: auto;
}

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
		<form name="frm" method="post" action="resultcon">
		<table class="bbsList" summary="" style="color:#000" width="auto">
	
		<h2 style="color: #FFF">투표 결과</h2>
		<hr>
		 <thead class="head" align="center">
			<tr>
				<th colspan="2" width="50" style="color: white; background: #ffffff11"><b>질문 : <%=vote_content.getVote_title() %></b></th>

			</tr>
			 </thead>
   <tbody class="body" style="color: #fff" align="center">
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
  </tbody>
		</table>
			</form>

<center>
            <div class="login-box">
            <form id="frm">
           	 <a href="poll_list.jsp">
     		<span></span>
    		<span></span>
      		<span></span>
      		<span></span>
      		닫기
   			</a>
   </form>
   </div>
         </center>
</body>
</html>