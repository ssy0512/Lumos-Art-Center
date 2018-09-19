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
    <div class="list-group-item-lefthead"><span>회원관리</span></div>
     <a href="<%=cp%>/admin/membership/regular/regular" class="list-group-item">일반 회원</a>
     <a href="<%=cp%>/admin/membership/company/companyList" class="list-group-item">기업 회원</a>
</div> 
