<%@ page import = "calendar.*" %>
<%@ page import = "patient.*" %>
<%@ page import = "caretaker.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Time" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
    request.setCharacterEncoding("UTF-8");
    String m_id = (String)session.getAttribute("m_id");
    calendar.CalendarDAO cdao = new calendar.CalendarDAO();
    List<calendar.CalendarVO> clist = cdao.listSchedule(m_id);
%>   
<!DOCTYPE html>
<html>
	<head>
		<title>SC 스위트케어 | 마이페이지</title>
<%@ include file="/header-import.jsp" %>

	</head>
	
	<script>

		function insertTinfo() {
			window.location.href = "../careTaker/takerInfo.jsp";
		}
		function rescaregiver() {
			window.location.href = "../reservation/rescaretaker.jsp";
		}
		
		function restable() {
			window.location.href = "../member/mMain.jsp";
		}
		</script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
	<body>
<%@ include file="/header.jsp" %>

	<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>Eleifend vitae urna</p>
						<h2>Generic Page Template</h2>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>간병 받을 분</p>
								<h2>기본 정보</h2>
							</header>
		<% 
		request.setCharacterEncoding("utf-8");

		TakerDAO dao = new TakerDAO();

		
		List<TakerVO> list = dao.takerList(m_id);
		for(int i=0; i<list.size(); i++) {
			TakerVO listt = (TakerVO) list.get(i);
	
			String t_name = listt.getT_name();
			String t_gender = listt.getT_gender();
			String t_age = listt.getT_age();
			String t_height = listt.getT_height();
			String t_weight = listt.getT_weight();
			String diagnosis = listt.getDiagnosis();
	
			%>
	
		<form name="patientinfo">
		<table>
		<tr><td>이름</td><td> 성별</td> <td> 나이 </td> <td> 키</td> <td> 몸무게 </td><td> 진단명 </td><td> 수정 </td></tr>
		<tr><td> <%=t_name %> </td><td> <%=t_gender %> </td><td> <%=t_age %> </td> <td> <%=t_height %>cm </td> <td> <%=t_weight %>kg </td> <td> <%=diagnosis %> </td><td><a href='../careTaker/tUpdate.jsp?t_name=<%=t_name %>'>수정하기</a></td></tr>
		</table> 
		</form>

		<%
		}

		%>
		<div style="text-align: center;" class="form_btn">
		<input type="button" class = "button special" onclick="insertTinfo();" value="피간병인 정보 등록하기">
			</div>
			</div>
			</div>
			</div>
			</section>
						
							
							
							
		<!-- three -->
			<section id="three" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>간병인 서비스</p>
								<h2>예약 정보</h2>
							</header>
			<div id='calendar'></div>
			<div style="text-align: center;" class="form_btn">
			<input type="button" class = "button special" onclick="rescaregiver();" value="간병인 신청하기">
			<input type="button" class = "button special" onclick="restable();" value="표로 보기">
			</div>
			</div>
			</div>
			</div>
			</section>
		<!-- four -->
			<section id="four" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>스위트 케어</p>
								<h2>빠른 매칭 서비스</h2>
							</header>
							</div>
							</div>
							</div>
							</section>
							
<%@include file="/footer.jsp" %>
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		contentHeight: 650,
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		locale : 'ko',
		headerToolbar : { // 헤더에 표시할 툴 바
			start : "",
			center : "prev title next",
            end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		
		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,
		editable : true,
		nowIndicator: true, // 현재 시간 마크
		events : [
			 <% for (CalendarVO cvo : clist) { %>
             {
                 title: '<%= cvo.getT_name() %>',
                 start: '<%= cvo.getStart_date() %>',
                 end: '<%= cvo.getEnd_date() %>',
                 t_name: '<%= cvo.getT_name() %>',
                 start_time: '<%= cvo.getStart_time() %>',
                 end_time: '<%= cvo.getEnd_time() %>',
                 res_code: '<%=cvo.getRes_code()%>',
                 color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                
             },
         <% } %>
				] ,
		 eventClick: function(info) {
	            // 이벤트를 클릭하면 이벤트 세부 정보를 추출합니다.
	            var eventDetails = info.event.extendedProps;
	            var name = eventDetails.t_name;
	            var startTime = eventDetails.start_time;
	            var endTime = eventDetails.end_time;
	            var reservationCode = eventDetails.res_code;

	            // 이벤트 세부 정보를 담은 알림창을 생성합니다.
	            var message = "이름: " + name + "\n";
	            message += "시간: " + startTime + " ~ " + endTime + "\n";
	            message += "예약 코드: " + reservationCode;

	            alert(message);
	        }
	});
	calendar.render();
});
</script>
</html>