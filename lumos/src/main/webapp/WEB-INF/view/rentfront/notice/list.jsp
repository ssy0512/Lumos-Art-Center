<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/rentfrontlayout.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/academystyle.css" type="text/css">

<script type="text/javascript">

</script>

<div id="tab-contents" style="clear: both; margin: 60px; width: 900px;">

  <c:if test="${sessionScope.member.userId=='admin'}">
	<button type="button" class="list-ing" style="width: 100px; cursor: pointer; float: right;" 
		onclick="javascript:location.href='<%=cp%>/rentfront/notice/concert/created';">
		대관 등록</button>
	</c:if>	
  <p style="font-size: 18px; font-weight: 600; margin: -40px 0px 40px 0px;">공연장</p>
    

	<!-- 공연장 -->
	<table class="rent_table" style="width: 100%; height: 160px;text-align: center; border: 1px solid #eee;">
	<c:forEach var="dto" items="${clist}" varStatus="i">
		<tr style="height: 50px; font-weight: 500; background: #eee;">
			<th scope="col" width="20%">장소</th>
			<th scope="col">구분</th>
			<th scope="col">일정</th>
			<th scope="col" width="150px;">참고</th>
		</tr>
		<tr style="height: 60px;">
			<th scope="row">${dto.hallName}</th>
			<td style="width: 110px">정기대관</td>
			<td>${dto.rentStart} ~ ${dto.rentEnd}</td>
			<td>
				<button type="button" class="list-ing" style="width: 100px; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/rentfront/notice/created';">신청하기</button>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<p style="font-size: 18px; font-weight: 600; margin: 40px; padding-top: 60px;">전시장</p>
	
	<!-- 전시장 -->
	<table class="rent_table" style="width: 100%; height: 160px;text-align: center; border: 1px solid #eee;">
	<c:forEach var="vo" items="${elist}" varStatus="i">
		<tr style="height: 50px; font-weight: 500; background: #eee;">
			<th scope="col" width="20%">장소</th>
			<th scope="col">구분</th>
			<th scope="col">일정</th>
			<th scope="col" width="150px;">참고</th>
		</tr>
		<tr style="height: 60px;">
			<th scope="row">${vo.hallName}</th>
			<td>정기대관</td>
			<td>공고중인 일정이 없습니다.</td>
			<td>
				<button type="button" class="list-ing" style="width: 100px; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/';">신청하기</button>
			</td>
		</tr>
		</c:forEach>
	</table>
	
</div>
