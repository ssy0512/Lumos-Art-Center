<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
	<tbody id='listReplyBody'>
	<c:forEach var="vo" items="${listReply}">
	    <tr height='35' style='background: #eeeeee;'>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
	           <span><b>${vo.userName}</b></span>
	        </td>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
	           <span>${vo.created}</span> |
	           <c:if test="${vo.userId == sessionScope.member.userId ||  sessionScope.member.userId == 'admin' }">
	                <span class="deleteReply" style="cursor: pointer;" data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</span>
	           	</c:if>
	           <c:if test="${vo.userId != sessionScope.member.userId &&  sessionScope.member.userId != 'admin' }">
	           		<span class="notifyReply">신고</span>
	           	</c:if>
	        </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px;'>
	              ${vo.content}
	        </td>
	    </tr>
	</c:forEach>
	</tbody>
	
	<tfoot id='listReplyFooter'>
		<tr height='40' align="center">
            <td colspan='2' >
              ${paging}
            </td>
           </tr>
	</tfoot>
</table>
