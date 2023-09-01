<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false" %>
	<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SC 스위트케어 | 간병 예약</title>
<%@ include file="/header-import.jsp"%>
<script src="<%=context%>/assets/js/progress.js"></script>                                                                                              
<style>
.info-row{
	margin-bottom: 1rem;
    border-bottom: 1px solid #ccc;
    display: grid;
    grid-template-columns: 30% 1fr;
    gap: 1rem;
}

.info-row div{
    display: flex;
    flex-wrap: wrap;
    column-gap: 10px;
}
</style>

<c:forEach var="listtinfo" items="${listtinfo}">

<script>
	
function reservation() {
	//console.log('확인');
	let f = document.detailtinfoForm;
	let consciousness = document.detailtinfoForm.consciousness.value;
	let meal = document.detailtinfoForm.care_meal_yn.value;
	let toilet = document.detailtinfoForm.care_toilet.value;
	let paralysis = document.detailtinfoForm.state_paralysis.value;
	let mobility = document.detailtinfoForm.state_mobility.value;
	let bedsore = document.detailtinfoForm.bedsore_yn.value;
	let suction = document.detailtinfoForm.suction_yn.value;
	let outpatient = document.detailtinfoForm.outpatient_yn.value;
	let night = document.detailtinfoForm.care_night_yn.value;
	
	if(!consciousness || !meal || !toilet || !paralysis || !mobility || !bedsore || !suction || !outpatient || !night) {
		alert("모든 항목을 입력해주세요");
		return false;
	} else {
		f.method = "post";
		f.action = "../reservation/name";
		f.submit();
		return true;
	}
	}

function recheck() {
	let f = document.tinfoform;
	f.method = "post";
	f.action = "../reservation/name";
	f.submit();
}

function opChange() {
	let outop=document.detailtinfoForm.outpatient_option;
	let outyn=document.detailtinfoForm.outpatient_yn;
	
	if(outop.options[outop.selectedIndex].value=='9') {
		$("#outpatient_yn").show();
		outyn.value="";
		outyn.focus();
	}	else {
		$("#outpatient_yn").hide();
		outyn.value=outop.options[outop.selectedIndex].value;
	}
	
	console.log(outyn.value);
}

function newinfo(){
	document.detailtinfoForm.style.display = "";
	document.getElementById("infobtns").style.display = "none";
}

function loadinfo(){
	newinfo();
	<%    
	String t_code = (String) session.getAttribute("t_code");
	ReservationDAO rdao = new ReservationDAO();
	ReservationVO reservation = rdao.getLatestReservation(m_id, t_code);
	
    if (reservation != null) {
        String consciousness = reservation.getConsciousness();
        String care_meal_yn = reservation.getCare_meal_yn();
        String care_toilet = reservation.getCare_toilet();
        String state_paralysis = reservation.getState_paralysis();
        String state_mobility = reservation.getState_mobility();
        String bedsore_yn = reservation.getBedsore_yn();
        String suction_yn = reservation.getSuction_yn();
        String outpatient_yn = reservation.getOutpatient_yn();
        String care_night_yn = reservation.getCare_night_yn();
        String notice = reservation.getNotice();
	 %>
	//Q1
	       switch ("<%=consciousness%>") {
	case "의식 있음":
		document.getElementById("con_y").checked = true;
		break;
	case "의식은 있으나 의사소통 어려움":
		document.getElementById("difficult_com").checked = true;
		break;
	case "의식 없음":
		document.getElementById("con_n").checked = true;
		break;
	}
	
	//Q2
	     switch("<%=care_meal_yn %>") {
	case "스스로 식사 가능":
		document.getElementById("meal_self").checked = true;
		break;
	case "식사 보조 필요함":
		document.getElementById("meal_assistance").checked = true;
		break;
	case "경관영양(피딩)":
		document.getElementById("Feeding").checked = true;
		break;
	case "주사를 통한 정맥영양":
		document.getElementById("injection").checked = true;
		break;
	}
	
	//Q3
	        switch("<%=care_toilet %>") {
	case "스스로 화장실 이용":
		document.getElementById("toilet_self").checked = true;
		break;
	case "동행하여 화장실 이용":
		document.getElementById("toilet_assistance").checked = true;
		break;
	case "기저귀":
		document.getElementById("diapers").checked = true;
		break;
	case "소변줄":
		document.getElementById("foley_catheter").checked = true;
		break;
	case "장루/요루":
		document.getElementById("stoma").checked = true;
		break;
	}
	
	//Q4
	       switch("<%=state_paralysis %>") {
	case "전신마비":
		document.getElementById("general").checked = true;
		break;
	case "편마비":
		document.getElementById("hemiplegia").checked = true;
		break;
	case "없음":
		document.getElementById("ps_n").checked = true;
		break;
	}
	
	//Q5
	        switch("<%=state_mobility %>") {
	case "스스로 걸을 수 있음":
		document.getElementById("mobility_self").checked = true;
		break;
	case "지팡이 혹은 휠체어 보조 필요":
		document.getElementById("cw_assistance").checked = true;
		break;
	case "침대에서만 움직임이 가능":
		document.getElementById("only_bed").checked = true;
		break;
	case "움직일 수 없음":
		document.getElementById("mobility_n").checked = true;
		break;
	}
	
	//Q6
	        switch("<%=bedsore_yn %>") {
	case "있음":
		document.getElementById("b_yes").checked = true;
		break;
	case "없음":
		document.getElementById("b_no").checked = true;
		break;
	}
	
	//Q7
	      switch("<%=suction_yn %>") {
	case "예":
		document.getElementById("s_yes").checked = true;
		break;
	case "아니오":
		document.getElementById("s_no").checked = true;
		break;
	}
	
	//Q8
	if (document.detailtinfoForm.outpatient_option != undefined){
        document.detailtinfoForm.outpatient_option.parentNode.innerHTML = 
        	`<input type="text" name="outpatient_yn" id="outpatient_yn" value="<%=outpatient_yn%>">`
	}
	
	//Q9
	       switch("<%=care_night_yn %>") {
	case "예":
		document.getElementById("caren_yes").checked = true;
		break;
	case "아니오":
		document.getElementById("caren_no").checked = true;
		break;
	}
	    
	//Q10
	       document.detailtinfoForm.notice.innerHTML = "<%=notice %>";
	       <%
    }
	       %>
	   }




