<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
//엔터 처리
$(function(){
	   $("input").not($(":button")).keypress(function (evt) {
	        if (evt.keyCode == 13) {
	            var fields = $(this).parents('form,body').find('button,input,textarea,select');
	            var index = fields.index(this);
	            if ( index > -1 && ( index + 1 ) < fields.length ) {
	                fields.eq( index + 1 ).focus();
	            }
	            return false;
	        }
	     });
});
</script>
<div class="header-top">
    <div class="header-left">
        <p style="padding: 4px; margin: 2px; color: #434343;">
            <a href="<%=cp%>/" style="text-decoration: none; color: #434343;">HOME</a>
            <a href="<%=cp%>/" style="text-decoration: none; color: #aa1717;">LUMOS</a>
        </p>
    </div>
    <div class="header-right">
        <div style="padding: 7px;  float: right;">
			<c:if test="${empty sessionScope.member}">
                <a href="<%=cp%>/member/login.do">로그인</a>
                    &nbsp;&nbsp;
                <a href="<%=cp%>/member/member.do">회원가입</a>
            </c:if>
            <c:if test="${not empty sessionScope.member}">
                <span style="color:blue;">${sessionScope.member.userName}</span>님
                    &nbsp;&nbsp;
                    <a href="<%=cp%>/member/logout.do">로그아웃</a>
                    &nbsp;&nbsp;
                    <a href="<%=cp%>/member/pwd.do?mode=update">정보수정</a>
            </c:if>
            &nbsp;&nbsp;<a href="<%=cp%>/">고객센터</a>
            &nbsp;&nbsp;<a href="<%=cp%>/">정보공개</a>
            &nbsp;&nbsp;<a href="<%=cp%>/">사이트맵</a>
        </div>
    </div>
</div>

<div class="menu">
	<div class="menu-left">
		<a href="<%=cp%>/goods">ART SHOP</a>
	</div>
	<div class="menu-center">
		<div class="nav-align">
		    <ul class="nav">
		        <li><a href="<%=cp%>/goods">BEST</a></li>
		        <li><a href="#">문구</a></li>
		        <li><a href="#">잡화 · 악세서리</a></li>
		        <li><a href="#">디지털DVD</a></li>
		    </ul>
		 </div>
    </div>
    <div class="menu-right">
    	<div class="mainSearchDiv">
	    	<input type="text" class="mainSearch">
	    	<a><img class="mainSearchImg" src="<%=cp %>/resource/images/lumos/search-on.png"></a>
    	</div>
	</div>
</div>
