<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitInfo.css" type="text/css">
<script type="text/javascript">
function ajaxText(url) {
	$.ajax({
		type:"get"
		,url:url
		,success:function(data) {
			$("#place_info").html(data);	
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
	var url="<%=cp%>/concert/seatInfo?num="+tab;
	
	ajaxText(url);
}

$(function () {
	$(".nowpoint").each(function () {
		$(this).addClass("none");
	});
	$("#hall-1").find("img").removeClass("none");
	$("#hall-1").find("a").addClass("on_red");
	var tab=$("#hall-1").attr("data-tab");
	listTab(tab);
	
	$("div.wrap li").click(function() {
		var $$tab=$(this).attr("data-tab");
		
		$(".nowpoint").each(function () {
			$(this).addClass("none");
		});
		$("div.wrap li a").each(function () {
			$(this).removeClass("on_red");
		});
		
		$("#hall-"+$$tab).find("img").removeClass("none");
		$("#hall-"+$$tab).find("a").addClass("on_red");
		
		listTab($$tab);
	});
});
</script>

<div class="body-container" style="width:100%">
<div class="placewrap" style="width:100%">
	<div class="wrap">
		<ul>
		<c:forEach items="${list}" var="vo">
			<li id="hall-${vo.hallNum}" style="width:170px;" data-tab="${vo.hallNum }">
				<a>${vo.hallName}</a>
				<img class="nowpoint" src="<%=cp %>/resource/images/lumos/d_point.png">
			</li>
		</c:forEach>
		</ul>
	</div>
</div>
	<div id="place_info"></div>
</div>

