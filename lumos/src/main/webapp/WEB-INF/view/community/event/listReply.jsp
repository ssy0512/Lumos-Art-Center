<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<table style='width: 100%; margin-top: 20px; border-spacing: 0px;border-top:1px solid #cccccc;'>
	<tbody id='listReplyBody'>
	<c:forEach var="vo" items="${listReply}">
	    <tr height='35'>
	       <td width='50%' style='padding-top:20px; border-right:none;'>
	           <span><b>${vo.userName}</b></span>
	        </td>
	       <td width='50%' style='padding-top:20px; border-left:none;' align='right'>
	           <span>${vo.created}</span>
	           <c:if test="${vo.userId == sessionScope.member.userId ||  sessionScope.member.userId == 'admin' }">
	                 |<span class="deleteReply" style="cursor: pointer;" data-replyNum='${vo.commentNum}' data-pageNo='${pageNo}'>삭제</span>
	           	</c:if>
	        </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding-top:20px;padding-bottom:20px;border-bottom:1px solid #cccccc;'>
	              ${vo.content}
	        </td>
	    </tr>
	</c:forEach>
	</tbody>
	<c:if test="${not empty listReply }">
	<tfoot id='listReplyFooter'>
		<tr height='40' align="center" >
            <td colspan='2' style="padding-bottom: 20px;" >
              ${paging}
            </td>
           </tr>
	</tfoot>
	</c:if>
</table>
