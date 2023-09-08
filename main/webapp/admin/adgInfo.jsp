<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="caregiver.*"%>
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
						<p>간병인 정보</p>
						<h2></h2>
					</header>
					
					<form name="ginfo">
					<%
					request.setCharacterEncoding("utf-8");
					g_id = request.getParameter("caregiver_id");

					CaregiverDAO dao = new CaregiverDAO();
					List<CaregiverVO> list = dao.giver_info(g_id);
					for (int i = 0; i < list.size(); i++) {
						CaregiverVO listvo = (CaregiverVO) list.get(i);

						String name = listvo.getG_name();
						String gender = listvo.getG_gender();
						String birth = listvo.getG_birth();
						String phone = listvo.getG_phone();
						String email = listvo.getG_email();
						String address = listvo.getG_address();
					%>

						<div class="form_wrapper">

							<div class="form_row">
								<label for="id">아이디</label> 
								<input type="text" value="<%=g_id%>"  readonly>
							</div>
							
							<div class="form_row">
								<label for="name">이름</label> 
								<input type="text" value="<%=name%>"  readonly>
							</div>

							<div class="form_row">
								<label for="gender">성별</label> <input type="text"
									value="<%=gender%>" readonly>
							</div>

							<div class="form_row">
								<label for="birth">생년월일</label> <input type="text"
									value="<%=birth%>" readonly>
							</div>

							<div class="form_row">
								<label for="phone">핸드폰 번호</label> <input type="text"
									value="<%=phone%>" readonly>
							</div>
							
							<div class="form_row">
								<label for="email">이메일</label> <input type="text"
									value="<%=email%>" readonly>
							</div>
							
							<div class="form_row">
								<label for="address">주소</label> <input type="text"
									value="<%=address%>" readonly>
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