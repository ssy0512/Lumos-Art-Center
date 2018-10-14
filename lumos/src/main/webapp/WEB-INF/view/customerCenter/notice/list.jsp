<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="alert-info">
    <span style="font-family: Webdings; font-weight: 600;">m</span>
      공지사항입니다.
</div>

<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
   <tr height="35">
      <td align="right" width="100%">
          ${dataCount}개[${page}/${total_page} 페이지]
      </td>
      <td align="left">
          &nbsp;
      </td>
   </tr>
</table>

<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
  <tr><td height="1" colspan="5" bgcolor="#cccccc"></td></tr>
  <tr align="center" bgcolor="#fff" height="35" style="border-top: 1px solid #aa1717; border-bottom: 1px solid #aa1717;"> 
      <th width="60" style="color: #aa1717;">글번호</th>
		      <th style="color: #aa1717;">제목</th>
		      <th width="80" style="color: #aa1717;">아이디</th>
		      <th width="120" style="color: #aa1717;">등록일</th>
		      <th width="60" style="color: #aa1717;">조회수</th>
  </tr>
 
<c:forEach var="dto" items="${list}">
  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
  <td><span style="display: inline-block;width: 28px;height:18px;line-height:18px; background: #ED4C00;color: #FFFFFF">공지</span></td>
		      <td align="left" style="padding-left: 10px;">
		           <a href="javascript:articleBoard('${dto.noticeNum}', '${page}');">${dto.title}</a>
		      </td>
		      <td>${dto.userName }</td>
		      <td>${dto.created}</td>
		      <td>${dto.hitcount}</td>
  </tr>
  </c:forEach>

</table>
 
<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
   <tr height="35">
	<td align="center">
       <c:if test="${dataCount==0 }">
           등록된 게시물이 없습니다.
           
       </c:if>
       <c:if test="${dataCount!=0 }">
           ${paging}
       </c:if>
	</td>
   </tr>
</table>

<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
   <tr height="40">
      <td align="left" width="100">
          <button type="button" class="btn" onclick="reloadBoard();">새로고침</button>
      </td>
     
      <td align="right" width="100">
      <c:if test="${sessionScope.member.userId=='admin'}">
          <button type="button" class="btn" onclick="insertForm();">글올리기</button>
          </c:if>
      </td>
   </tr>
</table>
