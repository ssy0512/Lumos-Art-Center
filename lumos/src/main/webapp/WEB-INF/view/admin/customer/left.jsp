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
    	<span>고객관리</span>
    </div>
   <%--   <a href="<%=cp%>/admin/customer/question/questionlist" class="list-group-item">1:1문의 관리</a>
     <a href="<%=cp%>/admin/customer/lost/main" class="list-group-item">유실물 목록 관리</a> --%>
    <a>
    	<button onclick="javascript:location.href='<%=cp%>/admin/customer/question/questionlist';">문의글 목록 조회</button>
    </a>
    <a>
    	<button onclick="javascript:location.href='<%=cp%>/admin/customer/lost/main';">유실물 목록 관리</button>
    </a> 
     
</div> 
