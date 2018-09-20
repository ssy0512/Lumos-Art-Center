<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/sch_month.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitTabs.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitScheduleList.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
var currentDay = new Date(); 
var currentYear = currentDay.getFullYear();

function ajaxText(url) {
	$.ajax({
		type:"get"
		,url:url
		,success:function(data) {
			$("#tab-content").html(data);	
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	console.log(jqXHR.responseText);
	    }
	});
}


$(function(){
	$("#tab-list").addClass("active");
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	listTab(tab);

	$("ul.tabs li").click(function() {
		var $$tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+$$tab).addClass("active");
		
		listTab($$tab);
	});
});

function listTab(tab) {
	var url="<%=cp%>/concert/"+tab;
	
	ajaxText(url);
}
</script>

<!-- 월간일정 -->
<script type="text/javascript">
$(function(){
	var today="${today}";
	$("#largeCalendar .textDate").each(function (i) {
        var s=$(this).attr("data-date");
        if(s==today) {
        	$(this).parent().css("background", "#ffffd9");
        }
    });
});
 
$(function(){
	// 월을 눌렀을때
	$("body").on("click", ".tab_month li", function() {
		var $month = $(this).attr("data-month");
		var year=$("#current-year").attr("data-year");
		
		$("ul.tab_month li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#month-"+$month).addClass("active");
		changeDate($month,year);
	});
	
	// 월간일정
	// 년도-1 버튼눌렀을때
	$("body").on("click", ".prebtnDate",function(){
		var month = $("ul.tab_month li.active").attr("data-month");
		var datayear=$("#current-year").attr("data-year");
		var year = Number(datayear)-1;
		changeDate(month,year);
	});
	
	// 년도+1 버튼눌렀을때
	$("body").on("click", ".nextbtnDate",function(){
		var month = $(".tab_month li.active").attr("data-month");
		var datayear=$("#current-year").attr("data-year");
		var year = Number(datayear)+1;
		changeDate(month,year);
	});
	
	// 연간일정
	// 년도-1 버튼눌렀을때
	$("body").on("click", ".prebtnYear",function(){
		var datayear=$("#current-year").attr("data-year");
		var year = Number(datayear)-1;
		changeYear(year);
	});
	
	// 년도+1 버튼눌렀을때
	$("body").on("click", ".nextbtnYear",function(){
		var datayear=$("#current-year").attr("data-year");
		var year = Number(datayear)+1;
		changeYear(year);
	});
}); 

// 월간일정
function changeDate(month,year) {
	var url="<%=cp%>/concert/monthly?year="+year+"&month="+month;
	ajaxText(url);
}

// 연간일정
function changeYear(year) {
	var url="<%=cp%>/concert/annual?year="+year;
	ajaxText(url);
}

//공연 제목 클릭 -----------------------
function goArticle(concertNum){
	var date=$(this).attr("data-date");
	var url="<%=cp%>/concert/article?concertNum="+concertNum;
	location.href=url;
}

//---------------------------------------------------------------------------
// 맞춤검색
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$("#tab-content").html(data);
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	console.log(jqXHR.responseText);
	    }
	});
}

function listPageS() {
	var url="<%=cp%>/concert/list";
	var query=$('form[name=concertScheduleSearchForm]').serialize();

	if(! query) {
		query="year="+currentYear;
	}
	ajaxHTML(url, "get", query);
}

// 클릭으로 검색 기간 전환
$("body").on("click", "ul.sch_period_type li", function() {
	var type = $(this).attr("data-type");
	var schf=document.concertScheduleSearchForm;
	
	schf.period_type.value=type;
	
	$("ul.sch_period_type li").each(function () {
		$(this).removeClass("active_p");
	});
	
	$("#type-"+type).addClass("active_p");
	
	// 기간이 전체인 경우 외에는 전부 올해로 자동 전환
	if(type == "all"){
		schf.year.value=$(".titleDate").html();
	} else {
		schf.year.value=currentYear;
	}
	
	listPageS();
});

//클릭으로 이전년도 다음년도 가기
$("body").on("click", ".sch_year a", function() {
	var schf=document.concertScheduleSearchForm;
	
	//이전년도:-1, 다음년도:1
	var num = $(this).attr("data-yearNum")*1;
	
	//현재 화면에 표시중인 년도
	var year = $(".titleDate").html()*1;	
	year = year+num;
	
	schf.year.value=year;
	
	//기간 전체로 변경
	$("ul.sch_period_type li").each(function () {
		$(this).removeClass("active_p");
	});
	$("#type-all").addClass("active_p");
	schf.period_type.value='all';
	
	listPageS();
});

//전시장 전체 선택
$("body").on("click", "#hall-all", function() {
	var schf=document.concertScheduleSearchForm;
	
	//전체버튼 외 다른 버튼 off로 전환	
	$(".sch_hallGroup ul li a.on").each(function () {
		$(this).removeClass("on");
		$(this).addClass("off");
	});
	
	//전체버튼 on으로 전환
	$(this).children().removeClass("off");
	$(this).children().addClass("on");
	
	//검색할 전시장 조건 없애기 
	schf.sch_hall.value='';
	
	//현재 선택중인 기간에서 모든 전시장으로 검색
	listPageS();
});

//전시장 선택(전체버튼 제외)
$("body").on("click", ".sch_hallGroup ul li.notAll", function() {
	var schf=document.concertScheduleSearchForm;
	var $onoff = $(this).children();
	var hallList = schf.sch_hall;
	
	$("#hall-all").children().removeClass("on");
	$("#hall-all").children().addClass("off");
		
	if($onoff.attr("class")=="on"){
		$onoff.removeClass("on");
		$onoff.addClass("off");
	}else{
		$onoff.removeClass("off");
		$onoff.addClass("on");
	}
	
	hallList.value="";
	$(".sch_hallGroup ul li a.on").each(function () {
		hallList.value+=$(this).parent().attr("data-hall")+",";
	});
	
	hallList.value=hallList.value.substring(0,hallList.value.length-1);

	//모두 선택 해제된 경우 전체버튼 활성화
	if(hallList.value.length==0){
		$("#hall-all").children().removeClass("off");
		$("#hall-all").children().addClass("on");
	}
	
	listPageS();
});

function search() {
	var schf=document.concertScheduleSearchForm;
	var $searchValue = $(".sch_name input");
	$searchValue.val($.trim($searchValue.val()));
	var searchValue = $searchValue.val();
	
	if(! searchValue){
		$searchValue.focus();
		return;
	}
	
	schf.searchValue.value=searchValue;
	listPageS();
}

function deleteButtonShowHide() {
	var $searchValue = $(".sch_name input");
	var searchValue = $searchValue.val();
	searchValue= $.trim(searchValue);
	
	if(searchValue){
		$(".delete").removeClass("hide");
	} else{
		$(".delete").addClass("hide");
	}
}
</script>

<div class="body-container">
	<ul class="tabs">
	   	<li id="tab-list" data-tab="list"><a>맞춤검색</a></li>
	   	<li id="tab-monthly" data-tab="monthly"><a>월간일정</a></li>
	   	<li id="tab-annual" data-tab="annual"><a>연간일정</a></li>
 	</ul>
 	<div id="tab-content" style="margin-top: 15px;"></div>
</div>