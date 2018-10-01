<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/eventLayout.css" type="text/css">
<div class="event-container" style="width:100%;">
	<div class="wrap">
		<div class="end-list">
			<table style="width: 100%; margin: 50px auto; float: left; border-spacing: 0px; border-collapse: collapse;">
				<c:if test="${sessionScope.member.userId=='admin'}">
				<tbody>
					<tr  style="color: #434343; height: 50px; border-top: 2px solid #aa1717; border-bottom: 2px solid #aa1717;">
						<th style="width:150px;">&nbsp;</th>
						<th style="width:150px;">발표 진행상황</th>
						<th>제&nbsp;&nbsp;목</th>
						<th style="width:150px;">이벤트 발표일</th>
					</tr>
					<c:forEach var="dto" items="${endList }">
						<tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #aa1717;width:120px;"> 
							<td style="width:150px;"><div class="selectOption" style="margin:0px; padding:10px;">
								<c:if test="${dto.selectOption == 'reply' }">
									<p  style="border-color: #fd8424;color: #fd8424;width:84px;">
										댓글 이벤트</p>
								</c:if>
								<c:if test="${dto.selectOption == 'review' }">
									<p  style="border-color: #006fd2;color: #006fd2;width:84px;">
										리뷰 이벤트</p>
								</c:if>
							</div></td>
							<td style="width:150px;">
								<c:if test="${empty dto.endContent}">
									<div class="selectOption" style="margin:0px; padding:10px;">
										<p  style="border-color: #e5002c;color: #e5002c;width:84px;">진행중</p>
									</div>
								</c:if>
								<c:if test="${not empty dto.endContent}">
									<div class="selectOption" style="margin:0px; padding:10px;">
										<p  style="border-color: #pms376;color: #pms376;width:84px;">완료</p> 
									</div>
								</c:if>
							</td>
							<td ><a href="<%=cp %>/community/event/endArticle?eventNum=${dto.eventNum}">${dto.title}</a></td>
							<td style="width:150px;">${dto.eventWin}</td>
						</tr>
					</c:forEach>
					<c:if test="${empty endList}">
					<tr align="center"><td colspan='3' height="100px">완료된 이벤트가 없습니다.</td></tr>
				</c:if>
				</tbody>
				<c:if test="${not empty endList}">
				<tfoot id='listReplyFooter'>
					<tr height='40' align="center" >
			            <td colspan='4' style="padding-bottom: 20px;" >
			              ${paging}
			            </td>
			           </tr>
				</tfoot>
			</c:if>
			</c:if>
			<c:if test="${sessionScope.member.userId!='admin'}">
				<tbody>
				<tr  style="color: #434343; height: 50px; border-top: 2px solid #aa1717; border-bottom: 2px solid #aa1717;">
						<th style="width:150px;">&nbsp;</th>
						<th>제&nbsp;&nbsp;목</th>
						<th style="width:150px;">이벤트 발표일</th>
				</tr>
				<c:forEach var="vo" items="${endUserList }">
					<c:if test="${not empty vo.endContent }">
						<tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #aa1717;width:120px;"> 
							<td ><div class="selectOption" style="margin:0px; padding:10px;">
								<c:if test="${vo.selectOption == 'reply' }">
									<p  style="border-color: #fd8424;color: #fd8424;width:84px;">
										댓글 이벤트</p>
								</c:if>
								<c:if test="${vo.selectOption == 'review' }">
									<p  style="border-color: #006fd2;color: #006fd2;width:84px;">
										리뷰 이벤트</p>
								</c:if>
							</div></td>
							<td ><a href="<%=cp %>/community/event/endArticle?eventNum=${vo.eventNum}">${vo.title}</a></td>
							<td style="width:150px;">${vo.eventWin}</td>
						</tr>
					</c:if>
				</c:forEach>
				<c:if test="${empty endUserList}">
					<tr align="center"><td colspan='3' height="100px">완료된 이벤트가 없습니다.</td></tr>
				</c:if>
				</tbody>
				<c:if test="${not empty endUserList}">
				<tfoot id='listReplyFooter'>
					<tr height='40' align="center" >
			            <td colspan='3' style="padding-bottom: 20px;" >
			              ${paging}
			            </td>
			           </tr>
				</tfoot>
				</c:if>
			</c:if>
			</table>
		</div>
	</div>
</div>
