<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitInfo.css" type="text/css">
<script type="text/javascript">
$(function () {
	$(".nowpoint").each(function () {
		$(this).addClass("none");
	});
	$("#hall-${dto.hallNum}").find("img").removeClass("none");
	$("#hall-${dto.hallNum}").find("a").addClass("on_red");
});

</script>

<div class="placewrap">
	<div class="wrap">
		<ul>
		<c:forEach items="${list}" var="vo">
			<li id="hall-${vo.hallNum}">
				<a href="<%=cp %>/exhibit/info?num=${vo.hallNum}">${vo.hallName}</a>
				<img class="nowpoint" src="<%=cp %>/resource/images/lumos/d_point.png">
			</li>
		</c:forEach>
		</ul>
	</div>
</div>

<div class="place_info">
	<div class="wrap">
		<h2>${dto.hallName}
			<img class="place_icon" src="<%=cp%>/resource/images/lumos/hangaram_icon.png">
		<c:if test="${sessionScope.member.userId=='admin'}">
			<button type="button" class="adBtn" style="margin-top:3px; margin-right: 10px;"
				onclick="javascript:location.href='<%=cp%>/admin/exHallinfo/update?num=${dto.hallNum}'">
				전시장 상세정보 관리</button>
		</c:if>
		</h2>

		<div class="content_top">
			<div class="left">
				<img src="<%=cp%>/resource/images/lumos/box.png">
				LAC 개별 전시관 ${dto.exHallLocate}
			</div>
			<div class="right">
				<p>3월~10월 전시 (11:00~20:00) ㅣ 11월~2월 전시 (11:00~19:00)</p>
				<p>매월 마지막 월요일 휴관</p>				
			</div>
		</div>
		<div class="clearD"></div>
		<div class="content_sec">
			${dto.exHallImage}
			<img src="<%=cp%>/uploads/image/20180921160238395548251488792.jpg">
		</div>
	</div>
</div>