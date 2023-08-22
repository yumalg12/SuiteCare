<%@ page import="calendar.*"%>
<%@ page import = "patient.*" %>
<%@ page import = "book.*" %>
<%@ page import = "caretaker.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Time" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 마이페이지</title>
<%@ include file="/header-import.jsp"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<style>
.fc-col-header {
    margin: 0;
    padding: 0;
}
.fc-daygrid-day-number, .fc-col-header-cell-cushion {
text-decoration:none;
 cursor: default;
}
.fc-daygrid-day:hover{
font-weight: bold;
background-color: #DFD7BF50;
}
.fc-scroller{
overflow:hidden !important;
}
.fc .fc-button-primary{
background-color: transparent;
border: none;
outline: none;
}
.fc .fc-button-primary:hover{
background-color: #cccccc50;
}
.fc .fc-daygrid-day.fc-day-today{
background-color: #A4907Caa;
font-weight: bold;
}
.fc .fc-button-primary:not(:disabled):active, .fc .fc-button-primary:not(:disabled).fc-button-active{
background-color: #DFD7BFaa;
font-weight: bold;
}
.fc .fc-toolbar.fc-header-toolbar{
margin-left: 7.2rem;
}
.fc .fc-toolbar-title {
    font-size: 1.75em;
    margin: 0;
    display: inline;
    position: relative;
    top: 0.4rem;
}
</style>

</head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
	<link rel="stylesheet" href="../assets/css/fullcalendar.css">
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
								<p>나와 피간병인의</p>
								<h2>매칭 정보</h2>
							</header>
							<div>
						<input type="button" class="button alt" id="calToggle" onclick="grescalendar();" value="달력으로 보기">
					</div>
					<div id='calendar'></div>
					<div id='restable'>
					<%	String g_id = (String)session.getAttribute("g_id");
						calendar.CalendarDAO cdao = new calendar.CalendarDAO();
						List<calendar.CalendarVO> glist = cdao.listgSchedule(g_id);
						%>
			<form name="matchinginfo">
			<div class="table_wrapper">
			<table border=1>
			<tr><td>이름</td><td>날짜</td><td>시간</td><td>지역</td><td>결제금액</td><td>지급 예정일</td><td>정보</td></tr>
			<%
			request.setCharacterEncoding("utf-8");
			
			
			ReservationDAO dao = new ReservationDAO();
			List<ReservationVO> list = dao.resList(g_id);
			for(int i=0; i<list.size(); i++) {
				ReservationVO listvo = (ReservationVO) list.get(i);

				String res_code = listvo.getRes_code();
	            String location = listvo.getLocation();
	            if(location.equals("home")) {location="자택";}
	            
	            String start_date = listvo.getStart_date();
				String end_date = listvo.getEnd_date();
				String start_time = listvo.getStart_time();
				String end_time = listvo.getEnd_time();
				
				String workDate = start_date.substring(5) + " ~ " + end_date.substring(5);
				String workTimes = start_time.substring(0,5) + " ~ " + end_time.substring(0,5);
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

				Date endDate = dateFormat.parse(end_date);

				Calendar cal = Calendar.getInstance();
				cal.setTime(endDate);
				cal.add(Calendar.DAY_OF_MONTH, 8);
				Date lastDate = cal.getTime();
				String paymentdate = dateFormat.format(lastDate);

				
				String t_name = listvo.getT_name();

        		out.println("<tr><td>" + t_name + "</td><td>" + workDate + "</td><td>" + workTimes + "</td>");
				out.println("<td>" + location + "</td><td>" + "결제금액" + "</td><td>" + paymentdate + "</td>");
				out.println("<td><a href='../careGiver/matchingInfo.jsp?res_code=" + res_code +"'>더보기</a></td></tr>");
			}
			%>
			</table> 
			</div>
			</form>
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
								<p>나에게 들어온</p>
								<h2>피간병인 신청 리스트</h2>
							</header>
			<form name="applyinfo">
			<div class="table_wrapper">
			<table>
			<thead>
			<tr><td>예약코드</td><td>성별</td><td>나이</td><td>지역</td><td>근무기간</td>
			<td>근무시간</td><td>결제 예정 금액</td><td>상세정보</td><td>매칭신청현황</td></tr>

			</thead>
			<% PatientresDAO dao2 = new PatientresDAO();
			List<PatientresVO> reslist = dao2.applylist();
			for(int i=0; i<reslist.size(); i++) {
				PatientresVO listvo = (PatientresVO) reslist.get(i);
	
				String name = listvo.getCaretaker();
				String gender = listvo.getT_gender();
				String age = listvo.getT_age();
				Date start_date = listvo.getStartdate();
				Date end_date = listvo.getEnddate();
				Time start_time = listvo.getStarttime();
				Time end_time = listvo.getEndtime();
				String caregiver = listvo.getCaregiver();
				String res_code = listvo.getRes_code();
				String caretaker_code = listvo.getCaretaker_code();
				String location = listvo.getLocation();

	            
  
        		String addr = listvo.getAddr();
	      		String detail_addr = listvo.getDetail_addr();
			
	      if(location!=null && addr!=null && start_date!=null && start_time!=null && caregiver==null) {
	            
				String workDate = start_date + "~" + end_date;
				String workTimes = start_time + "~" + end_time;

				long worktime = end_time.getTime() - start_time.getTime();
				int workHours = (int) (worktime / (1000 * 60 * 60));

				int totalWorkDays =  (int) ((end_date.getTime() - start_date.getTime()) / (1000 * 60 * 60 * 24)) + 1; 
	
				int salary = totalWorkDays * workHours * 10000;
	
	 			String fSalary = String.format("%,d", salary);
	 			
	 			 int idx = addr.indexOf(" ");
		            String address = addr.substring(0, idx); 
			%>

			 <tr><td> <%=res_code %> </td><td> <%=gender %> </td><td> <%=age %> </td>
			 <td><%=address %></td><td><%=workDate %> </td><td><%=workTimes %></td> 
			 <td> <%=fSalary%>원 </td>
			<td><a href="../reservation/resInfo.jsp?res_code=<%= res_code %>&caretaker_code=<%=caretaker_code %>">더보기</a></td>
			<td> <%
			BookDAO bdao = new BookDAO();
			List<BookVO> blist = bdao.listbst(g_id, res_code);
			
			if(blist.isEmpty()) {
				%> 미신청 <% } else {
			for(int j=0; j<blist.size(); j++) {
				BookVO blistvo = (BookVO) blist.get(j);
				String b_status = blistvo.getB_status();
				
				if(b_status!=null) {
				%>
				<%=b_status %>
				<%
				} else { %>
				 미신청
				<% }}}
				%> </td></tr>
			<%
			}}
			%>
			</table>
			</div>
			</form>

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
								<p>내가 지원한</p>
								<h2>피간병인 신청 리스트</h2>
							</header>
			<form name="matchinfo">
			<div class="table_wrapper">
			<table>
			<thead>
			<tr><td>예약코드</td><td>이름</td><td>지역</td><td>근무기간</td><td>근무시간</td><td>상세정보</td><td>매칭신청현황</td></tr>

			</thead>
			<% 
			List<PatientresVO> matlist = dao2.applylist();
			for(int i=0; i<matlist.size(); i++) {
				PatientresVO listmat = (PatientresVO) matlist.get(i);
	
				String name = listmat.getCaretaker();
				String gender = listmat.getT_gender();
				String age = listmat.getT_age();
				Date start_date = listmat.getStartdate();
				Date end_date = listmat.getEnddate();
				Time start_time = listmat.getStarttime();
				Time end_time = listmat.getEndtime();
				String caregiver = listmat.getCaregiver();
				String res_code = listmat.getRes_code();
				String caretaker_code = listmat.getCaretaker_code();
				String location = listmat.getLocation();

	            
  
        		String addr = listmat.getAddr();
	      		String detail_addr = listmat.getDetail_addr();
	      		
	      		 BookDAO bkdao = new BookDAO();
					List<BookVO> bklist = bkdao.listbst(g_id, res_code);
					
					if(!bklist.isEmpty()) {
						for(int j=0; j<bklist.size(); j++) {
							BookVO bklistvo = (BookVO) bklist.get(j);
							String b_status = bklistvo.getB_status();
			
	      if(location!=null && addr!=null && start_date!=null && start_time!=null && b_status!=null ) {
	            
				String workDate = start_date + "~" + end_date;
				String workTimes = start_time + "~" + end_time;

	 			
	 			 int idx = addr.indexOf(" ");
		            String address = addr.substring(0, idx); 
		            
			%>

			 <tr><td> <%=res_code %> </td><td> <%=name %> </td>	 <td><%=address %></td><td><%=workDate %> </td><td><%=workTimes %></td> 
			<td><a href="../reservation/resInfo.jsp?res_code=<%= res_code %>&caretaker_code=<%=caretaker_code %>">더보기</a></td>
			<td> <%=b_status %> </td></tr>
			<%
			}}}}
			%>
			</table>
			</div>
			</form>

						</div>
					</div>
				</div>
			</section>	
								
