<%@ page import="review.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/header-import.jsp"%>


<script>
	function reviewValidation() {

		var re_kind = document.getElementsByName("re_kind");
		var re_time = document.getElementsByName("re_time");
		var re_pro = document.getElementsByName("re_pro");
		var re_speed = document.getElementsByName("re_speed");
		var re_com = document.getElementsByName("re_com");
		var re_price = document.getElementsByName("re_price");
		var comment = document.mReviewForm.comment.value;

		if (re_kind === "") {
			alert("1번 항목을 선택하세요.");
			return false;
		}

		if (re_time === "") {
			alert("2번 항목을 선택하세요.");
			return false;
		}

		if (re_pro === "") {
			alert("3번 항목을 선택하세요.");
			return false;
		}

		if (re_speed === "") {
			alert("4번 항목을 선택하세요.");
			return false;
		}

		if (re_com === "") {
			alert("5번 항목을 선택하세요.");
			return false;
		}

		if (re_price === "") {
			alert("6번 항목을 선택하세요.");
			return false;
		}

		if (comment === "") {
			alert("7번 항목을 입력하세요.");
			return false;
		}

		// 모든 검증 통과		
		document.mReviewForm.method = "post";
		document.mReviewForm.action = "/suiteCare/member/review";
		document.mReviewForm.submit();
		return true;
	}
</script>

<style>
body {
	margin: 0;
	padding: 20px;
	font-family: Arial, sans-serif;
}

table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #ccc;
}

th, td {
	padding: 8px;
	border-bottom: 1px solid #ccc;
	text-align: left;
}
</style>

<meta charset="UTF-8">
<title>SC 스위트케어 | 피간병인 상세정보</title>
</head>
<body>
	<%
request.setCharacterEncoding("utf-8");
String res_code = request.getParameter("popres_code");
g_id = request.getParameter("popg_id");

mReviewDAO dao = new mReviewDAO();

System.out.println(m_id);
System.out.println(res_code);
System.out.println(g_id);


%>

	<div class="inner">
		<div class="box">
			<div class="content">
				<header class="align-center">
					<p>간병 서비스</p>
					<h2>후기 작성</h2>
				</header>

				<form name="mReviewForm" action="javascript: reviewValidation();">

							

					<label for="re_kind">1. 친절해요.</label>
					<div>
						<input type="radio" id="re_kind_1" name="re_kind" value=1>
						<label for="re_kind_1">전혀 그렇지 않다</label> <input type="radio"
							id="re_kind_2" name="re_kind" value=2> <label
							for="re_kind_2">그렇지 않다</label> <input type="radio" id="re_kind_3"
							name="re_kind" value=3> <label for="re_kind_3">보통이다</label>
						<input type="radio" id="re_kind_4" name="re_kind" value=4>
						<label for="re_kind_4">그렇다</label> <input type="radio"
							id="re_kind_5" name="re_kind" value=5> <label
							for="re_kind_5">매우 그렇다</label>
					</div>
					<label for="re_time">2. 시간 약속을 잘 지켜요.</label>
					<div>
						<input type="radio" id="re_time_1" name="re_time" value=1>
						<label for="re_time_1">전혀 그렇지 않다</label> <input type="radio"
							id="re_time_2" name="re_time" value=2> <label
							for="re_time_2">그렇지 않다</label> <input type="radio" id="re_time_3"
							name="re_time" value=3> <label for="re_time_3">보통이다</label>
						<input type="radio" id="re_time_4" name="re_time" value=4>
						<label for="re_time_4">그렇다</label> <input type="radio"
							id="re_time_5" name="re_time" value=5> <label
							for="re_time_5">매우 그렇다</label>
					</div>
					<label for="re_pro">3. 전문적이에요.</label>
					<div>
						<input type="radio" id="re_pro_1" name="re_pro" value=1> <label
							for="re_pro_1">전혀 그렇지 않다</label> <input type="radio"
							id="re_pro_2" name="re_pro" value=2> <label
							for="re_pro_2">그렇지 않다</label> <input type="radio" id="re_pro_3"
							name="re_pro" value=3> <label for="re_pro_3">보통이다</label>
						<input type="radio" id="re_pro_4" name="re_pro" value=4> <label
							for="re_pro_4">그렇다</label> <input type="radio" id="re_pro_5"
							name="re_pro" value=5> <label for="re_pro_5">매우
							그렇다</label>
					</div>
					<label for="re_speed">4. 일처리가 빨라요.</label>
					<div>
						<input type="radio" id="re_speed_1" name="re_speed" value=1>
						<label for="re_speed_1">전혀 그렇지 않다</label> <input type="radio"
							id="re_speed_2" name="re_speed" value=2> <label
							for="re_speed_2">그렇지 않다</label> <input type="radio"
							id="re_speed_3" name="re_speed" value=3> <label
							for="re_speed_3">보통이다</label> <input type="radio" id="re_speed_4"
							name="re_speed" value=4> <label for="re_speed_4">그렇다</label>
						<input type="radio" id="re_speed_5" name="re_speed" value=5>
						<label for="re_speed_5">매우 그렇다</label>
					</div>
					<label for="re_com">5. 의사소통이 잘 돼요.</label>
					<div>
						<input type="radio" id="re_com_1" name="re_com" value=1> <label
							for="re_com_1">전혀 그렇지 않다</label> <input type="radio"
							id="re_com_2" name="re_com" value=2> <label
							for="re_com_2">그렇지 않다</label> <input type="radio" id="re_com_3"
							name="re_com" value=3> <label for="re_com_3">보통이다</label>
						<input type="radio" id="re_com_4" name="re_com" value=4> <label
							for="re_com_4">그렇다</label> <input type="radio" id="re_com_5"
							name="re_com" value=5> <label for="re_com_5">매우
							그렇다</label>
					</div>
					<label for="re_price">6. 비용이 합리적이에요.</label>
					<div>
						<input type="radio" id="re_price_1" name="re_price" value=1>
						<label for="re_price_1">전혀 그렇지 않다</label> <input type="radio"
							id="re_price_2" name="re_price" value=2> <label
							for="re_price_2">그렇지 않다</label> <input type="radio"
							id="re_price_3" name="re_price" value=3> <label
							for="re_price_3">보통이다</label> <input type="radio" id="re_price_4"
							name="re_price" value=4> <label for="re_price_4">그렇다</label>
						<input type="radio" id="re_price_5" name="re_price" value=5>
						<label for="re_price_5">매우 그렇다</label>
					</div>
					<label for="comment">7. 총 평가</label>
					<div>
						<input type="text" id="comment" name="comment" maxlength="100">
					</div>
					<input type="hidden" name="res_code" value="<%=res_code%>" />
					<input type="hidden" name="g_id" value="<%=g_id%>" />
					<div class="form_button_three">
						<button onclick="window.close()" class="button alt">취소</button>
						<div>
							<button type="reset" class="button">초기화</button>
							<button type="submit" class="button special">제출하기</button>
						</div>
					</div>
					

					<input type="hidden" name="type" value="review" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>
