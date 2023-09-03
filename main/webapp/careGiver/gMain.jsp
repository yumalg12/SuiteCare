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
<%@ page import = "java.util.concurrent.TimeUnit" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 마이페이지</title>
<%@ include file="/header-import.jsp"%>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
	<link rel="stylesheet" href="<%=context %>/assets/css/fullcalendar.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<script>
document.addEventListener('DOMContentLoaded', () => {
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const page = urlParams.get('page');

	Array.from(document.getElementById("page-allapplylist").getElementsByTagName("li")).forEach(e => {
		if (e.outerText === page) {
			e.classList.add('button');
		}
	});
});
</script>

<style>
.pagination {
	display: flex;
	padding-left: 0;
	list-style: none;
	justify-content: center;
}

.page-item{
	padding: 0 0.8rem;
	height: fit-content;
	line-height: 2;
	cursor: pointer;
	color:#423730;
}

.page-item:hover {
	box-shadow: inset 0 0 0 2px rgba(144, 144, 144, 0.25);
    border-radius: 2px;
}
</style>
</head>
	
<body>
	<%@ include file="/header.jsp" %>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Premium Caregiver Matching Platform</p>
				<h2>Generic Page Template</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="matchinfo" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>나와 피간병인의</p>
						<h2>매칭 정보</h2>
					</header>
					<div>
						<input type="button" class="button alt" id="calToggle" onclick="rescalendar();" value="달력으로 보기">
					</div>
					<div id='calendar'></div>
					<div id='restable'>
						<%	
							BookDAO bdao = new BookDAO();
							calendar.CalendarDAO cdao = new calendar.CalendarDAO();
							List<calendar.CalendarVO> glist = cdao.listgSchedule(g_id);
						%>

						<form name="matchinginfo">
							<div class="table_wrapper">
								<table border=1>
									<thead>
										<tr><td>이름</td><td>날짜</td><td>시간</td><td>지역</td><td>결제금액</td><td>지급 예정일</td><td>정보</td></tr>
									</thead>
									<tbody>
									<%
										ReservationDAO dao = new ReservationDAO();
										List<ReservationVO> listres = dao.resList(g_id);
										for(int i=0; i<listres.size(); i++) {
											ReservationVO listvo = (ReservationVO) listres.get(i);
									
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
											
											Date startDate = dateFormat.parse(start_date);
											Date endDate = dateFormat.parse(end_date);
									
											Calendar cal = Calendar.getInstance();
											cal.setTime(endDate);
											cal.add(Calendar.DAY_OF_MONTH, 7);
											Date lastDate = cal.getTime();
											String paymentdate = dateFormat.format(lastDate);
									
											
											String t_name = listvo.getT_name();
											
											String ghourwage = bdao.ghourwage(res_code, g_id);
											int hourwage = Integer.parseInt(ghourwage);
											
											SimpleDateFormat dFormat = new SimpleDateFormat("HH:mm");
											Date starttime = dFormat.parse(start_time);
											Date endtime = dFormat.parse(end_time);
								           
											long workdate = endDate.getTime() - startDate.getTime();
											long dworkdate = TimeUnit.MILLISECONDS.toDays(workdate); // 밀리초 단위 근무일자를 일자단위로 변환
											long worktime = endtime.getTime() - starttime.getTime();
											long hworktime = TimeUnit.MILLISECONDS.toHours(worktime); // 밀리초 단위 근무시간을 시간단위로 변환
											
											int wdate = (int) (dworkdate+1);
											int totalSalary = (int) (wdate * hworktime * hourwage);
								
								      		out.println("<tr><td>" + t_name + "</td><td>" + workDate + "</td><td>" + workTimes + "</td>");
											out.println("<td>" + location + "</td><td>" + totalSalary + "원</td><td>" + paymentdate + "</td>");
											out.println("<td><a href='../careGiver/matchingInfo.jsp?res_code=" + res_code +"'>더보기</a></td></tr>");
										}
									%>
									</tbody>
								</table> 
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
						
							
							
							
	<!-- three -->
	<section id="allapplylist" class="wrapper style2">
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
									<td>근무시간</td><td>상세정보</td><td>매칭신청현황</td></tr>
								</thead>
								<c:choose>
									<c:when test="${empty listresA }">
										<tr>
                                    		<td colspan="8" style="text-align:center;">들어온 신청이 없습니다</td>
                                   		</tr>
									</c:when>
									<c:when test="${!empty listresA }">
										<c:set var="MyResCode" value="${MyResCode }"/>
										<c:forEach var="listresA" items="${listresA }">
											<c:set var="address" value="${fn:split(listresA.addr,' ')}" />
											<tr>
												<td>${listresA.res_code }</td><td>${listresA.t_gender }</td><td>${listresA.t_age }</td>
												<td>${address[0]}</td><td>${listresA.startdate } ~ ${listresA.enddate }</td><td>${listresA.starttime } ~ ${listresA.endtime }</td>
												<td><span onclick="takerInfo('${listresA.res_code }','${listresA.caretaker_code }');" style="text-decoration: underline;cursor:pointer;">더보기</span></td>
	                      <td><c:if test="${!fn:contains(MyResCode, listresA.res_code)}">미신청</c:if></td>
	                    </tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</table>
						</div>
					</form>
					<div>
						<ul class="pagination pagination-lg" id="page-allapplylist">
							<%-- <c:set var="current" value="${page }"/> --%>
							<c:forEach var="page" begin="1" end="${pages }" step="1">
								<li class="page-item" onclick="page(${page},'allapplylist')">
									${page}
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>	
			
			
	<!-- four -->
	<section id="myapplylist" class="wrapper style2">
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
									<tr><td>예약코드</td><td>이름</td><td>지역</td><td>근무기간</td><td>근무시간</td>
									<td>상세정보</td><td>시급</td><td>매칭신청현황</td><td>비고</td></tr>
								</thead>
								<c:forEach var="myApply" items="${myApply }">
									<tr><td>${myApply.res_code }</td><td>${myApply.t_name }</td>	 
									<td>
									
									<c:set var="location" value="${fn:split(myApply.addr,' ')}" />
									${location[0]}
									</td>
									<td>${myApply.start_date } ~ ${myApply.end_date }</td><td>${myApply.start_time } ~ ${myApply.end_time }</td> 
									<td><a href="./reservation/resInfo.jsp?res_code=${myApply.res_code }&caretaker_code=${myApply.caretaker_code }">더보기</a></td>
									<td>${myApply.hourwage }</td>
									<td>${myApply.b_status }</td>
									<td>
										<c:if test="${myApply.b_status eq '신청완료' }">
											<a href="../book/deleteapply.jsp?res_code=${myApply.res_code }" onclick="return deleteok();">신청취소</a>
										</c:if>
									</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</form>

				</div>
			</div>
		</div>
	</section>	
			
			
			
	<!-- five -->
	<section id="finishlist" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>내가 수행한</p>
						<h2>간병 완료 목록</h2>
					</header>
					<form name="finishform">
						<div class="table_wrapper">
							추가 필요
						</div>
					</form>

				</div>
			</div>
		</div>
	</section>	
								
<%@include file="/footer.jsp"%>					

</body>
<script>
		function rescalendar() {
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

	
		function deleteok() {
			if (!confirm("매칭신청을 취소하시겠습니까?")) {
				return false;
			}
		}

		function page(page, position) {
			var path = "<%=context %>/caregiver/main?page=" + page + "#" + position;
			location.href=path;
		}
		
		function takerInfo(res_code, taker_code) {
			window.open("<%=context %>/reservation/resInfo.jsp?res_code=" + res_code + "&caretaker_code=" + taker_code, "name(about:blank)", "width=800, height=950");
		}
		

		function openMatchInfo(res_code){
			window.open("<%=context%>/careGiver/matchingInfo.jsp?res_code="+res_code, "name(about:blank)", "width=800, height=950");
		}

	</script>
</html>