<%@include file="/footer.jsp"%>					

</body>
<script>
		function grescalendar() {
			//토글버튼 변경하고 목록 테이블 없애기
			document.getElementById('calToggle').setAttribute("onClick", "restable()");
			document.getElementById('calToggle').value = "목록으로 보기";
			document.getElementById('calToggle').style.position = "absolute";
			document.getElementById('calToggle').style.top = "15.9rem";
			document.getElementById('restable').style.display = "none";
			document.getElementById('calendar').style.display = "";
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
					 <%for (CalendarVO gvo : glist) {%>
		             {
		                 title: '<%=gvo.getT_name()%>',
		                 start: '<%=gvo.getStart_date()%>',
		                 end: '<%=gvo.getEnd_date()%>',
		                 t_name: '<%=gvo.getT_name()%>',
		                 start_time: '<%=gvo.getStart_time()%>',
		                 end_time: '<%=gvo.getEnd_time()%>',
		                 res_code: '<%=gvo.getRes_code()%>',
		                 color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
		                
		             },
		         <%}%>
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
		};

		function restable() {
			//토글버튼 변경하고 달력 없애고 목록 표시하기
			document.getElementById('calToggle').setAttribute("onClick", "rescalendar()");
			document.getElementById('calToggle').value = "달력으로 보기";
			document.getElementById('calToggle').style.position = "";
			document.getElementById('calToggle').style.top = "";
			document.getElementById('calendar').style.display = "none";
			document.getElementById('restable').style.display = "";
		};

		
	</script>
</html>