function resetInputValues(){
	document.detailtinfoForm.outpatient_yn.parentNode.innerHTML = `<select id="outpatient_option" name="outpatient_option" onchange="opChange()">
		<option value="">==선택==</option>
		<option value="없음">없음</option>
		<option value="9">직접 입력 (예: 투석, 재활 등)</option>
	</select><input type="text" name="outpatient_yn" id="outpatient_yn" style="display: none;">`;
	document.detailtinfoForm.notice.innerHTML = "";
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
	
	<div id="res-progress">
	<ul>
	<li>피간병인 선택</li>
	<li class="active">피간병인 정보 입력</li>
	<li>간병장소 선택</li>
	<li>예약 일시 지정</li>
	<li>빠른매칭 서비스</li>
	</ul>
	</div>



		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>maecenas sapien feugiat ex purus</p>
						<h2>${listtinfo.t_name}님의 기본 정보</h2>
					</header>

					<div class="form_wrapper">
<form name="tinfoform">
<div class="form_row">
<label> 피간병인 정보</label><input type="text" value="${listtinfo.t_name} (${listtinfo.t_age}세, ${listtinfo.t_gender}성)" readonly>
<label> 키 / 몸무게</label><input type="text" value="${listtinfo.t_height}cm / ${listtinfo.t_weight}kg" readonly>
<label> 진단명		</label><input type="text" value="${listtinfo.diagnosis}" readonly>
</div>
<div class="form_button">

<button type="button" class="button alt" onclick="recheck();">피간병인 변경</button>
<button type="button" class="button" onclick="location.href='/suiteCare/careTaker/tUpdate.jsp?t_name=${listtinfo.t_name}'">기본정보 수정</button>
</div>

</form>
<hr>
					<header class="align-center">
						<h2>${listtinfo.t_name}님의 상세 정보</h2>

						<div id="infobtns">
						<span class="button special" onclick="loadinfo();">기존 정보 불러오기</span>
						<span class="button special" onclick="newinfo();">상세 정보 작성하기</span>
						</div>
					</header>
<form name="detailtinfoForm" method="post" style="display: none;">
<div class="info-row">
<label>Q1. 의식상태는 어떠신가요? </label>
<div>
<input type="radio" id="con_y" name="consciousness" value="의식 있음">
		<label for="con_y">의식 있음</label>
	<input type="radio" id="difficult_com" name="consciousness" value="의식은 있으나 의사소통 어려움">
		<label for="difficult_com">의식은 있으나 의사소통 어려움</label>
	<input type="radio" id="con_n" name="consciousness" value="의식 없음">
		<label for="con_n">의식 없음</label>
</div>
</div>
<div class="info-row">
<label>Q2. 식사를 어떻게 하고 계신가요?</label>
<div>
<input type="radio" id="meal_self" name="care_meal_yn" value="스스로 식사 가능">
		<label for="meal_self">스스로 식사 가능</label>
	<input type="radio" id="meal_assistance" name="care_meal_yn" value="식사 보조 필요함">
		<label for="meal_assistance">식사 보조 필요함</label>
	<input type="radio" id="Feeding" name="care_meal_yn" value="경관영양(피딩)">
		<label for="Feeding">경관영양(피딩)</label>
	<input type="radio" id="injection" name="care_meal_yn" value="주사를 통한 정맥영양">
		<label for="injection">주사를 통한 정맥영양</label>
</div>
</div>
<div class="info-row">
<label>Q3. 대소변 해결은 어떻게 하시나요? </label>
<div>
<input type="radio" id="toilet_self" name="care_toilet" value="스스로 화장실 이용">
		<label for="toilet_self">스스로 화장실 이용</label>
	<input type="radio" id="toilet_assistance" name="care_toilet" value="동행하여 화장실 이용">
		<label for="toilet_assistance">동행하여 화장실 이용</label>
	<input type="radio" id="diapers" name="care_toilet" value="기저귀">
		<label for="diapers">기저귀</label>
	<input type="radio" id="foley_catheter" name="care_toilet" value="소변줄">
		<label for="foley_catheter">소변줄</label>
	<input type="radio" id="stoma" name="care_toilet" value="장루/요루">
		<label for="stoma">장루/요루</label>
</div>
</div>
<div class="info-row">
<label>Q4. 마비가 있는 상태신가요?</label>
<div>
<input type="radio" id="general" name="state_paralysis" value="전신마비">
		<label for="general">전신마비</label>
	<input type="radio" id="hemiplegia" name="state_paralysis" value="편마비">
		<label for="hemiplegia">편마비</label>
	<input type="radio" id="ps_n" name="state_paralysis" value="없음">
		<label for="ps_n">없음</label>
</div>
</div>
<div class="info-row">
 <label>Q5. 거동 및 운동 상태는 어떠신가요? </label>
<div>
<input type="radio" id="mobility_self" name="state_mobility" value="스스로 걸을 수 있음">
		<label for="mobility_self">스스로 걸을 수 있음</label>
	<input type="radio" id="cw_assistance" name="state_mobility" value="지팡이 혹은 휠체어 보조 필요">
		<label for="cw_assistance">지팡이 혹은 휠체어 보조 필요</label>
	<input type="radio" id="only_bed" name="state_mobility" value="침대에서만 움직임이 가능">
		<label for="only_bed">침대에서만 움직임이 가능</label>
	<input type="radio" id="mobility_n" name="state_mobility" value="움직일 수 없음">
		<label for="mobility_n">움직일 수 없음</label>
</div>
</div>
<div class="info-row">
 <label>Q6. 욕창이 있으신가요?</label>
<div>
<input type="radio" id="b_yes" name="bedsore_yn" value="있음">
		<label for="b_yes">있음</label>
	<input type="radio" id="b_no" name="bedsore_yn" value="없음">
		<label for="b_no">없음</label>
</div>
</div>
<div class="info-row">
 <label>Q7. 석션이 필요하신가요? </label>
<div>
<input type="radio" id="s_yes" name="suction_yn" value="예">
		<label for="s_yes">예</label>
	<input type="radio" id="s_no" name="suction_yn" value="아니오">
		<label for="s_no">아니오</label>
</div>
</div>
<div class="info-row">
 <label>Q8. 주기적으로 받는 외부치료가 있으신가요? </label>
<div>
		<select id="outpatient_option" name="outpatient_option" onchange="opChange()">
			<option value="">==선택==</option>
			<option value="없음">없음</option>
			<option value="9">직접 입력 (예: 투석, 재활 등)</option>
		</select>
<input type="text" name="outpatient_yn" id="outpatient_yn" style="display: none;">
</div>
</div>
<div class="info-row">
 <label>Q9. 환자분에게 야간 돌봄이 필요하신가요? </label>
<div>
<input type="radio" id="caren_yes" name="care_night_yn" value="예">
		<label for="caren_yes">예</label>
	<input type="radio" id="caren_no" name="care_night_yn" value="아니오">
		<label for="caren_no">아니오</label>
</div>
</div>
<div class="info-row">
 <label>Q10. 간병할 때 유의사항을 입력해 주세요. <span id="notice_cnt">(0 / 100)</span></label>
<textarea id="notice" name="notice" cols="100" rows="3"></textarea>
</div>    
    
	<div class="form_button_three" >
<span class="button special" onclick="loadinfo();">기존 정보 불러오기</span>
<div>
<input type="reset" class="button" value="초기화" onclick="resetInputValues();"/>

<button type="button" class="button special" onclick="reservation();">예약하기</button>
</div>
    </div>
    <input type="hidden" name="type" value="resinsert"/>
</form>
</c:forEach>


				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="/footer.jsp"%>

</body>
<script>
 
    $(document).ready(function() {
        $('#notice').on('keyup', function() {
            $('#notice_cnt').html("("+$(this).val().length+" / 100)");
 
            if($(this).val().length > 100) {
                $(this).val($(this).val().substring(0, 100));
                $('#notice_cnt').html("(100 / 100)");
            }
        });
    });
        
    </script>
</html>