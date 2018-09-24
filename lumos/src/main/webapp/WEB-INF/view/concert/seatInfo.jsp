<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<div class="place_info">
	<div class="wrap">
		<h2>${dto.hallName}
			<img class="place_icon" src="<%=cp%>/resource/images/lumos/music_icon.png">
		<c:if test="${sessionScope.member.userId=='admin'}">
			<button type="button" class="adBtn" style="margin-top:3px; margin-right: 10px;"
				onclick="javascript:location.href='<%=cp%>/admin/concertHallinfo/update?num=${dto.hallNum}'">
				공연장 상세정보 관리</button>
		</c:if>
		</h2>

		<div class="content_top">
			<div class="left">
				<img src="<%=cp%>/resource/images/lumos/seat.png">
				관람석 총 ${dto.totalSeat}석
			</div>
			<div class="right">
				<p>일반 판매석&nbsp;&nbsp;${dto.nondisabled }석 | 장애인석(휠체어석)&nbsp;&nbsp;${dto.disabled}석</p>
				<p>매월 마지막 월요일 휴관</p>				
			</div>
		</div>
		<div class="clearD"></div>
		<div class="content_sec">
			${dto.content}
		</div>
	</div>
</div>
