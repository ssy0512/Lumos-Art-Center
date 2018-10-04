<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="body-container" style="width: 700px; margin-top: 50px; margin-bottom: 50px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span>&nbsp;&nbsp;회원 가입</h3>
    </div>
    
	<div class="body-main">
	    <a><img src="<%=cp%>/resource/images/lumos/lumos_member_join.jpg"/></a><br></br>
	&nbsp;
	<a href="<%=cp%>/member/member"><img src="<%=cp%>/resource/images/lumos/join-private.png" width="300"/></a>
	    		&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
	    		&nbsp;&nbsp;&nbsp;
	    <a href="<%=cp%>/"><img src="<%=cp%>/resource/images/lumos/join-company.png" width="300"/></a><br>
    </div>
</div>
