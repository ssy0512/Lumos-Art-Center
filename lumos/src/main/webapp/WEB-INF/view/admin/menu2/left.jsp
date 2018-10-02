<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	if(! idx) idx=2;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
</script>

<div class="list-group">
    <div class="list-group-item-lefthead">
    	<span>일정등록</span>
    </div>
     <a href="<%=cp%>/admin/menu2/concertSchedule/insertedlist" class="list-group-item">LUMOS 공연 등록</a>
     <a href="<%=cp%>/admin/menu2/exhibitSchedule/exhibitlist" class="list-group-item">LUMOS 전시 등록</a>
     <a href="<%=cp%>/admin/menu2/academySchedule/academylist" class="list-group-item">강의 일정 등록</a>
</div> 
