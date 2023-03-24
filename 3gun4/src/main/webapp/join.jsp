<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>회원가입</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<link href="/static/package/view.min.css?1678183911374" rel="stylesheet"
	type="text/css">
<script src="/static/package/view-resource.min.js?1678183911374"></script>
<script>
	screenWidth = 978;
	projectId = "WEQ1raDpADVvisaKAv3lAVlMhQfQ0yPE";
	sequenceId = "zmqag";
</script>
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

.login-box {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
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
.login-box .user-box label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #03e9f4;
  font-size: 12px;
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
  margin-top: 40px;
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
.pl{
    width: 300px;
    border: 1px solid rgba(30,30,30,.5);
    box-sizing: border-box;
    border-radius: 10px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 1px solid rgba(30,30,30,.5);
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid rgba(30,30,30,.5);
    border-radius: 10px;
}

#check{
 float: right; margin: -72px 0 0 100px; 
 position: relative;
}
</style>

</head>

<body>

	<div class="login-box">
  <h2>회원가입</h2>
  
  <form action="joincon">
   
    <div class="user-box">
      <input type="text" name="id" required="">
      <label>아이디</label>
    </div>
   		 <td>
    		<a href="#" onclick="check()" id="check">
     			<span></span>
    			<span></span>
      			<span></span>
      			<span></span>
      			중복확인
   			 </a>
    	</td>
    
    <div class="user-box">
      <input type="password" name="pw" required="">
      <label>비밀번호</label>
    </div>
    <div class="user-box">
      <input type="text" name="name" required="">
      <label>이름</label>
    </div>
    <div class="user-box">
      <input type="text" name="phonenum" required="">
      <label>전화번호</label>
    </div>
    <div class="user-box">
        <select name="class_name" id="" class="pl">
            <option value="0" selected>담임선생님 성함을 선택해주세요.</option>
            <option value="python">임승환</option>
            <option value="java">박우빈</option>
            <option value="javascript">김태경</option>
            <option value="c#">서승현</option>
        </select>
      <label></label>
    </div>
    <table align="center">
    <tr>
    	<td>
    		<a href="#" onclick="return chk_form()">
     			<span></span>
    			<span></span>
      			<span></span>
      			<span></span>
      			회원가입
   			 </a>
   			 <input style="display: none" type="submit" id="join_btn">
    	</td>
    	<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
    	<td>
    		<a href="login.jsp">
     			<span></span>
    			<span></span>
      			<span></span>
      			<span></span>
      			뒤로가기
   			 </a>
    	</td>
    	
    </tr>
    </table>
    
  </form>
</div>
<script src="jquery-3.6.4.min.js"></script>
<script>
function chk_form() {
document.getElementById('join_btn').click();
}

function check() {
	/* name="email"인 친구가. 2개라서 1번째 인덱스에 있는 친구 가져오기! */
	var id = $('input[name=id]').val();
	console.log(id);
	 	$.ajax({
			url : "idcheckcon", /* 어디로 보낼건지? */
			data : {
				id : id
			}, /* 어떤 데이터를 보낼 것인지? */
			//System.out.println(id);
			dataType : "text", /* 데이터를 어떤 형태로 받아올 것인지 */
			success : function(data){ /* 성공 시 */
				if(data=='false'){
					alert('중복되는 아이디가 없습니다~!'); 
				}else{
					alert('아이디가 중복됩니다!');
				}
			},
			error:function(e){
				alert('실패');
				console.log(e);
			}
			
		}) 
};
</script>
</body>

</html>