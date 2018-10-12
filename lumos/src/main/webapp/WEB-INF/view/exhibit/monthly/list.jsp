<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
tr td {
	   width: 145px;
}
</style>
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
				<a style="left:0; background: url(<%=cp%>/resource/images/lumos/bg_btn_prev.gif) no-repeat 50% 50%;" class="prebtnDate"></a>
				<span id="current-year" data-year="${year}" class="titleDate">${year}</span> 
				<a style="right:0; background: url(<%=cp%>/resource/images/lumos/bg_btn_next.gif) no-repeat 50% 50%;" class="nextbtnDate"></a>
			</div>
			<ul class="place_info fr">
				<li>제1전시장</li>
				<li>제2전시장</li>
				<li>제3전시장</li>
				<li>제4전시장</li>
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
