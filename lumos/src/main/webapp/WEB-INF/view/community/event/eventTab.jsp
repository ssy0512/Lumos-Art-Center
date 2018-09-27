<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/eventLayout.css" type="text/css">
<script type="text/javascript">
function ajaxText(url) {
	$.ajax({
		type:"get"
		,url:url
		,success:function(data) {
			$("#event_info").html(data);	
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	console.log(jqXHR.responseText);
	    }
	});
}


function listTab(tab) {
	var url="<%=cp%>/community/event/"+tab;
	
	ajaxText(url);
}

$(function () {
	$(".nowpoint").each(function () {
		$(this).addClass("none");
	});
	$("#event-ongoing").find("img").removeClass("none");
	$("#event-ongoing").find("a").addClass("on_red");
	var tab=$("#event-ongoing").attr("data-tab");
	listTab(tab);
	
	$("div.wrap li").click(function() {
		var $$tab=$(this).attr("data-tab");
		
		$(".nowpoint").each(function () {
			$(this).addClass("none");
		});
		$("div.wrap li a").each(function () {
			$(this).removeClass("on_red");
		});
		
		$("#event-"+$$tab).find("img").removeClass("none");
		$("#event-"+$$tab).find("a").addClass("on_red");
		
		listTab($$tab);
	});
});
</script>

<div class="body-container" style="width:100%">
<%-- 	<img src="<%=cp %>/resource/images/lumos/concertHall.jpg" style="min-width: 1438px;
    max-width: 100%;"> --%>
<div class="placewrap" style="width:100%">
	<div class="wrap">
		<ul>
			<li id="event-ongoing" style="width:50%;" data-tab="ongoing">
				<a>진행중인 이벤트</a>
				<img class="nowpoint" src="<%=cp %>/resource/images/lumos/d_point.png">
			</li>
			<li id="event-past" style="width:50%;" data-tab="past">
				<a>당첨자 발표 · 지난이벤트</a>
				<img class="nowpoint" src="<%=cp %>/resource/images/lumos/d_point.png">
			</li>
		</ul>
	</div>
</div>
	<div id="event_info"></div>
</div>
<%-- 할인정보 --%>
<div class="eventNotice">
	<div class="wrap">
		<jsp:include page="/WEB-INF/view/layout/eventNotice.jsp"></jsp:include>
	</div>
</div>