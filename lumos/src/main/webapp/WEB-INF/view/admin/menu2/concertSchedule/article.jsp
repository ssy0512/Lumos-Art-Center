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















<link href="https://fonts/googleapis/com/css?family=Noto+Serif+KR" rel="stylesheet">

<style>
.post{
	display:flex;
	width:1000px;
}
.post-left{
	width:40%;
	/* background-color:#484855;
	color:white; */
	padding:30px;
	position:relative;
}

.post-left_title{
	font-size:20px;
	text-transform:uppercase;
	font-weight:300;
	margin-top:0.25;
}
.post-left_border{
	border:2px solid #ef5350;
	width:15%;
	margin-top:1;
}
.post-left_author{
	position:absolute;
	bottom:2px;
	display:flex;
	align-items: center;
}

</style>
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
	var url="<%=cp%>/admin/concertSchedule/update?"+query; 
	
	location.href=url;
	if(success)
		alert("성공적으로 수정되었습니다.");
}


function updateSession(){
	var num="${dto.concertNum}";
	var page="${page}";
	var query = "num="+num+"&page="+page;
	var url="<%=cp%>/admin/concertSchedule/update?"+query; 
	
	location.href=url;
	if(success)
		alert("성공적으로 수정되었습니다.");
}
</script>

<div class="post" style="background:radial-gradient(circle,#d6a664, #f9cd8f); display:flex; justify-content:center; align-items:center;">
	<div class="post-left">
		<img src="<%=cp%>/uploads/admin/concertSchedule/${dto.conProfileImage}" style="max-width:40%; height:auto;resize:both;">
		<div class="post-left_title">${dto.concertName}</div>
		<div class="post0left_title_sub">${dto.hallName}</div>
		<div class="post-left_border"></div>
		<!-- <div class="post-left_author"><img><p></p></div> 쓸만한 데가 있을까...-->
	</div>
	<div class="post-right">
		<div class="post-right_body">
			<h3>공연장 : ${dto.hallName}</h3>
			<h3>진행시간: ${dto.startTime} ~ ${dto.endTime} 매주 ${dto.lectureDay}</h3>	
			<h3>가격 : ${dto.price} 원</h3>
			<table style="width:60%; margin:0px auto 20px; border-spacing:0px;">
				<tr height="35">
					<td width="300" align="right">
						<button type="button" class="btn" onclick="updateConcerts();">수정</button>
						<button type="button" class="btn" onclick="deleteConcerts();">삭제</button>
						<button type="button" class="btn" onclick="updateSession();">삭제</button>
					
					</td>
					<td align="left">
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/exhibitSchedule/exhibitlist?${query}';">리스트</button>
					</td>
				</tr>
			</table>
		</div>
		<div class="post-right_footer">
			<div class="post-right_footer_date">
				<p>${dto.startDate} ~ ${dto.endDate} <span>총 ${dto.totalCount} 회</span></p>
			</div>
		</div>
	</div>
</div>



