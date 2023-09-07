<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>SC 스위트케어 | 빠른매칭서비스</title>
<%@ include file="/header-import.jsp"%>
</head>
<body>

	<%@ include file="../header.jsp" %>
<%
String file_repo = "../assets/profile/";

%>
<!-- One -->
   <section id="One" class="wrapper style3">
      <div class="inner">
         <header class="align-center">
            <p>Premium Caregiver Matching Platform</p>
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
						<p> SuiteCare </p>
						<h2>빠른 매칭 리스트</h2>
					</header>
<form name="quickForm">
<table>
<thead>
        <tr>
            <th></th>
            <th>이름</th>
            <th>성별</th>
            <th>나이</th>
            <th>거주지역</th>
            <th>활동지역</th>
            <th>주요서비스</th>
            <th>보유자격증</th>
            <th>시급</th>
            <th>비고</th>
        </tr>
    </thead>
    <tbody>
     <c:choose>
         <c:when test="${empty ginfoList}">
            <tr>
               <td colspan="10">${notFoundMessage}</td>
             </tr>
          </c:when>
        <c:otherwise>
    
  <c:forEach var="ginfo" items="${ginfoList}">
<c:set var="address" value="${ginfo.g_address}" />
<c:set var="idx" value="${address.indexOf(' ')}" />
<c:set var="fidx" value="${address.indexOf(' ', idx + 1)}" />
<c:set var="addr" value="${address.substring(idx + 1, fidx)}" />

<c:set var="profilePath" value="${file_repo}${ginfo.g_profile}" />

 <c:set var="gender" value="${ginfo.g_gender}" />

 

	
	 <tr>
	<td><img src="${profilePath}" alt="" style="width:150px; height:150px;"/></td>
	<td>${ginfo.g_name}</td>
	<td><c:choose>
            <c:when test="${gender eq 'W'}">여자</c:when>
            <c:otherwise>남자</c:otherwise>
        </c:choose></td>
	<td>${ginfo.g_age}</td><td>${addr}</td>
	<td>1순위 : ${ginfo.g_location1}<br>
		2순위 : ${ginfo.g_location2}<br>
		3순위 : ${ginfo.g_location3}</td>
	<td>1순위 : ${ginfo.g_service1}<br>
		2순위 : ${ginfo.g_service2}<br>
		3순위 : ${ginfo.g_service3}</td>
	<td>${ginfo.g_qualification}</td>
	<td>1순위 : ${ginfo.g_hourwage1}<br>
		2순위 : ${ginfo.g_hourwage2}<br>
		3순위 : ${ginfo.g_hourwage3}</td>
	<td>
	<span onclick="tmatch('${ginfo.re_id }','${ginfo.g_id }');" style="text-decoration: underline;cursor:pointer;">매칭신청</span></td>
	</tr>
	</c:forEach>
 </c:otherwise>
</c:choose>
	</tbody>
		</table>	
</form>
</body>
<script>
function tmatch(re_id, g_id) {
	window.open("${context}/book/tmatchapply.jsp?res_code=" + re_id + "&g_id=" + g_id, "name(about:blank)", "width=800, height=950");
}
</script>
</html>