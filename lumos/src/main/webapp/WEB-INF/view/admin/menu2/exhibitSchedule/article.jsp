<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/adminexhibit.css" type="text/css">
<script type="text/javascript">
function deleteExhibits(){
	var exhibitNum="${dto.exhibitNum}";
	var page="${page}";
	var query="exhibitNum="+exhibitNum+"&page="+page;
	var url="<%=cp%>/admin/menu2/exhibitSchedule/delete?"+query;
	
	if(confirm("이 전시를 삭제 하시겠습니까?"))
		location.href=url;
	if(success)
		alert("성공적으로 삭제되었습니다.");
}

function updateExhibits(){
	var exhibitNum="${dto.exhibitNum}";
	var page="${page}";
	var query = "exhibitNum="+exhibitNum+"&page="+page;
	var url="<%=cp%>/admin/menu2/exhibitSchedule/update?"+query; 
	
	location.href=url;
	if(success)
		alert("성공적으로 수정되었습니다.");
}
</script>
<%-- 
<div class="post" style="background:radial-gradient(circle,#d6a664, #f9cd8f); display:flex; justify-content:center; align-items:center;">
	<div class="post-left">
		<img src="<%=cp%>/uploads/admin/exhibitSchedule/${dto.exProfileImage}" style="max-width:40%; height:auto;resize:both;">
		<div class="post-left_title">${dto.exhibitName}</div>
		<div class="post0left_title_sub">${dto.hallName}</div>
		<div class="post-left_border"></div>
		<!-- <div class="post-left_author"><img><p></p></div> 쓸만한 데가 있을까...-->
	</div>
	<div class="post-right">
		<div class="post-right_body">
			<h3>전시번호 : ${dto.exhibitNum}</h3>
			<h3>진행시간: ${dto.admitStart} ~ ${dto.admitEnd} </h3>	
			<h3>주최 : ${dto.host}</h3>
			<h3>주관 : ${dto.supervise}</h3>
			<h3>가격 : ${dto.expriceString}</h3>
			<table style="width:60%; margin:0px auto 20px; border-spacing:0px;">
				<tr height="35">
					<td width="300" align="right">
						<button type="button" class="btn" onclick="updateExhibits();">수정</button>
						<button type="button" class="btn" onclick="deleteExhibits();">삭제</button>
					</td>
					<td align="left">
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/exhibitSchedule/exhibitlist?${query}';">리스트</button>
					</td>
				</tr>
			</table>
		</div>
		<div class="post-right_footer">
			<div class="post-right_footer_date">
				<p>${dto.exhibitStart} ~ ${dto.exhibitEnd} <span>장르 : ${dto.genre}</span></p>
			</div>
		</div>
	</div>
</div>
 --%>
<div class="body-right" style="margin-left:150px; margin-top:100px;">
<div class="exhibit_detail">
	<div class="wrap">
		<div class="pageTitleAndButton">
			<span>전시 상세 정보</span>
			<c:if test="${sessionScope.member.userId=='admin'}">
				 <button type="button" class="adBtn" onclick="javascript:location.href='<%=cp%>/admin/menu2/exhibitSchedule/created2';">
					전시 가격 관리
				</button> 
				<%-- <div style="align:right;" class="updateButtonDiv" onclick="javascript:location.href='<%=cp%>/admin/menu2/exhibitSchedule/created2';">
				<a>전시가격관리</a>
			</div> --%>
			</c:if>
			<%-- <c:if test="${sessionScope.member.userId!='admin'}">
				<button type="button" class="btnSendInterest">
					<img src="<%=cp %>/resource/images/lumos/pick_icon.png" style="margin-bottom: 3px;">
					<span style="display:inline-block; margin-top: 2px;"></span>
				</button>
				<button type="button" class="pickBtn" style="width: 110px; margin-right: 10px;" onclick="">
					<span style="display:inline-block; margin-top: 2px;">수정하기</span>
				</button>
			</c:if> --%>
		</div>
		<div class="poster left">
			<c:if test="${not empty dto.exProfileImage}">
				<img class="list_image_crop" src="<%=cp %>/uploads/image/${dto.exProfileImage}">
			</c:if>
			<c:if test="${empty dto.exProfileImage}">
				<img class="list_image_crop noposter" src="<%=cp%>/resource/images/lumos/noposter.png">
			</c:if>
			<div class="updateButtonDiv" onclick="updateExhibits();">
				<a>수정하기</a>
			</div>
		</div>
		<div class="content right">
			<h2>${dto.exhibitName}</h2>
			<table class="detail_inform">
				<tbody>
					<tr>
						<th>기간</th>
						<td>${dto.exhibitStart}~${dto.exhibitEnd}</td>						
					</tr>
					<tr>
						<th>시간</th>
						<td>${dto.admitStart}~${dto.admitEnd}</td>						
					</tr>
					<tr>
						<th>장소</th>
						<td>${dto.hallName}&nbsp;${dto.exHallLocate}</td>						
					</tr>
					<tr>
						<th>관람등급</th>
						<td>${dto.ratingName}</td>						
					</tr>
					<tr>
						<th>장르</th>
						<td>${dto.genre}</td>						
					</tr>
					<tr>
						<th>가격</th>
						<td>${dto.expriceString}</td>						
					</tr>
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
</div>
 