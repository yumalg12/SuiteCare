<%@ page import="calendar.*"%>
<%@ page import="patient.*"%>
<%@ page import="caretaker.*"%>
<%@ page import="reservation.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 마이페이지</title>
<%@ include file="/header-import.jsp"%>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<link rel="stylesheet" href="../assets/css/fullcalendar.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<script>
		function insertTinfo() {
			window.location.href = "../careTaker/takerInfo.jsp";
		}

		function rescaregiver() {
			window.location.href = "../reservation/rescaretaker.jsp";
		}

		function delok() {
			if (!confirm("예약을 취소하시겠습니까?")) {
				return false;
			}
		}
	</script>
</head>

<body>
	<%@ include file="/header.jsp"%>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Eleifend vitae urna</p>
				<h2>SC SuiteCare</h2>
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
					<form name="patientinfo">
						<div class="table_wrapper">
						<table>
							<thead>
								<tr>
									<td>No.</td>
									<td>이름</td>
									<td>성별</td>
									<td>나이</td>
									<td>키</td>
									<td>몸무게</td>
									<td>진단명</td>
									<td>수정</td>
								</tr>
							</thead>
							<%
							request.setCharacterEncoding("utf-8");

							session.removeAttribute("caretaker_code");
							session.removeAttribute("res_code");
							
							TakerDAO dao = new TakerDAO();

							List<TakerVO> list = dao.takerList(m_id);
							for (int i = 0; i < list.size(); i++) {
								TakerVO listt = (TakerVO) list.get(i);

								String t_name = listt.getT_name();
								String t_gender = listt.getT_gender();
								String t_age = listt.getT_age();
								String t_height = listt.getT_height();
								String t_weight = listt.getT_weight();
								String diagnosis = listt.getDiagnosis();
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=t_name%></td>
								<td><%=t_gender%></td>
								<td><%=t_age%>세</td>
								<td><%=t_height%>cm</td>
								<td><%=t_weight%>kg</td>
								<td><%=diagnosis%></td>
								<td><a href='../careTaker/tUpdate.jsp?t_name=<%=t_name%>'>수정하기</a></td>
							</tr>
							<%
							}
							%>
						</table>
						</div>
					</form>
					<div style="text-align: center;" class="form_button">
						<input type="button" class="button special"
							onclick="insertTinfo();" value="피간병인 정보 등록하기">
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
						<h2>매칭 완료 정보</h2>
					</header>
					<div>
						<input type="button" class="button alt" id="calToggle" onclick="rescalendar();" value="달력으로 보기">
					</div>
					<div id='calendar'></div>
					<div id='restable'>
						<%
						calendar.CalendarDAO cdao = new calendar.CalendarDAO();
						List<calendar.CalendarVO> clist = cdao.listSchedule(m_id);
						%>
						<form name="resinfo">
							<table>
								<thead>
									<tr>
										<td>예약코드</td>
										<td>이름</td>
										<td>상세정보</td>
										<td>간병장소</td>
										<td>주소</td>
										<td>간병일시/시간</td>
										<td>매칭서비스정보</td>
										<td>간병인</td>
										<td>비고</td>
										<td>후기</td>
									</tr>
								</thead>
								<%
								PatientresDAO dao2 = new PatientresDAO();
								List<PatientresVO> reslist = dao2.comlistres(m_id);
								for (int i = 0; i < reslist.size(); i++) {
									PatientresVO listvo = (PatientresVO) reslist.get(i);

									String t_name = listvo.getCaretaker();
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

									String workTimes = start_time + "~" + end_time;
								%>

								<tr>
									<td><%=res_code%></td>
									<td><%=t_name%></td>
									<td><button onclick="openPopup('<%=res_code%>')">더보기</button></td>

									<td>
										<%
										if (location == null) {
										%> <a
										href="../reservation/rescareloc.jsp?res_code=<%=res_code%>">작성하기</a>
										<%
										} else if (location != null) {
										if (location.equals("home")) {
										%>자택<%
										} else {
										%><%=location%> <%
 										}
 										}
 										%>
									</td>

									<td>
										<%
										if (addr == null) {
										%> <a
										href="../reservation/rescareloc.jsp?res_code=<%=res_code%>">작성하기</a>
										<%
										} else if (addr != null) {
										%><%=addr%> <%
										 if (detail_addr != null) {
										 %><br><%=detail_addr%> <%
 										}
 										}
 										%>
									</td>

									<td>
										<%
										if (start_date == null) {
										%> <a
										href="../reservation/res_date.jsp?res_code=<%=res_code%>">작성하기</a>
										<%
										} else if (start_date != null) {
										%>일시 : <%=start_date%> ~ <br> <%=end_date%><br>시간 :
										<%=workTimes%> <%
 										}
 										%>
									</td>

									<td>
										<%
										List<TpreferenceVO> preList = dao2.listtpre(res_code);
										for (TpreferenceVO prevo : preList) {
											String pre_age_1 = prevo.getPre_age_1();

											if (pre_age_1 == null) {
										%> <a
										href="../reservation/matchService.jsp?res_code=<%=res_code%>">작성하기</a>
										<%
										} else if (pre_age_1 != null) {
										%><button onclick="openmatPopup('<%=res_code%>')">더보기</button>
										<%
										}
										}
										%>
									</td>

									<td>
										<%
										String g_name = listvo.getG_name();
										%> <a onclick="javascript:openGinfoMlist('<%=caregiver%>')""><%=g_name%></a>
										
									</td>

									<td>
										<%
											BookDAO bookDao = new BookDAO();
											String b_status = bookDao.status(res_code, caregiver);
											
											java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
											int result = today.compareTo(end_date);
											if(result > 0){ // 오늘 날짜가 서비스이용 마지막 날짜보다 이후이면 양수
												if(b_status.equals("서비스이용 완료")) {
										%>
													<p>서비스 이용 완료</p>
										<%
												} else {
										%>
													<p onclick="serviceComplete('<%=res_code%>', '<%=caregiver%>');" style="text-decoration:underline;">이용 확정하기</p>
										<%		
												}
											}
										%>
									</td>
									<td><button onclick="openrePopup('<%=res_code%>', '<%=caregiver%>')">후기작성</button></td>
								</tr>

								<%
								}
								%>
							</table>
						</form>
					</div>
					<div style="text-align: center;" class="form_button">
						<input type="button" class="button special"
							onclick="rescaregiver();" value="간병인 신청하기">
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
						<h2>예약 신청 정보</h2>
					</header>
					<div id='restable'>
						<form name="resinfo">
							<table>
								<thead>
									<tr>
										<td>예약코드</td>
										<td>이름</td>
										<td>상세정보</td>
										<td>간병장소</td>
										<td>주소</td>
										<td>간병일시/시간</td>
										<td>매칭서비스정보</td>
										<td>간병인</td>
										<td>비고</td>
									</tr>
								</thead>
								<%
								PatientresDAO dao3 = new PatientresDAO();
								List<PatientresVO> reslist3 = dao3.listres(m_id);
								for (int i = 0; i < reslist3.size(); i++) {
									PatientresVO listvo = (PatientresVO) reslist3.get(i);

									String t_name = listvo.getCaretaker();
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

									String workTimes = start_time + "~" + end_time;
								%>

								<tr>
									<td><%=res_code%></td> <td><%=t_name%></td> 
									<td><button onclick="openPopup('<%=res_code %>')">더보기</button></td>
									
									<td><% if(location==null) { %>
									<a href="../reservation/rescareloc.jsp?res_code=<%=res_code%>">작성하기</a> <%}	
									else if(location!=null){if(location.equals("home")) {%>자택<%} 
									else { %><%=location%><%}} %></td>
									
									<td><% if(addr==null) { %>
									<a href="../reservation/rescareloc.jsp?res_code=<%=res_code%>">작성하기</a> <%}	
									else if(addr!=null){%><%=addr%> 
									<%if(detail_addr!=null) {%><br><%=detail_addr%><%}} %></td> 
									
									<td><% if(start_date==null ) { %>
									<a href="../reservation/res_date.jsp?res_code=<%=res_code%>">작성하기</a> <%}	
									else if(start_date!=null){%>일시 : <%=start_date%> ~ <br> <%=end_date %><br>시간 : <%=workTimes%><%} %></td>
									
									<td><%
									List<TpreferenceVO> preList = dao2.listtpre(res_code);
									for(TpreferenceVO prevo : preList) {
										String pre_age_1 = prevo.getPre_age_1();
										
										if(pre_age_1 == null) { %>
										<a href="../reservation/matchService.jsp?res_code=<%=res_code%>">작성하기</a> <%}	
										else if(pre_age_1!=null){%><button onclick="openmatPopup('<%=res_code %>')">더보기</button>
										<%}} %></td>
										
									<td>
										<a href="../book/tapplyList.jsp?res_code=<%=res_code%>">매칭신청<br>리스트확인</a>
									</td>
									
									<td><a href="../reservation/resdelete.jsp?res_code=<%=res_code%>&caretaker_code=<%=caretaker_code%>"
										onclick="return delok();">취소</a></td>
								</tr>

								<%
								}
								%>
							</table>
							</div>
						</form>
					</div>
					<div style="text-align: center;" class="form_button">
						<input type="button" class="button special" onclick="rescaregiver();" value="간병인 신청하기">
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
	<%@ include file="/footer.jsp"%>
	<script>
	   function rescalendar() {
	       // 토글 버튼 변경하고 목록 테이블 없애기
	       document.getElementById('calToggle').setAttribute("onClick", "restable()");
	       document.getElementById('calToggle').value = "목록으로 보기";
	       document.getElementById('calToggle').style.position = "absolute";
	       document.getElementById('calToggle').style.top = "15.9rem";
	       document.getElementById('restable').style.display = "none";
	       document.getElementById('calendar').style.display = "";
	       
	       var calendarEl = document.getElementById('calendar');
	       var calendar = new FullCalendar.Calendar(calendarEl, {
	           contentHeight: 650,
	           initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	           locale: 'ko',
	           headerToolbar: { // 헤더에 표시할 툴 바
	               start: "",
	               center: "prev title next",
	               end: 'dayGridMonth,dayGridWeek,dayGridDay'
	           },
	           titleFormat: function(date) {
	               return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
	           },
	           selectable: true, // 달력 일자 드래그 설정가능
	           droppable: true,
	           editable: true,
	           nowIndicator:true, // 현재 시간 마크
	         events : [
	             <%for (CalendarVO cvo : clist) {%>
	                {
	                    title:'<%=cvo.getT_name()%>',
	                    start:'<%=cvo.getStart_date()%>',
	                    end:'<%=cvo.getEnd_date()%>',
	                    t_name:'<%=cvo.getT_name()%>',
	                    start_time:'<%=cvo.getStart_time()%>',
	                    end_time:'<%=cvo.getEnd_time()%>',
	                    res_code:'<%=cvo.getRes_code()%>',
	                    color:'#' + Math.round(Math.random() * 0xffffff).toString(16)
	                   
	                },
	            <%}%>
	         ],
	         eventClick:function(info){
	            var eventDetails=info.event.extendedProps;
	            var name=eventDetails.t_name;
	            var startTime=eventDetails.start_time;
	            var endTime=eventDetails.end_time;
	            var reservationCode=eventDetails.res_code;

	            var message="이름:"+name+"\n";
	            message+="시간:"+startTime+" ~ "+endTime+"\n";
	            message+="예약 코드:"+reservationCode;

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
	   document.getElementById('restable').style.display ="";
	   };

	   function openPopup(resCode) {
	   var popupUrl="mMain_detailInfo.jsp?popres_code="+resCode;
	   window.open(popupUrl,"Popup","width=800,height=800");
	   }

	   function openmatPopup(resCode) {
	   var popupUrl = "mMain_preInfo.jsp?popres_code=" + resCode;
	   window.open(popupUrl, "Popup", "width=800,height=800");
	   }

	   function openrePopup(resCode, gId) {
	   var popupUrl = "mReview.jsp?popres_code=" + resCode + "&popg_id=" + gId;
	   window.open(popupUrl, "Popup", "width=800,height=800");
	   }

	   function serviceComplete(code, caregiver) {
	   if (confirm("서비스 이용을 확정하시겠습니까? 이용 확정시 결제가 완료 되며 취소하실 수 없습니다.")) {
	   $.ajax({
	   type: "post",
	   async: false,
	   url: "<%=context%>/book/complete",
	   dataType: "json",
	   data: { code: code, caregiver: caregiver },
	   success: function (data, textStatus) {
	   console.log(data.complete);
	   if (data.complete == 0) {
	   alert("변경X");
	   } else if (data.complete == 1) {
	   alert("확정완료!!");
	   document.location.reload();
	   } else {
	   console.log("count: -1 (error)");
	   alert("오류가 발생했습니다.");
	   }
	   },
	   error: function (data, textStatus) {
	   console.log("data: " + data + " / textStatus: " + textStatus);
	   alert("오류가 발생했습니다.");
	   },
	   });
	   } else {
	   return;
	   }
	   }

	   function openGinfoMlist(gIdVal) {
	   window.open("<%=context%>/book/ginfoMlist.jsp?g_id="+gIdVal, "_blank", "width=800,height=800");
	   }
	</script>
</body>
</html>
