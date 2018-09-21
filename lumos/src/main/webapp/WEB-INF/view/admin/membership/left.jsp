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
    <a>
    	<button onclick="javascript:location.href='<%=cp%>/admin/membership/regular/regularList';">일반 회원</button>
    </a>
    <a>
    	<button onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyList';">기업 회원</button>
    </a>
</div> 
