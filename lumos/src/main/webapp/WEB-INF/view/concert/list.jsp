<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
var currentDay = new Date();  
var currentYear = currentDay.getFullYear();
var sch_hall="";

$(function(){
	if($(".tabs .active").attr("data-tab")=="schedule"){
		getYear(currentYear);
		posterlist();
	}
});
</script>

<style>
/* 체크박스용 */
.on {
	display: block;
    padding-left: 23px;
    line-height: 85px;
	background: url(<%=cp %>/resource/images/lumos/bg_btn_checkOn.gif) no-repeat 0 50%;
}

.off {
	display: block;
    padding-left: 23px;
    line-height: 85px;
    background: url(<%=cp %>/resource/images/lumos/bg_btn_checkOff.gif) no-repeat 0 50%;
}
</style>

<div class="sch_period">
	<div class="sch_year">
		<a style="left:0; background: url(<%=cp %>/resource/images/lumos/bg_btn_prev.gif) no-repeat 50% 50%;" data-yearNum="-1"></a>
		<span class="sch_showyear"></span>
		<a style="right:0; background: url(<%=cp %>/resource/images/lumos/bg_btn_next.gif) no-repeat 50% 50%;" data-yearNum="1"></a>
	</div>
	<ul class="sch_period_type">
		<li id="type-all" data-type="all"><a>전체</a></li>
		<li id="type-thisweek" data-type="thisweek" class="active_p"><a>이번주</a></li>
		<li id="type-nextweek" data-type="nextweek"><a>다음주</a></li>
		<li id="type-month" data-type="month"><a>1개월</a></li>
		<li id="type-threemonths" data-type="threemonths"><a>3개월</a></li>
	</ul>
	<div class="sch_name">
		<input onkeyup="deleteButtonShowHide();" type="text" placeholder="공연명으로 검색">
		<button type="button" class="delete hide" onclick="deletePerformanceName();" style="background: url(<%=cp %>/resource/images/lumos/btn_del.png) no-repeat 0 100%;"></button>
		<button type="button" onclick="search();" style="background: url(<%=cp %>/resource/images/lumos/bg_btn_sch_board.gif) no-repeat 0 100%;"></button>
	</div>
</div>

<div class="sch_group">
	<div class="sch_txt">
		<p></p>
	</div>
	<div class="sch_hallGroup">
		<ul>
			<li id = "hall-all"  data-hall="all"><a class="on">전체</a></li>
			<c:forEach var="hallName" items="${hallList}">
				<li id = "hall-${hallName}" data-hall="${hallName}" class="notAll"><a class="off">${hallName}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>

<div id="exhibitScheduleContent" style="width: 1040px;">

</div>

