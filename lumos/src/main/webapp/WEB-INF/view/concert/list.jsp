<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	$(function() {
		var f = document.concertScheduleSearchForm;
		var type = f.period_type.value;

		$("#type-" + type).addClass("active_p");

		var hList = f.sch_hall.value.split(',');
		$(".sch_hallGroup ul li a").each(function() {
			$(this).addClass("off");
		});

		if (f.sch_hall.value.length == 0) {
			$("#hall-all a").removeClass("off");
			$("#hall-all a").addClass("on");
		} else {
			for ( var i in hList) {
				$("#hall-" + hList[i] + " a").removeClass("off");
				$("#hall-" + hList[i] + " a").addClass("on");
			}
		}

		if (f.searchValue.value) {
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
	background: url(<%=cp%>/resource/images/lumos/bg_btn_checkOn.gif)
		no-repeat 0 50%;
}

.off {
	display: block;
	padding-left: 23px;
	line-height: 85px;
	background: url(<%=cp%>/resource/images/lumos/bg_btn_checkOff.gif)
		no-repeat 0 50%;
}
</style>
<div class="body-container">
	<div id="tab-content" style="padding-top: 22px;">
		<div class="sch_period">
			<div class="sch_year">
				<a style="left:0; background: url(<%=cp%>/resource/images/lumos/bg_btn_prev.gif) no-repeat 50% 50%;" data-yearNum="-1"></a>
				<span class="titleDate">${year}</span> 
				<a style="right:0; background: url(<%=cp%>/resource/images/lumos/bg_btn_next.gif) no-repeat 50% 50%;" data-yearNum="1"></a>
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
				<button type="button" class="delete hide" onclick="deletePerformanceName();"
					style="background: url(<%=cp%>/resource/images/lumos/btn_del.png) no-repeat 0 100%;"></button>
				<button type="button" onclick="search();"
					style="background: url(<%=cp%>/resource/images/lumos/bg_btn_sch_board.gif) no-repeat 0 100%;"></button>
			</div>
		</div>
	</div>
	<div class="sch_group">
		<div class="sch_txt">
			<p>${sDate}~${eDate}</p>
		</div>
		<div class="sch_hallGroup">
			<ul>
				<li id="hall-all" data-hall="all"><a>전체</a></li>
				<c:forEach var="hallName" items="${hallList}">
					<li id="hall-${hallName}" data-hall="${hallName}" class="notAll"><a>${hallName}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div class="concertScheduleContent" style="padding-bottom:50px;">
		<div class="concert_item">
			<c:forEach var="vo" items="${list}">
				<div class="resultList">
					<a href="<%=cp %>/concert/article?num=${vo.concertNum}&${query}">
						<c:if test="${not empty vo.conProfileImage }">
							<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/${vo.conProfileImage}">
						</c:if>
						<c:if test="${empty vo.conProfileImage }">
							<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/noposter.png" >
						</c:if>
					</a>
					<div class="sch_itemContent">
						<c:if test="${empty vo.seatPriceList }">
							<p class="concertName" style="padding-bottom : 167px; ">
								<a href="<%=cp %>/concert/article?num=${vo.concertNum}&${query}">${vo.concertName}</a>
							</p>
							<p class="concert_content">기간
								<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${vo.concertStart }~${vo.concertEnd }</span>
							</p>
							<p class="concert_content">장소
								<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${vo.hallName }</span>
							</p>
							<p class="concert_content">장르
								<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${vo.genre }</span>
							</p>
							<p class="concert_content">관람등급
								<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${vo.ratingName}</span>
							</p>
						</c:if>
						<c:if test="${not empty vo.seatPriceList }">
							<p class="concertName">
								<a href="<%=cp %>/concert/article?num=${vo.concertNum}&${query}">${vo.concertName}</a>
							</p>
							<p class="concert_content">기간
								<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${vo.concertStart }~${vo.concertEnd }</span>
							</p>
							<p class="concert_content">장소
								<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${vo.hallName }</span>
							</p>
							<p class="concert_content">장르
								<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${vo.genre }</span>
							</p>
							<p class="concert_content">관람등급
								<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${vo.ratingName}</span>
							</p>
							<p class="concert_content">가격
								<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${vo.seatPriceList}</span>
							</p>
						</c:if>
						<div class="reserveButtonDiv" style="width: 100px; float: right; margin-top: -43px;font-size:14pt;">
				           	<c:choose>
				           	<c:when test="${vo.concertEnd < today}">
				             	<a href="<%=cp %>/concert/article?num=${vo.concertNum}&${query}" style="width: 100px;float: right;color:darkgrey; background-color: #ffffff; border: 1px solid darkgrey;
				             					height:40px; line-height: 41px;">
				             		판매종료
				             	</a> 	             	
				            </c:when>                	 
			             	<c:when test="${vo.concertStart <= ptoday && not empty vo.content}">		
			                	<a href="<%=cp %>/ticketing/bookConcert?concertNum=${vo.concertNum}" style="width: 100px;height:40px; line-height: 41px;">예&nbsp;매</a>  	
				            </c:when>
				            <c:otherwise>
				            	<a href="<%=cp %>/concert/article?num=${vo.concertNum}&${query}" style="width: 100px;height:40px; line-height: 41px;color:#006fd2;background-color: #ffffff;border: 1px solid #006fd2;">예&nbsp;정</a>  	
				            </c:otherwise>
				            </c:choose>
				         </div>  	
					</div>
				</div>
			</c:forEach>
			<c:if test="${empty list }">
					<div class="noData" style=" border-top: 1px solid #e0e1e5;">등록된 공연이 없습니다.</div>
			</c:if>
		</div>
	</div>
	
	<form name="concertScheduleSearchForm" action="" method="post">
		<input type="hidden" name="period_type" value="${period_type}">
		<input type="hidden" name="year" value="${year}"> <input
			type="hidden" name="sch_hall" value="${sch_hall}"> <input
			type="hidden" name="searchValue" value="${searchValue}">
	</form>
</div>