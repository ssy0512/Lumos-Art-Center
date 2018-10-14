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

function searchList(page) {
	var url="<%=cp%>/community/event/past";
	
	var query="pageNo="+page;
	var search=$('form[name=searchForm]').serialize();
	query=query+"&"+search;
	ajaxHTML(url, "get", query);
}

function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return;
			}else{
				listPage(page);
			}
			$("#event_info").html(data);
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

function listPage(page) {
	var url="<%=cp%>/community/event/past";
	var query="pageNo="+page;
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$("#event_info").html(data);
		}
	    ,beforeSend :function(jqXHR) {
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

//게시글 보기
function articleBoard(num, page) {
	var url="<%=cp%>/community/event/endArticle";
	
	var query="eventNum="+num;
	
	var search=$('form[name=searchForm]').serialize();
	query=query+"&pageNo="+page+"&"+search;
	
	location.href=url+"?"+query;
}
</script>

<div class="body-container" style="width:100%">
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
