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
	if(! idx) idx=1;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
</script>

<div class="list-group">
    <div class="list-group-item-lefthead">
    	<span>매출관리</span>
    </div>
     <a href="#" class="list-group-item">전체 매출 조회</a>
     <a href="#" class="list-group-item">공연 매출 조회</a>
     <a href="#" class="list-group-item">전시 매출 조회</a>
     <a href="#" class="list-group-item">아카데미 매출 조회</a>
     <a href="#" class="list-group-item">상품 매출 조회</a>
     <a href="#" class="list-group-item">통계</a>
</div> 
