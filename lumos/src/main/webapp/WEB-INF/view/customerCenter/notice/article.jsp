<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>


<div class="body-container" style="width: 700px;">
    <div class="body-title">
    <div>
    
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #aa1717; border-bottom: 1px solid #aa1717;">
			    <td colspan="2" align="center" >
			    ${dto.noticeNum} .
				${dto.title}
				  
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #aa1717;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       이름 : ${dto.userId}
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			       등록일 ${dto.created} | 조회 ${dto.hitcount}
			    </td>
			</tr>
			
			<tr style="border-bottom: 1px solid #aa1717;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.content}
			   </td>
			</tr>
			
		
			
			<tr height="35" style="border-bottom: 1px solid #aa1717;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="javascript:articleBoard('${preReadDto.noticeNum}', '${page}');">${preReadDto.title}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #aa1717;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			         <c:if test="${not empty nextReadDto}">
			              <a href="javascript:articleBoard('${nextReadDto.noticeNum}', '${page}');">${nextReadDto.title}</a>
			        </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			       <c:if test="${sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="btn" onclick="updateForm('${dto.noticeNum}', '${page}');">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="btn" onclick="deleteBoard('${dto.noticeNum}', '${page}');">삭제</button>
			       </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="listPage('${page}')">리스트</button>
			    </td>
			</tr>
			</table>
    </div>
    </div>
</div>
