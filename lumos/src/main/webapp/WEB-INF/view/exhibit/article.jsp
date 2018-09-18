<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitArticle.css" type="text/css">
<script type="text/javascript">
function login() {
	location.href="<%=cp%>/member/login";
}

$(function(){
	isExhibitInterest(${dto.exhibitNum});
	
	$(".btnSendInterest").click(function(){
		var url="<%=cp%>/exhibit/insertExhibitInterest";
		var num="${dto.exhibitNum}";
		
		$.ajax({
			type:"post"
			,url:url
			,data:{num:num}
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="true") {
					isExhibitInterest(num);
				}
			}
			,beforeSend : function(jqXHR) {
		        jqXHR.setRequestHeader("AJAX", true);
		    }
		    ,error:function(jqXHR) {
		    	if(jqXHR.status==403) {
		    		login();
		    		return;
		    	}
		    	console.log(jqXHR.responseText);
		    }
		});
		
	});
	
	
	function isExhibitInterest(num) {
		var url="<%=cp%>/exhibit/isExhibitInterest";
		$.ajax({
			type:"post"
			,url:url
			,data:{num:num}
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="true") {
					$(".btnSendInterest").removeClass("pickBtn");
					$(".btnSendInterest").addClass("pickedBtn");
					$(".btnSendInterest").find("span").html("나의 관심 작품");
				} else {
					$(".btnSendInterest").removeClass("pickedBtn");
					$(".btnSendInterest").addClass("pickBtn");
					$(".btnSendInterest").find("span").html("관심 작품 등록하기");
				}
			}
			,beforeSend : function(jqXHR) {
		        jqXHR.setRequestHeader("AJAX", true);
		    }
		    ,error:function(jqXHR) {
		    	if(jqXHR.status==403) {
		    		login();
		    		return;
		    	}
		    	console.log(jqXHR.responseText);
		    }
		});
	}
});

</script>

<%-- 포스터 + 상세정보 --%>
<div class="exhibit_detail">
	<div class="wrap">
		<div class="pageTitleAndButton">
			<span>전시 상세 정보</span>
			<c:if test="${sessionScope.member.userId=='admin'}">
				<button type="button" class="adBtn" onclick="javascript:location.href='<%=cp%>/exhibit/update?num=${dto.exhibitNum}'">
					전시 상세정보 관리
				</button>
			</c:if>
			<c:if test="${sessionScope.member.userId!='admin'}">
				<button type="button" class="btnSendInterest">
					<img src="<%=cp %>/resource/images/lumos/pick_icon.png" style="margin-bottom: 3px;">
					<span style="display:inline-block; margin-top: 2px;"></span>
				</button>
			</c:if>
		</div>
		<div class="poster left">
			<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/${dto.exProfileImage}">
			<div class="reserveButtonDiv">
				<a>예매하기</a>
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
						<td></td>						
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

<%-- 할인정보 --%>
<div class="discount">
	<div class="wrap">
		<jsp:include page="/WEB-INF/view/layout/discount.jsp"></jsp:include>
	</div>
</div>

<%-- content --%>
<div class="work_intro">
	<div class="wrap">
		<h1 style="margin-top: 60px;"></h1>
		${dto.content}
	</div>
</div>