<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	var month="${month}";
	$("#month-"+month).addClass("active");
});
</script>
<div class="body-container">
	<div id="tab-content" style="clear: both; padding: 0px 0px 90px;">
		<div class="sch_month">
			<div class="tab_year">
				<span class=" prebtnDate">＜</span>
				<span class="titleDate" id="current-year" data-year="${year}">${year}</span> 
				<span class="nextbtnDate">＞</span>
			</div>
			<ul class="place_info fr">
				<li>A홀</li>
				<li>B홀</li>
				<li>C홀</li>
				<li>D홀</li>
				<li>E홀</li>
				<li>F홀</li>
			</ul>
			<ul class="tab_month">
				<c:forEach var="cnt" begin="1" end="12">
					<li id="month-${cnt}" data-month="${cnt}"><a>${cnt}</a></li>
				</c:forEach>
			</ul>
		</div>
		<table id="largeCalendar"
			style="width: 100%; margin: 0px auto; border-spacing: 1px; background: #cccccc;">
			<tr align="center" height="40"  bgcolor="#eeeeee">
				<td width="120" style="color: #ff0000;">일</td>
				<td width="120">월</td>
				<td width="120">화</td> 
				<td width="120">수</td>
				<td width="120">목</td>
				<td width="120">금</td>
				<td width="120" style="color: #0000ff;">토</td>
			</tr>

			<c:forEach var="row" items="${days}">
				<tr align="left" height="120" valign="top" bgcolor="#ffffff">
					<c:forEach var="d" items="${row}">
						<td style="padding: 5px; box-sizing: border-box;">${d}</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
