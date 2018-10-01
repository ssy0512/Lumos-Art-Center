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
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>

<div>
	<div class="main_photo half_photo" style="width: 1438px; height: 250px;">
			<h1 class="half_photo_title halfptop80">대관안내</h1>
	</div>
</div>

<div class="body-content-container" style="width: 1438px;">
    <div>
	    <div style="clear: both; width: 1438px;">
	    	<ul class="rent-tabs">
	    		<li id="tab-notices" data-tab="notice"><a>대관일정</a></li>
	    		<li id="tab-info" data-tab="info">대관료 안내</li>
	    		<li id="tab-request" data-tab="request">대관신청</li>
	    	</ul>
	    	
	    </div>
	    <div id="tab-content" style="clear: both; padding: 20px"> </div>
	</div>
</div>		