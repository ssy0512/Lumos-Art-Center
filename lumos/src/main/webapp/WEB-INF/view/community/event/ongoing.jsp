<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<div class="event-container">
	<!-- 슬라이드 배너 들어갈 곳 -->
	<div class="slidebanner"></div>
	<div class="list_bg">
		<div class="wrap">
			<c:if test="${sessionScope.member.userId=='admin'}">
				<button type="button" class="adBtn"
					style="margin-top: 3px; margin-right: 10px;"
					onclick="javascript:location.href='<%=cp%>/admin/community/event/created'">
					이벤트 등록</button>
			</c:if>
			<c:forEach var="dto" items="${list }">
				<div style="height: 273px;">
					<a href="<%=cp %>/community/event/article?eventNum=${dto.eventNum}">
						<img src="<%=cp%>/resource/images/lumos/${dto.saveFilename}">
					</a>
				</div>
				<p class="event_title">
					<a href="<%=cp %>/community/event/article?eventNum=${dto.eventNum}">${dto.title}</a>
				</p>
				<p class="event_content">이벤트 기간 |
					${dto.eventStart}~${dto.eventEnd}</p>
				<p class="event_content">당첨자 발표 | ${dto.eventWin}</p>
			</c:forEach>
		</div>
	</div>
</div>
