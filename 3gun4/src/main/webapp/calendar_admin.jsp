<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<link href='./lib/main.min.css' rel='stylesheet' />
<style>
.fc-event {
	margin-top: 5px;
	cursor: move;
	line-height: 25px;
	text-align: center;
	background-color: var;
}
.fc-h-event .fc-event-main {
    color: black;
}

</style>
<script src='./lib/main.js'></script>
<script src='./jquery-3.6.4.min.js'></script>
<script src='./lib/ko.js'></script>

<script>
	var calendar = null;
	$(document).ready(function() {
		var Calendar = FullCalendar.Calendar;
		var Draggable = FullCalendar.Draggable;

		var containerEl = document.getElementById('external-events');
		var calendarEl = document.getElementById('calendar');
		var checkbox = document.getElementById('drop-remove');

		// initialize the external events
		// -----------------------------------------------------------------
		var all_events = null;
		all_events = loadingEvents();
		new Draggable(containerEl, {
			itemSelector : '.fc-event',
			eventData : function(eventEl) {
				let bg_color = "";
				if(eventEl.innerText =="자바"){
					bg_color = "#ffafb0";
					
				}else if(eventEl.innerText =="파이썬"){
					bg_color = "#ffafd8";
				}else if(eventEl.innerText =="파이썬 라이브러리"){
					bg_color = "#eeb7b4";
				}else if(eventEl.innerText =="크롤링"){
					bg_color = "#f2cfa5";
				}else if(eventEl.innerText =="HTML/CSS"){
					bg_color = "#fcffb0";
				}else if(eventEl.innerText =="JSP/Servlet"){
					bg_color = "#aee4ff";
				}else if(eventEl.innerText =="Javascript"){
					bg_color = "#b5c7ed";
				}else if(eventEl.innerText =="즐거운 핵심 프로젝트"){
					bg_color = "#c4f4fe";
				}else if(eventEl.innerText =="라즈베리파이"){
					bg_color = "#bee9b4";
				}else if(eventEl.innerText =="아두이노"){
					bg_color = "#fdfa87";
				}else if(eventEl.innerText =="머신러닝"){
					bg_color = "#fcc6f7";
				}else if(eventEl.innerText =="딥러닝"){
					bg_color = "#caa6fe";
				}else if(eventEl.innerText =="안드로이드"){
					bg_color = "#ffafd8";
				}else if(eventEl.innerText =="Spring"){
					bg_color = "#afffba";
				}else if(eventEl.innerText =="React.js"){
					bg_color = "#e2ffaf";
				}else if(eventEl.innerText =="Node.js"){
					bg_color = "#83a7a3";
				}else if(eventEl.innerText =="하둡"){
					bg_color = "#acb890";
				}else if(eventEl.innerText =="시험"){
					bg_color = "#ff3232";
				}else if(eventEl.innerText =="특강"){
					bg_color = "#bb8e61";
				}else if(eventEl.innerText =="멘토링"){
					bg_color = "#c3927a";
				}else if(eventEl.innerText =="즐거운휴일"){
					bg_color = "#dfd4e4";
				}
					
				return {
					title : eventEl.innerText,
					backgroundColor:bg_color,
					textColor:"#000"
				};
			}
		});

		// initialize the calendar
		// -----------------------------------------------------------------

		calendar = new Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			editable : true,
			droppable : true, // this allows things to be dropped onto the calendar
			events : all_events,
			eventClick : function(info) {
				if(confirm("일정을 지울까요?")){
				info.event.remove();
				}
			},
			drop : function(info) {
				// is the "remove after drop" checkbox checked?
				if (checkbox.checked) {
					// if so, remove the element from the "Draggable Events" list
					info.draggedEl.parentNode.removeChild(info.draggedEl);
				}
			},
			locale : 'ko'
		});

		calendar.render();
		calendar.removeALLEvents
	});

	function allSave() {
		var allEvent = calendar.getEvents();

		var events = new Array();
		for (var i = 0; i < allEvent.length; i++) {
			var obj = new Object();

			obj.title = allEvent[i]._def.title; //이벤트 명칭
			obj.allday = allEvent[i]._def.allDay; //하루 종일의 이벤트인지 알려주는 bollean 값
			obj.start = allEvent[i]._instance.range.start; //시작날짜 및 시간
			obj.end = allEvent[i]._instance.range.end; //끝날짜 및 시간

			events.push(obj);
		}
		var jsondata = JSON.stringify(events);
		console.log(jsondata);

		savedata(jsondata);
	}

	function loadingEvents() { //데이터불러오깅
		var return_value = null;
		$.ajax({
			type : 'post',
			url : "getdataCon",
			data : {},
			dataType : 'json',
			async : false
		}).done(function(result) {
			return_value = result;
		}).fail(function(request, status, error) {
			alert("에러 발생:" + error);
		})

		return return_value;
	}

	function savedata(jsondata) { //데이터저장
		$.ajax({
			type : 'post',
			url : "savedataCon",
			data : {
				"alldata" : jsondata
			},
			dataType : 'text',
			async : false
		}).done(function(result) {
			alert(result);
		}).fail(function(request, status, error) {
			alert("에러 발생:" + error);
		})
	}
