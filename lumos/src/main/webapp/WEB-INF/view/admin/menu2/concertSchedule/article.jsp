<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<!--  

아티클 수정필수 
버튼은 총 네개가 있어야 함. 
1. 공연에 대한 수정 2. 회차에 대한 수정 3. 가격에 대한 정보입력 (수정은 드랍) 4. 공연에 대한 삭제. 


 -->
<link rel="stylesheet" href="<%=cp%>/resource/css/adminexhibit.css" type="text/css">

<script type="text/javascript">
function deleteConcerts(){
	var num="${dto.concertNum}";
	var page="${page}";
	var query="num="+num+"&page="+page;
	var url="<%=cp%>/admin/concertSchedule/delete?"+query;
	
	if(confirm("이 공연을 삭제 하시겠습니까?"))
		location.href=url;
	if(success)
		alert("성공적으로 삭제되었습니다.");
}

function updateConcerts(){
	var num="${dto.concertNum}";
	var page="${page}";
	var query = "num="+num+"&page="+page;
	var url="<%=cp%>/admin/menu2/concertSchedule/update?"+query; 
	
	location.href=url;
	if(success)
		alert("성공적으로 수정되었습니다.");
}


function updateSession(){
	var num="${dto.concertNum}";
	var page="${page}";
	var query = "num="+num+"&page="+page;
	var url="<%=cp%>/admin/menu2/concertSchedule/update?"+query; 
	
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
			<c:if test="${not empty dto.conProfileImage }">
				<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/${dto.conProfileImage}">
			</c:if>
			<c:if test="${empty dto.conProfileImage }">
				<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/noposter.png">
			</c:if>
			<div class="updateButtonDiv" onclick="updateConcerts();">
				<a>수정하기</a>
			</div>
		</div>
		<div class="content right">
			<h2>${dto.concertName}</h2>
			<table class="detail_inform">
				<tbody>
					<tr>
						<th>기간</th>
						<td>${dto.concertStart}~${dto.concertEnd}</td>						
					</tr>
					<tr>
						<th>장소</th>
						<td>${dto.hallName}</td>						
					</tr>
					<tr>
						<th>관람등급</th>
						<td>${dto.ratingName}</td>						
					</tr>
					<tr>
						<th>관람시간</th>
						<td>${dto.totalTime}분</td>						
					</tr>
					<tr>
						<th>장르</th>
						<td>${dto.genre}</td>						
					</tr>
					<c:if test="${not empty dto.seatPriceList }">
					<tr>
						<th>가격</th>
						<td>${dto.seatPriceList}</td>						
					</tr>
					</c:if>
					<tr>
						<th>주최</th>
						<td>${dto.host}</td>						
					</tr>
					<c:if test="${dto.host!='lac' && not empty dto.supervise}">
						<tr>
							<th>주관</th>
							<td>${dto.supervise}</td>						
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
