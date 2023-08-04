<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>SC 스위트케어 | 일반 본문</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body>
<%@ include file="../header.jsp" %>

<%String m_id = (String)session.getAttribute("m_id"); %>	

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
								<p>간병 서비스를 제공받을 분</p>
								<h2>기본 정보 등록</h2>
							</header>
							

<script >
	function validateForm() {
		console.log('확인');
		var t_name = document.Registform.t_name.value;
		var t_gender = document.getElementsByName("t_gender");
		var t_age = document.Registform.t_age.value;
		var t_height = document.Registform.t_height.value;
		var t_weight = document.Registform.t_weight.value;
		var diagnosis = document.Registform.diagnosis.value;
		
		
		if(t_name=="") {
			alert("이름을 입력해주세요.");
			return false;
		}

		//성별 확인
//		for(var i=0; i<t_gender.length; i++) {
//			if(t_gender[i].checked) {
//				selectGen=t_gender[i].value;
//				break;
//			}
//		}
		
//		if(selectGen==="") {
//			alert("성별을 선택해주세요");
//			return false;
//		}
		
		if(t_age=="") {
			alert("나이를 입력해주세요.");
			return false;
		}
		
		if(t_height=="") {
			alert("키를 입력해주세요");
			return false;
		}
		
		if(t_weight=="") {
			alert("몸무게를 입력해주세요.");
			return false;
		}
		
		if(diagnosis=="") {
			alert("진단명을 입력해주세요.");
			return false;
		}
		
		return true;
		
		}
</script>

<script>
function goindexForm() {
	location.href="../member/mMain.jsp";
}
</script>


	<!-- form 시작 -->
	<form name="Registform" method="post" onSubmit="return validateForm();" action="./takerInfoCheck.jsp">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="t_name">이름</label>
				<div class ="form_row_sub">
				<input class="form-control" type="text" id="t_name" name="t_name" placeholder="피간병인 이름을 입력하세요.">
				</div>
			</div>
			<br>
			<div class="form_row">
				<label for="t_gender">성별</label>
				<input class = "form-control" type="radio" id="man" name="t_gender" value="남">
				<label for="man">남자</label>
				<input class = "form-control" type="radio" id="woman" name="t_gender" value="여">
				<label for="woman">여자</label> <br><br>
				</div>			
			
			<div class="form_row">
				<label for="t_age">나이</label>
				<div class ="form_row_sub">
				<input class="form-control" type="text" id="t_age" name="t_age" placeholder="피간병인 나이를 입력하세요.">
				</div>
			</div>
			<br>
			<div class="form_row">
				<label for="t_height">키(cm)</label>
				<div class ="form_row_sub">
				<input class="form-control" type="text" id="t_height" name="t_height" placeholder="피간병인 키를 입력하세요.">
				</div>
			</div>
			<br>	
			<div class="form_row">
				<label for="t_weight">몸무게(kg)</label>
				<div class ="form_row_sub">
				<input class="form-control" type="text" id="t_weight" name="t_weight" placeholder="피간병인 몸무게를 입력하세요.">
				</div>
			</div>
			<br>	
			<div class="form_row">
				<label for="diagnosis">진단명</label>
				<div class ="form_row_sub">
				<input class="form-control" type="text" id="diagnosis" name="diagnosis" placeholder="진단명을 입력하세요.">
				</div>
			</div>
			</div>
			<br>				
		<div style="text-align: center;" class="form_btn">
			<input class="button special" type="submit" value=등록 >
			<input class="button special" type="reset" value=초기화>
	 	<!-- <input class="button special" type="hidden" name="command" value="addMember"> -->	
	 		<input class="button special" type="button" value=취소 onClick="goindexForm()">
		</div>
		<br>
		<br>
	</form>
	<!-- form 끝 -->
</div>
</div>
</section>

<%@ include file="../footer.jsp" %>

</body>

</html>