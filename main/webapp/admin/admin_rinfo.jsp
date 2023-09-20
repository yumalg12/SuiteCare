<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="caretaker.*"%>
<%@ page import="reservation.*"%>
<%@ page import="patient.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML>
<html>
<head>
<title>SC 스위트케어 | 예약정보</title>
<%@ include file="/header-import.jsp"%>
</head>

<body>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>예약 상세 정보</p>
						<h2></h2>
					</header>
					
					<form name="rinfo">
					<%
					request.setCharacterEncoding("utf-8");
					String res_code = request.getParameter("res_code");
					String caretaker_code = request.getParameter("caretaker_code");

					PatientresDAO dao = new PatientresDAO();
					List<PatientresVO> reslist = dao.resInfo(res_code, caretaker_code);
					for (int i = 0; i < reslist.size(); i++) {
						PatientresVO listvo = (PatientresVO) reslist.get(i);

						String name = listvo.getCaretaker();
						String gender = listvo.getT_gender();
						String age = listvo.getT_age();
						Date start_date = listvo.getStartdate();
						Date end_date = listvo.getEnddate();
						Time start_time = listvo.getStarttime();
						Time end_time = listvo.getEndtime();
						String caregiver = listvo.getCaregiver();
						String location = listvo.getLocation();
						String addr = listvo.getAddr();
						String detail_addr = listvo.getDetail_addr();
						String t_height = listvo.getT_height();
						String t_weight = listvo.getT_weight();
						String diagnosis = listvo.getDiagnosis();
						String consciousness = listvo.getConsciousness();
						String care_meal_yn = listvo.getCare_meal_yn();
						String care_toilet=listvo.getCare_toilet();
						String state_paralysis=listvo.getState_paralysis();
						String state_mobility=listvo.getState_mobility();
						String bedsore_yn=listvo.getBedsore_yn();
						String suction_yn=listvo.getSuction_yn();
						String outpatient_yn=listvo.getOutpatient_yn();
						String care_night_yn=listvo.getCare_night_yn();
						String notice=listvo.getNotice();


						String workDate = start_date + " - " + end_date;
						String workTimes = start_time + " - " + end_time;

						int idx = addr.indexOf(" ");
						String address = addr.substring(0, idx);
					%>

						<div class="form_wrapper">
						<div>
							<h3>간병 정보</h3>

							<div class="form_row">
								<label for="res_code">예약코드</label> 
								<input type="text" value="<%=res_code%>"  readonly>
							</div>

							<div class="form_row">
								<label for="address">지역</label> <input type="text"
									value="<%=address%>" readonly>
							</div>

							<div class="form_row">
								<label for="workDate"> 간병 기간</label> <input type="text"
									value="<%=workDate.substring(0,10)%> ~ <%=workDate.substring(13)%>" readonly>
							</div>

							<div class="form_row">
								<label for="workTimes"> 출퇴근 시간 </label> <input type="text"
									value="<%=workTimes%>" readonly>
							</div>
							
						</div>
							<hr>
							<div>
							<h3>환자 기본 정보</h3>

							<div class="form_row">
								<label for="t_name">피간병인 정보</label> <input type="text" value="<%=name%> (<%=age%>세, <%=gender%>성)" readonly>
							</div>
							
							<div class="form_row">
								<label for="t_height">키 / 몸무게</label> <input type="text"
									value="<%=t_height%>cm, <%=t_weight%>kg" readonly>
							</div>

							<div class="form_row">
								<label for="diagnosis">진단명</label> <input type="text"
									value="<%=diagnosis%>" readonly>
							</div>

							</div>
							<hr>
							<div>
							<h3>환자 상세 상태</h3>
							<div class="form_row">
								<label for="consciousness">의식 상태</label> <input type="text"
									value="<%=consciousness%>" readonly>
							</div>

							<div class="form_row">
								<label for="care_meal_yn">식사 케어</label> <input type="text"
									value="<%=care_meal_yn%>" readonly>
							</div>

							<div class="form_row">
								<label for="care_toilet"> 화장실 케어</label> <input type="text"
									value="<%=care_toilet%>" readonly>
							</div>

							<div class="form_row">
								<label for="state_paralysis">마비 상태</label> <input type="text"
									value="<%=state_paralysis%>" readonly>
							</div>

							<div class="form_row">
								<label for="state_mobility">거동 및 운동 상태</label> <input type="text"
									value="<%=state_mobility%>" readonly>
							</div>

							<div class="form_row">
								<label for="bedsore_yn">욕창 여부</label> <input type="text"
									value="<%=bedsore_yn%>" readonly>
							</div>

							<div class="form_row">
								<label for="suction_yn">석션 필요 여부</label> <input type="text"
									value="<%=suction_yn%>" readonly>
							</div>

							<div class="form_row">
								<label for="outpatient_yn">외부 치료 여부</label> <input type="text"
									value="<%=outpatient_yn%>" readonly>
							</div>

							<div class="form_row">
								<label for="care_night_yn">야간 돌봄 신청</label> <input type="text"
									value="<%=care_night_yn%>" readonly>
							</div>

							<div class="form_row">
								<label for="notice">유의 사항</label> <input type="text"
									value="<%=notice%>" readonly>
							</div>
							</div>
					
						</div>

				</form>
				<!-- form 끝 -->
				<%
				}
				%>
				</div>
			</div>
		</div>
		
	</section>

</body>

</html>