<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/adminexhibit.css" type="text/css">

<script type="text/javascript">
function deleteAcademies(){
	var academyNum="${dto.academyNum}";
	var page="${page}";
	var query="academyNum="+academyNum+"&page="+page;
	var url="<%=cp%>/admin/academySchedule/delete?"+query;
	
	if(confirm("이 강의를 삭제 하시겠습니까?"))
		location.href=url;
	if(success)
		alert("성공적으로 삭제되었습니다.");
}

function updateAcademies(){
	var academyNum="${dto.academyNum}";
	var page="${page}";
	var query = "academyNum="+academyNum+"&page="+page;
	var url="<%=cp%>/admin/academySchedule/update?"+query; 
	
	location.href=url;
	if(success)
		alert("성공적으로 수정되었습니다.");
}
</script>
<div class="exhibit_detail">
	<div class="wrap">
		<div class="pageTitleAndButton">
			<span>공연 상세 정보</span>
			<c:if test="${sessionScope.member.userId=='admin'}">
				<button type="button" class="adBtn" onclick="javascript:location.href='<%=cp%>/admin/menu2/concertSchedule/created2';">
					공연 회차 관리
				</button>
			</c:if>
			<%-- <c:if test="${sessionScope.member.userId!='admin'}">
				<button type="button" class="btnSendInterest">
					<img src="<%=cp %>/resource/images/lumos/pick_icon.png" style="margin-bottom: 3px;">
					<span style="display:inline-block; margin-top: 2px;"></span>
				</button>
			</c:if> --%>
		</div>
		<div class="poster left">
			<c:if test="${not empty dto.acProfileImage }">
				<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/${dto.acProfileImage}">
			</c:if>
			<c:if test="${empty dto.acProfileImage }">
				<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/noposter.png">
			</c:if>
			<div class="updateButtonDiv" onclick="updateAcademy();">
				<a>수정하기</a>
			</div>
		</div>
		<div class="content right">
			<h2>${dto.academyName}</h2>
			<table class="detail_inform">
				<tbody>
					<tr>
						<th>기간</th>
						<td>${dto.startDate}~${dto.endDate} | 매주 ${dto.lectureDay}</td>						
					</tr>
					<tr>
						<th>시간</th>
						<td>${dto.startTime}~${dto.endTime}</td>						
					</tr>
					<tr>
						<th>장소</th>
						<td>${dto.roomName}</td>						
					</tr>
					<tr>
						<th>모집정원</th>
						<td>${dto.totalCount}</td>						
					</tr>
					<tr>
						<th>강사</th>
						<td>${dto.instName}</td>						
					</tr>
					<tr>
						<th>가격</th>
						<td>${dto.price}원</td>						
					</tr>
					<%-- <tr>
						<th>주최</th>
						<td>${dto.host}</td>						
					</tr>
					<c:if test="${dto.host!='lac' && not empty dto.supervise}">
						<tr>
							<th>주관</th>
							<td>${dto.supervise}</td>						
						</tr>
					</c:if> --%>
				</tbody>
			</table>
		</div>
	</div>
</div>
