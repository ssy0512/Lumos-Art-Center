<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="container">
	<div>
	    <div style="margin: 120px auto 30px; width:420px; min-height: 350px;">
	    	<div style="text-align: center;">
	        	<span style="font-weight: bold; font-size:27px; color: #424951;">${title}</span>
	        </div>
	        
	        <div class="messageBox">
	            <div style="line-height: 150%; padding-top: 35px;">
                        성공적으로 입력되었습니다.<br>
	                   목록으로 돌아가시겠습니까?            
	            </div>
	            <div style="margin-top: 20px;">
                      <button type="button" onclick="javascript:location.href='<%=cp%>/admin/menu2/exhibitSchedule/article';" class="btnConfirm">이동하기</button>
                 </div>
	        </div>
	     </div>   
    </div>
</div>