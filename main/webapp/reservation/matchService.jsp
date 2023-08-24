<%@ page import="reservation.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<title>SC 스위트케어 | 빠른 매칭 서비스</title>
<%@ include file="/header-import.jsp"%>
<script src="<%=context%>/assets/js/progress.js"></script>

<script>
	function matSubmit() {
		//console.log('확인');
		var f = document.preferenceForm;
		var pre_location_1 = f.pre_location_1.value;
		var pre_location_2 = f.pre_location_2.value;
		var pre_location_3 = f.pre_location_3.value;
		var pre_age_1 = f.pre_age_1.value;
		var pre_age_2 = f.pre_age_2.value;
		var pre_age_3 = f.pre_age_3.value;
		var pre_gender = f.pre_gender.value;
		var pre_qual = document.getElementById("pre_qual");
		var pre_repre_1 = document.getElementById("pre_repre_1");
		var pre_repre_2 = document.getElementById("pre_repre_2");
		var pre_repre_3 = document.getElementById("pre_repre_3");
		var pre_hourwage_1 = f.pre_hourwage_1.value;
		var pre_hourwage_2 = f.pre_hourwage_2.value;
		var pre_hourwage_3 = f.pre_hourwage_3.value;

		var inputqual = pre_qual.value
		var inputrepre1 = pre_repre_1.value
		var inputrepre2 = pre_repre_2.value
		var inputrepre3 = pre_repre_3.value

		if (inputqual === "") {
			pre_qual.value = "지정하지 않음";
		}
		
		
		
		
		if (!pre_location_1 || !pre_location_2 || !pre_location_3) {
			alert("선호 지역을 모두 선택해주세요");
			return false;
		} else if (!pre_age_1 || !pre_age_2 || !pre_age_3) {
			alert("선호 나이대를 모두 선택해주세요");
			return false;
		} else if (!pre_gender) {
			alert("선호성별을 선택해주세요");
			return false;
		} else if (!inputrepre1 || !inputrepre2 || !inputrepre3) {
				alert("선호서비스를 모두 선택해주세요");
				return false;
		}else if (!pre_hourwage_1 || !pre_hourwage_2 || !pre_hourwage_3) {
			alert("선호 시급 범위를 모두 선택해주세요");
			return false;
		} else if(
				(pre_hourwage_1 !== "지정하지 않음" && pre_hourwage_2 !== "지정하지 않음") ||
			    (pre_hourwage_1 !== "지정하지 않음" && pre_hourwage_3 !== "지정하지 않음") ||
			    (pre_hourwage_2 !== "지정하지 않음" && pre_hourwage_3 !== "지정하지 않음")
			) {
				if(pre_hourwage_1==pre_hourwage_2 || pre_hourwage_1==pre_hourwage_3 || pre_hourwage_2==pre_hourwage_3 ) {
			alert("선호 시급 범위가 중복되었습니다.");
			return false;
		}}	
			f.action = "matchScheck.jsp";
			f.submit();
			return true;
		
	}
	function resmstop() {
		alert("매칭정보 입력이 중지되었습니다.");
		window.location.href = "<%=context%>/member/main";
	}
</script>

<style>
.rank-label{
	font-weight: 400;
}

