<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<div class="event-container" style="width:100%;">
	<!-- 슬라이드 배너 들어갈 곳 -->
	<div class="slidebanner"></div>
	<div class="list_bg">
		<div class="wrap">
			<c:if test="${sessionScope.member.userId=='admin'}">
				<button type="button" class="adBtn"
					style="margin-top: 10px; margin-right: 10px;" 
					onclick="javascript:location.href='<%=cp%>/admin/community/event/created'">
					이벤트 등록</button>
			</c:if>
			<table style="width: 630px; margin: 50px auto; float: left; border-spacing: 0px;">
			<c:forEach var="dto" items="${list }" varStatus="status">
				<c:if test="${status.index!=0 && status.index%2==0}">
        	 		<c:out value="</tr><tr>" escapeXml="false"/>
        		</c:if>
        		<td width="210">
					<div style="width: 495px;height: 273px;margin: 0px 10px;">
						<a href="<%=cp %>/community/event/article?eventNum=${dto.eventNum}">
							<img src="<%=cp%>/resource/images/lumos/${dto.saveFilename}" style="width:495px;height: 158.2px;">
						</a>
					
					<p class="event_title"style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"> 
						<a href="<%=cp %>/community/event/article?eventNum=${dto.eventNum}"
						 style="overflow: hidden;text-overflow: ellipsis; ">${dto.title}</a>
					</p>
					<p>이벤트 기간 |
						${dto.eventStart}~${dto.eventEnd}</p>
					<p >당첨자 발표 | ${dto.eventWin}</p>
					</div>
				</td>
			</c:forEach>
			</table>
		</div>
	</div>
</div>
<%-- 할인정보 --%>
<div class="eventNotice">
	<div class="wrap">
		<jsp:include page="/WEB-INF/view/layout/eventNotice.jsp"></jsp:include>
	</div>
</div>