</script>
</head>
<body>
	<div id='external-events'
		style="float: left; width: 15%; padding-right: 30px; padding-left: 20px; margin-top: 110px">
		<p>
			<strong>아래 수업을 드래그하여 배정하세요</strong>
		</p>

		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #ffafb0;">
			<div class='fc-event-main'>자바</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #ffafd8;">
			<div class='fc-event-main'>파이썬</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #eeb7b4;">
			<div class='fc-event-main'>파이썬 라이브러리</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #f2cfa5;">
			<div class='fc-event-main'>크롤링</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #fcffb0;">
			<div class='fc-event-main'>HTML/CSS</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #aee4ff;">
			<div class='fc-event-main'>JSP/Servlet</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #b5c7ed;">
			<div class='fc-event-main'>Javascript</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #c4f4fe;">
			<div class='fc-event-main'>즐거운 핵심 프로젝트</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #bee9b4;">
			<div class='fc-event-main'>라즈베리파이</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #fdfa87;">
			<div class='fc-event-main'>아두이노</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #fcc6f7;">
			<div class='fc-event-main'>머신러닝</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #caa6fe;">
			<div class='fc-event-main'>딥러닝</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #ffafd8;">
			<div class='fc-event-main'>안드로이드</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #afffba;">
			<div class='fc-event-main'>Spring</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #e2ffaf;">
			<div class='fc-event-main'>React.js</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #83a7a3;">
			<div class='fc-event-main'>Node.js</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #acb890;">
			<div class='fc-event-main'>하둡</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #ff3232;">
			<div class='fc-event-main'>시험</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #c3927a;">
			<div class='fc-event-main'>멘토링</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #bb8e61;">
			<div class='fc-event-main'>특강</div>
		</div>
		<div
			class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' style="background-color: #dfd4e4;">
			<div class='fc-event-main'>즐거운휴일</div>
		</div>
		<p>
			<input type='checkbox' id='drop-remove' /> <label for='drop-remove'>드래그앤
				드롭후 제거</label>
		</p>
		<center> <button
					style="border-radius: 5px; width: 120px; height: 40px; background-color: #3788d8; color: white; vertical-align: middle; font-size: 17px; cursor: pointer"
					onclick="javascript:allSave();">전체저장</button> 
				<button
					style="border-radius: 5px; width: 120px; height: 40px; background-color: #3788d8; color: white; vertical-align: middle; font-size: 17px; cursor: pointer"
					onclick="location.href='main.jsp'">메인으로</button>
					</center>
	</div>
	<div style="float: left; width: 80%">
		<div
			style="height: 30px; text-align: center; font-size: 35px; color: white; margin-bottom: 30px; font-weight: bold">
			<div style="width: 60%; float: left; text-align: right"></div>
			<div style="width: 40%; float: left; text-align: right">
				
			</div>
		</div>
		<div id='calendar'></div>
		
	</div>
</body>
</html>