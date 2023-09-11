<%@ page import="caretaker.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 회원정보</title>
<%@ include file="/header-import.jsp"%>
</head>

<body>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>회원이 등록한</p>
						<h2>피간병인 정보 조회</h2>
					</header>

					<form name="patientinfo">
						<table>
							<thead>
								<tr>
									<td>No.</td> <td>이름</td> <td>성별</td> <td>나이</td>
									<td>키</td> <td>몸무게</td> <td>진단명</td>
								</tr>
							</thead>
							<%
							request.setCharacterEncoding("utf-8");
							m_id = request.getParameter("m_id");
							
							TakerDAO dao = new TakerDAO();

							List<TakerVO> list = dao.takerList(m_id, 1);
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
							</tr>
							<%
							}
							%>
						</table>
					</form>
				</div>
			</div>
		</div>
	</section>

</body>

</html>