<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE HTML>
<html>
<head>
<title>SC 스위트케어 | 일반 본문</title>
	<%@ include file="/header-import.jsp"%>

<script>
if ("<%=adcode%>" != "null") {
	window.location.href="adMain.jsp";
}

function adlogin(){
	var masterpw = "suitecare2023**";
	var adcode = document.getElementById('code').value;
	if(adcode!=masterpw){
		alert("관리자 코드를 다시 확인해주세요!");
	return false;
	}
	else{
		window.location = "./adMain.jsp"
		alert("success");
	return true;
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
				<h2>Suite Care</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>Suite Care</p>
						<h2>관리자 페이지</h2><br>
					</header>
						<div class="form_wrapper">
					<form name="frmLogin" method="post" onsubmit="return adlogin();">

							<div class="form_row">
								<label>관리자 코드</label>
								<input type="password" class = "form-control"  id="code" name="code" placeholder="master code"/> <br>

							</div>
							<div class="form_button" >
								<button type="submit" class="button special">관리자 로그인</button>
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