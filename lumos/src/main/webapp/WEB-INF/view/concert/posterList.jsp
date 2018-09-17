<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<c:forEach var="vo" items="${list}">
	<div class="sch_item">
		<div class="sch_itemPoster">
			<a>
				<img src="<%=cp %>/resource/images/lumos/${vo.exProfileImage}">
			</a>
		</div>
		<div class="sch_itemContent">
			<h2 class="sch_itemContent_sbj">${vo.exhibitName}</h2>
			<p class="sch_itemContent_1">${vo.hallName}&nbsp;${vo.exHallLocate}</p>
			<p class="sch_itemContent_2">${vo.exhibitStart} ~ ${vo.exhibitEnd}</p>
		</div>
	</div>
</c:forEach>


<input type="hidden" id="now_sch_period" value="${sDate}~${eDate}">
<input type="hidden" id="now_pageNo" value="${pageNo}">

	
