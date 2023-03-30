<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>calendar</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='./lib/ko.js'></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var all_events = null;
		all_events = loadingEvents();
		var calendar = new FullCalendar.Calendar(calendarEl, {
			timeZone : 'UTC',
			initialView : 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
			events : all_events,
			editable : false, // false로 변경 시 draggable 작동 x 
			locale : 'ko',
		});
		calendar.render();
	});

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
</script>
<style>
#calendarBox {
	width: 70%;
	padding-left: 15%;
}
.fc-daygrid-day-number{
	color: #fff;
}
.fc-col-header-cell-cushion{
	color: #fff;
}
.fc-toolbar-title{
	color: #fff;
}
.fc .fc-button:disabled{
	opacity:none;
}
.fc-day-sun{
background-color: #FF000022;
}
.fc-day-sat{
background-color: #0000FF22;
}
</style>
</head>
<body>
	<div id="calendarBox" style="width: 100%;padding-left: 0;">
		<div id="calendar"></div>
	</div>
</body>
</html>