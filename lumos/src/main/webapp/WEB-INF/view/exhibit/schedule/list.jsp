<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function () {
	var f=document.exhibitScheduleSearchForm;
	var type = f.period_type.value;
	
	$("#type-"+type).addClass("active_p");
	
	var hList = f.sch_hall.value.split(',');
	$(".sch_hallGroup ul li a").each(function () {
		$(this).addClass("off");
	});
	
	if(f.sch_hall.value.length==0){
		$("#hall-all a").removeClass("off");
		$("#hall-all a").addClass("on");
	} else {
	    for ( var i in hList ) {
	      	$("#hall-"+hList[i]+" a").removeClass("off");
	      	$("#hall-"+hList[i]+" a").addClass("on");
	    }
	}
	
	if(f.searchValue.value){
		$(".sch_name input").val(f.searchValue.value);
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
<div class="body-container">
<div id="tab-content" style="padding-top: 22px;">
<div class="sch_period">
	<div class="sch_year">
		<a style="left:0; background: url(<%=cp %>/resource/images/lumos/bg_btn_prev.gif) no-repeat 50% 50%;" data-yearNum="-1"></a>
		<span class="sch_showyear">${year}</span>
		<a style="right:0; background: url(<%=cp %>/resource/images/lumos/bg_btn_next.gif) no-repeat 50% 50%;" data-yearNum="1"></a>
	</div>
	<ul class="sch_period_type">
		<li id="type-all" data-type="all"><a>전체</a></li>
		<li id="type-thisweek" data-type="thisweek"><a>이번주</a></li>
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
		<p>${sDate}~${eDate}</p>
	</div>
	<div class="sch_hallGroup">
		<ul>
			<li id = "hall-all"  data-hall="all"><a>전체</a></li>
			<c:forEach var="hallName" items="${hallList}">
				<li id = "hall-${hallName}" data-hall="${hallName}" class="notAll"><a>${hallName}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>

<div id="exhibitScheduleContent" style="width: 1040px;">
	<c:forEach var="vo" items="${list}">
		<div class="sch_item">
			<div class="sch_itemPoster">
				<a href="<%=cp %>/exhibit/scheduleToArticle?num=${vo.exhibitNum}&${query}">
					<img src="<%=cp %>/resource/images/lumos/${vo.exProfileImage}">
				</a>
			</div>
			<div class="sch_itemContent">
				<h2 class="sch_itemContent_sbj"><a href="<%=cp %>/exhibit/scheduleToArticle?num=${vo.exhibitNum}&${query}">${vo.exhibitName}</a></h2>
				<p class="sch_itemContent_1">${vo.hallName}&nbsp;${vo.exHallLocate}</p>
				<p class="sch_itemContent_2">${vo.exhibitStart} ~ ${vo.exhibitEnd}</p>
			</div>
		</div>
	</c:forEach>
</div>

<form name="exhibitScheduleSearchForm" action="" method="post">
	<input type="hidden" name="period_type" value="${period_type}">
	<input type="hidden" name="year" value="${year}">
	<input type="hidden" name="sch_hall" value="${sch_hall}">
    <input type="hidden" name="searchValue" value="${searchValue}">
</form>
</div>
</div>