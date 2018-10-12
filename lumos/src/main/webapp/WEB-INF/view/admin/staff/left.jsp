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
    <div class="list-group-item-lefthead"><span>직원관리</span></div>
     <%-- <a href="<%=cp%>/admin/staff/staffs/stafflist" class="list-group-item">LUMOS 직원목록</a> --%>
       <a>
    	<button onclick="javascript:location.href='<%=cp%>/admin/staff/staffs/stafflist';">LUMOS 직원목록</button>
    </a>
     <a>
    	<button onclick="javascript:location.href='<%=cp%>/admin/staff/instructor/instructorlist';">LUMOS 강사 목록</button>
    </a>
</div> 
