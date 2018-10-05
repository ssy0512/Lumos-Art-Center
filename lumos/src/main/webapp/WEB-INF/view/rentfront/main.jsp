<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/academystyle.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/rentfrontlayout.css" type="text/css">

<script type="text/javascript">

$(function(){
	$("#tab-notices").addClass("active");
	listPage(1);
	
	// 클릭으로 탭 전환
	$("ul.rent-tabs li").click(function() {
		tab = $(this).attr("data-tab");
		alert(tab);
		
		$("ul.rent-tabs li").each(function () {
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		listPage(1);
	});
});

//글리스트 및 글쓰기폼, 글보기, 글수정폼 ajax
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return;
			}
			$("#tab-list").html(data);
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
function listPage(page) {
	var $tab = $(".rent-tabs .active");
	var tab = $tab.attr("data-tab");
	var url = "<%=cp%>/rentfront/"+tab+"/list";
	var query = "pageNo="+page;
	
	ajaxHTML(url, "get", query);
}

function name() {
	
}

</script>

<div>
	<div class="main_photo half_photo" style=" height: 250px;">
			<h1 class="half_photo_title halfptop80">대관안내</h1>
	</div>
</div>

<div class="body-container" style="width: 1020px;">
    <div>
	    <div>
	    	<ul class="rent-tabs">
	    		<li id="tab-notices" data-tab="notice">
	    			<a>대관안내</a>
	    		</li>
	    		<li id="tab-info" data-tab="info">공간별 대관안내</li>
	    		<li id="tab-request" data-tab="request">대관신청</li>
	    	</ul>
	    </div>
	    
	    <div id="tab-list" style="clear: both; padding: 20px"> </div>
	</div>
</div>	

<form name="rentfrontSearchForm" action="" method="post">

</form>
	