.form_row > div > span {
	position: relative;
    top: -1rem;
    font-size: 0.9rem;
}
</style>
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
	<%
	request.setCharacterEncoding("utf-8");
	String m_id = (String) session.getAttribute("m_id");
	String res_code = (String) session.getAttribute("res_code");
	String r_code = request.getParameter("res_code");
	session.setAttribute("r_code", r_code);

	ReservationDAO dao = new ReservationDAO();

	int sido_code = 0;
	String sido = null;
	%>


	<!-- Two -->
	<section id="two" class="wrapper style2">

		<div id="res-progress">
			<ul>
				<li>피간병인 선택</li>
				<li>피간병인 정보 입력</li>
				<li>간병장소 선택</li>
				<li>예약 일시 지정</li>
				<li class="active">빠른매칭 서비스</li>
			</ul>
		</div>

		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>maecenas sapien feugiat ex purus</p>
						<h2>빠른 매칭 서비스 : 간병인 선호도 조사</h2>
					</header>

					<div class="form_wrapper">
						<form name="preferenceForm">
							<div class="form_row">
								<label> 예약 코드</label> <input type="text" readonly
									value="<%if (res_code != null) {%><%=res_code%> <%} else if (res_code == null) {%> <%=r_code%> <%}%>">
							</div>
							<div class="form_row">
								<label>선호지역</label>
								<div>
									<div class="form_row">
										<label class="rank-label">1순위</label> <select
											name="pre_location_1" id="pre_location_1">
											<option value = "">==선택==</option>
											<option value="지정하지 않음">지정하지 않음</option>
											<option value="서울특별시">서울특별시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="인천광역시">인천광역시</option>
											<option value="경기도">경기도</option>
											<option value="제주특별자치도">제주특별자치도</option>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">2순위</label> <select
											name="pre_location_2" id="pre_location_2">
											<option value = "">==선택==</option>
											<option value="지정하지 않음">지정하지 않음</option>
											<option value="서울특별시">서울특별시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="인천광역시">인천광역시</option>
											<option value="경기도">경기도</option>
											<option value="제주특별자치도">제주특별자치도</option>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">3순위</label> <select
											name="pre_location_3" id="pre_location_3">
											<option value = "">==선택==</option>
											<option value="지정하지 않음">지정하지 않음</option>
											<option value="서울특별시">서울특별시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="인천광역시">인천광역시</option>
											<option value="경기도">경기도</option>
											<option value="제주특별자치도">제주특별자치도</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form_row">
								<label>선호나이대</label>
								<div>
									<div class="form_row">
										<label class="rank-label">1순위</label> <select name="pre_age_1"
											id="pre_age_1">
											<option value="">==선택==</option>
											<%
											for (int start = 40; start <= 65; start += 5) {
												String value = start + "~" + (start + 4);
											%>
											<option value="<%=value%>"><%=start%>세 ~
												<%=start + 4%>세
											</option>
											<%
											}
											%>
											<option value="지정하지 않음">지정하지 않음</option>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">2순위</label> <select name="pre_age_2"
											id="pre_age_2">
											<option value="">==선택==</option>
											<%
											for (int start = 40; start <= 65; start += 5) {
												String value = start + "~" + (start + 4);
											%>
											<option value="<%=value%>"><%=start%>세 ~
												<%=start + 4%>세
											</option>
											<%
											}
											%>
											<option value="지정하지 않음">지정하지 않음</option>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">3순위</label> <select name="pre_age_3"
											id="pre_age_3">
											<option value="">==선택==</option>
											<%
											for (int start = 40; start <= 65; start += 5) {
												String value = start + "~" + (start + 4);
											%>
											<option value="<%=value%>"><%=start%>세 ~
												<%=start + 4%>세
											</option>
											<%
											}
											%>
											<option value="지정하지 않음">지정하지 않음</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form_row">
								<label>선호성별</label>
								<div>
									<input type="radio" id="man" name="pre_gender" value="M">
									<label for="man">남자</label> <input type="radio" id="woman"
										name="pre_gender" value="W"> <label for="woman">여자</label>
									<input type="radio" id="anything" name="pre_gender"
										value="상관없음"> <label for="anything">상관없음</label>
								</div>
							</div>
							<div class="form_row">
								<div>
									<label>선호자격증</label><span>※지정하지 않을 경우 빈칸</span>
								</div>
								<input type="text" name="pre_qual" id="pre_qual"
									placeholder="자격증(ex.요양보호사, 간호사 등)">
							</div>
							
							<div class="form_row">
									<label>선호서비스 </label>
								<div>
									<div class="form_row">
										<label class="rank-label">1순위</label> <select
											name="pre_repre_1" id="pre_repre_1">
											<option value = "">==선택==</option>
											<option value="지정하지 않음">지정하지 않음</option>
											<option value="요리">요리</option>
											<option value="목욕">목욕</option>
											<option value="재활운동보조">재활운동보조</option>
											<option value="외출동행">외출동행</option>
											<option value="청소">청소</option>
											<option value="빨래">빨래</option>
											<option value="운전">운전</option>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">2순위</label> <select
											name="pre_repre_2" id="pre_repre_2">
											<option value = "">==선택==</option>
											<option value="지정하지 않음">지정하지 않음</option>
											<option value="요리">요리</option>
											<option value="목욕">목욕</option>
											<option value="재활운동보조">재활운동보조</option>
											<option value="외출동행">외출동행</option>
											<option value="청소">청소</option>
											<option value="빨래">빨래</option>
											<option value="운전">운전</option>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">3순위</label> <select
											name="pre_repre_3" id="pre_repre_3">
											<option value = "">==선택==</option>
											<option value="지정하지 않음">지정하지 않음</option>
											<option value="요리">요리</option>
											<option value="목욕">목욕</option>
											<option value="재활운동보조">재활운동보조</option>
											<option value="외출동행">외출동행</option>
											<option value="청소">청소</option>
											<option value="빨래">빨래</option>
											<option value="운전">운전</option>
										</select>
									</div>
								</div>
							</div>
							
							
							<div class="form_row">
								<label>시급</label>
								<div>
									<div class="form_row">
										<label class="rank-label">1순위</label> <select
											name="pre_hourwage_1" id="pre_hourwage_1">
											<option value="">==선택==</option>
											<option value="지정하지 않음">지정하지 않음</option>
											<%
											for (int start = 10000; start <= 15000; start += 1000) {
											%>
											<option value="<%=start%>"><%=start%>원</option>
											<%
											}
											%>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">2순위</label> <select
											name="pre_hourwage_2" id="pre_hourwage_2">
											<option value="">==선택==</option>
											<option value="지정하지 않음">지정하지 않음</option>
											<%
											for (int start = 10000; start <= 15000; start += 1000) {
											%>
											<option value="<%=start%>"><%=start%>원</option>
											<%
											}
											%>
										</select>
									</div>
									<div class="form_row">
										<label class="rank-label">3순위</label> <select
											name="pre_hourwage_3" id="pre_hourwage_3">
											<option value="">==선택==</option>
											<option value="지정하지 않음">지정하지 않음</option>
											<%
											for (int start = 10000; start <= 15000; start += 1000) {
											%>
											<option value="<%=start%>"><%=start%>원</option>
											<%
											}
											%>
										</select>
									</div>
								</div>
							</div>
							<div class="form_button_three">
								<input type="button" class="button alt" onclick="resmstop();" value="매칭 중지">
								<div>
								<input type="reset" class="button" onclick="resmstop();" value="초기화">
									<button type="button" class="button special"
										onclick="matSubmit();">제출</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="/footer.jsp"%>

</body>
</html>