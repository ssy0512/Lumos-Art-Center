<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/ticketingLayout.css" type="text/css">
<style type="text/css">
.ui-widget.ui-widget-content{
	border:none;
} 
</style>
<script type="text/javascript">
var hallNum;
var $tab;
$( function() {
	var availableDates = new Array();
	<c:forEach items="${list}" var="dto">
		availableDates.push("${dto.sessionDate}");
	</c:forEach>
	
	// 회차있는 날 외에는 선택막기
	function available(date) {
	    var m = date.getMonth()+1, d = date.getDate(), y = date.getFullYear();
	    if(m<10){
	    	m="0"+m;
	    }
	    if(d<10){
	    	d="0"+d;
	    }
	    var ymd=y+"-"+m+"-"+d;
	    if($.inArray(ymd,availableDates)>=0){
	    	return[true,"",""];
	    }else{
	    	return [false,"",""];
	    }
	}	

	$.datepicker.regional['ko'] = {
			closeText: '닫기',
			prevText: '이전달',
			nextText: '다음달',
			currentText: '오늘',
			monthNames: ['1월','2월','3월','4월','5월','6월',
			'7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월',
			'7월','8월','9월','10월','11월','12월'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			weekHeader: 'Wk',
			dateFormat: 'yy-mm-dd',
			firstDay: 0,
			isRTL: false,
			showMonthAfterYear: true,
			yearSuffix: '년'
			
	};
	
	$.datepicker.setDefaults($.datepicker.regional['ko']);
    $( "#datepicker" ).datepicker({
    	onSelect:function(dateText, inst){
    		var dateAsString = dateText;
    		var date=dateAsString.replace(/-/g,"");
			var url="<%=cp%>/ticketing/sessionList?sessionDate="+date;

    		ajaxText(url);
    	},
    	beforeShowDay:available
    }); 
});

function ajaxText(url) {
	$.ajax({
		type:"get"
		,url:url
		,success:function(data) {
			$("#session-list").html(data);	
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	console.log(jqXHR.responseText);
	    }
	});
}

// 회차에 대한 잔여좌석 정보
$(function() {
	$("body").on("click",".timeList",function(){
		$tab=$(this).attr("data-time");
		var dateValue=$( "#datepicker" ).val();
		$(".timeList").each(function(){
			$(this).removeClass("active");
		});
		
		$("#time-"+$tab).addClass("active");
		
		var time=$(this).text();
		var url="<%=cp%>/ticketing/seatList?sessionNum="+$tab+"&sessionDate="+dateValue;
		ajaxData(url, $tab);
	});
});

function ajaxData(url, tab) {
	$.ajax({
		type:"get"
		,url:url
		,success:function(data) {
			$("#session-list").html(data);
			$("#time-"+tab).addClass("active");
			
			hallNum=$("#hallNum").val();
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	console.log(jqXHR.responseText);
	    }
	});
}
function goBook(){
	location.href="<%=cp%>/ticketing/selectSeat?hallNum="+hallNum+"&sessionNum="+$tab;
}
</script>
<div class="body-container" style="margin-top:15px;width:620px;margin-bottom:15px;">
	<form name="ticketForm" action="" method="post">
		<div style="float:left;">
			<p class="selectDate" style="">관람일 선택</p>
			<div id="datepicker" style="height:250px;border: 1px solid #d3d3d3;border-radius: 4px;"></div>  
		</div> 
		<div id="session-list" style="float:left;margin-left:15px;">
			<div style="width:150px;height:300px;float:left;">
				<p class="selectDate" style="width:150px;">회차(관람시간)</p>
				<div style="height: 250px;text-align:center;padding:30px;"> 
					관람일을 먼저 선택해주세요.
				</div>
			</div>
			<div style="width:175px;height:269px;float:left;margin-left:15px;margin-top:30px;border: 1px solid #d3d3d3;border-radius: 4px;"> 
				<p style="width:175px;padding:8px 0px 8px 15px;border-bottom:1px solid #d3d3d3;">좌석등급 / 잔여석</p> 
				<div style="height: 250px;text-align:center;float:left;padding:30px;">   
					회차 선택 후 확인 가능합니다.
				</div>
			</div>
		</div>
	</form>
	<%-- 유의사항 --%>
	<div style="width:100%;border: 1px solid #d3d3d3;border-radius: 4px;float:left;margin-bottom:15px;">
		<jsp:include page="/WEB-INF/view/layout/notice.jsp"></jsp:include>
	</div>
	<div style="text-align:center;">
		<button type="button" class="adBtn" onclick="history.back();">
			이전단계
		</button>
		<button type="button" class="adBtn" onclick="goBook();">
			다음단계
		</button>
	</div>
</div>