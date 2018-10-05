<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp=request.getContextPath();
%>
<div style="width:150px;height:300px;float:left;">
	<p class="selectDate" style="width:150px;">회차(관람시간)</p>
	<c:if test="${empty timeList }">
		<div style="height: 250px;text-align:center;padding:30px;"> 
			다른 회차를 선택해주세요.
		</div>
	</c:if>
	<c:forEach var="dto" items="${timeList }">
		<p id="time-${dto.sessionNum }" class="timeList" data-time="${dto.sessionNum }">${dto.sessionTime}</p> 
	</c:forEach>
</div>
<div style="width:175px;height:269px;float:left;margin-left:15px;margin-top:30px;border: 1px solid #d3d3d3;border-radius: 4px;"> 
	<p style="width:175px;padding:8px 0px 8px 15px;border-bottom:1px solid #d3d3d3;">좌석등급 / 잔여석</p> 
	<c:if test="${empty seatList }">
		<div style="height: 250px;text-align:center;float:left;padding:30px;">   
			회차 선택 후 확인 가능합니다.
		</div>
	</c:if>
	<c:forEach var="vo" items="${seatList }">
		<p style="width:10px; height:10px; background-color:${vo.color};"/>
		<p class="seatList">${vo.seatLevel} | ${vo.seatCount }석</p>
	</c:forEach>
</div>