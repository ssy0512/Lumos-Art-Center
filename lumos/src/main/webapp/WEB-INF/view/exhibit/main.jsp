<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitTabs.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitScheduleList.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	$("#tab-schedule").addClass("active");
	listPage();
	
	// 클릭으로 탭 전환
	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function () {
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		listPage();
	});
});


//글리스트 및 글쓰기폼, 글보기, 글수정폼 ajax
function ajaxHTML(url, type) {
	$.ajax({
		type:type
		,url:url
		,success:function(data) {
			$("#tab-content").html(data);
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		location.href="<%=cp%>/member/login";
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

// 글 리스트 및 페이징 처리
function listPage() {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url = "<%=cp%>/exhibit/"+tab+"/list";
	
	ajaxHTML(url, "get");
}

//---------------------------------------------------------------------------


// 클릭으로 검색 기간 전환
$("body").on("click", "ul.sch_period_type li", function() {
	type = $(this).attr("data-type");
	
	$("ul.sch_period_type li").each(function () {
		$(this).removeClass("active_p");
	});
	
	$("#type-"+type).addClass("active_p");
	
	// 기간이 전체인 경우 외에는 전부 올해로 자동 전환
	if(type == "all"){
		posterlist($(".sch_showyear").html());
	} else {
		getYear(currentYear);
		posterlist();
	}
	
});


//클릭으로 이전년도 다음년도 가기
$("body").on("click", ".sch_year a", function() {
	//이전년도:-1, 다음년도:1
	var num = $(this).attr("data-yearNum")*1;
	
	//현재 화면에 표시중인 년도
	var year = $(".sch_showyear").html()*1;
	
	year = year+num;
	
	//기간 전체로 변경
	$("ul.sch_period_type li").each(function () {
		$(this).removeClass("active_p");
	});
	$("#type-all").addClass("active_p");
	
	getYear(year);
	posterlist();
});


//전시장 전체 선택
$("body").on("click", "#hall-all", function() {
	//전체버튼 외 다른 버튼 off로 전환	
	$(".sch_hallGroup ul li a.on").each(function () {
		$(this).removeClass("on");
		$(this).addClass("off");
	});
	
	//전체버튼 on으로 전환
	$(this).children().removeClass("off");
	$(this).children().addClass("on");
	
	//검색할 전시장 조건 없애기 
	sch_hall="";
	
	//현재 선택중인 기간에서 모든 전시장으로 검색
	posterlist();
});

//전시장 선택(전체버튼 제외)
$("body").on("click", ".sch_hallGroup ul li.notAll", function() {
	var $onoff = $(this).children();
	
	$("#hall-all").children().removeClass("on");
	$("#hall-all").children().addClass("off");
		
	if($onoff.attr("class")=="on"){
		$onoff.removeClass("on");
		$onoff.addClass("off");
	}else{
		$onoff.removeClass("off");
		$onoff.addClass("on");
	}
	
	
	sch_hall="";
	$(".sch_hallGroup ul li a.on").each(function () {
		sch_hall+=$(this).parent().attr("data-hall")+",";
	});
	
	sch_hall=sch_hall.substring(0,sch_hall.length-1);
	
	//모두 선택 해제된 경우 전체버튼 활성화
	if(sch_hall.length==0){
		$("#hall-all").children().removeClass("off");
		$("#hall-all").children().addClass("on");
	}
	posterlist();
});

function search() {
	var $searchValue = $(".sch_name input");
	$searchValue.val($.trim($searchValue.val()));
	var searchValue = $searchValue.val();
	
	if(! searchValue){
		$searchValue.focus();
		return;
	}
	
	posterlist();
}

	
function posterlist() {
	var year = $(".sch_showyear").html();
	var url="<%=cp%>/exhibit/schedule/posterList";
	var $type = $("ul.sch_period_type li.active_p");
	var type = $type.attr("data-type");
	
	var $searchValue = $(".sch_name input");
	$searchValue.val($.trim($searchValue.val()));
	var searchValue = $searchValue.val();
	
	var query="period_type="+type+"&year="+year+"&sch_hall="+sch_hall+"&searchValue="+searchValue;
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$("#exhibitScheduleContent").html(data);
			getYear(year);
			getPeriod();
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		location.href="<%=cp%>/member/login";
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

function getYear(year) {
	$(".sch_showyear").html(year);
}

function getPeriod() {
	$(".sch_txt p").html($("#now_sch_period").val());
}

function deletePerformanceName() {
	$(".sch_name input").val("");
	$(".delete").addClass("hide");
	posterlist();
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
//---------------------------------------------------------------------------

</script>

<div class="body-container" style="width: 1020px;">
	<div>
		<div>
			 <ul class="tabs">
			 	<li id="tab-schedule" data-tab="schedule"><a>맞춤검색</a></li>
			 	<li id="tab-monthly" data-tab="monthly"><a>월간일정</a></li>
			 	<li id="tab-annual" data-tab="annual"><a>연간일정</a></li>
			 </ul>
		</div>
		<div id="tab-content">
			&nbsp;
		</div>
	</div>
</div>

