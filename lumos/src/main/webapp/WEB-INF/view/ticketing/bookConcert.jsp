<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/ticketingLayout.css" type="text/css">
<script type="text/javascript">
$( function() {
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
			yearSuffix: '년',
			beforShowDay:disableAllTheseDays
	};
	
	$.datepicker.setDefaults($.datepicker.regional['ko']);
    $( "#datepicker" ).datepicker({
    	onSelect:function(dateText, inst){
    		var dateAsString = dateText;
    		var date=dateAsString.replace(/-/g,"");
			var url="<%=cp%>/ticketing/sessionList?sessionDate="+date;
    		ajaxText(url);
    	}		 
    }); 
});

var disabledDays = "${list.sessionDate}";

//이전 날짜들은 선택막기
function noBefore(date){
    if (date < new Date())
        return [false];
    return [true];
}

// 회차있는 날 외에는 선택막기
function disableAllTheseDays(date) {
    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
    for (i = 0; i < disabledDays.length; i++) {
        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
            return [false];
        }
    }
    return [true];
}

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
</script>
<div class="body-container" style="margin-top:15px;">
	<form name="ticketForm" action="" method="post">
		<div style="float:left;">
			<p class="selectDate" style="">관람일 선택</p>
			<div id="datepicker"></div>  
		</div> 
		<div id="session-list" style="float:left;margin-left:15px;"></div>
	</form>
</div>
