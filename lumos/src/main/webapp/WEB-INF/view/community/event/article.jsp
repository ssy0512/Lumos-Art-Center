<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/eventLayout.css" type="text/css">
<script type="text/javascript">
function login() {
	location.href="<%=cp%>/member/login";
}

<%-- $(function(){
	isConcertInterest(${dto.concertNum});
	
	$(".btnSendInterest").click(function(){
		var url="<%=cp%>/concert/insertConcertInterest";
		var num="${dto.concertNum}";
		
		$.ajax({
			type:"post"
			,url:url
			,data:{num:num}
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="true") {
					isConcertInterest(num);
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
	
	
	function isConcertInterest(num) {
		var url="<%=cp%>/concert/isConcertInterest";
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
	 --%>
});

</script>

<div class="event_info">
<div class="wrap" >
	<div class="pageTitleAndButton">
			<span>진행 중인 이벤트</span>
			<c:if test="${sessionScope.member.userId=='admin'}">
				<button type="button" class="adBtn" onclick="javascript:location.href='<%=cp%>/admin/community/event/update?eventNum=${dto.eventNum}'">
					수정
				</button>
				<button type="button" class="adBtn" onclick="javascript:location.href='<%=cp%>/admin/community/event/delete?eventNum=${dto.eventNum}'">
					삭제
				</button>
			</c:if>
	</div>
	<div style="text-align:center;width:1020px; font-size:36px;margin-top:20px;">
		${dto.title }
	</div>
	<div class="selectOption" style="margin-top:50px;">
	<c:if test="${dto.selectOption == 'reply' }">
		<p  style="border-color: #fd8424;color: #fd8424;">
			댓글 이벤트</p>
	</c:if>
	<c:if test="${dto.selectOption == 'review' }">
		<p  style="border-color: #006fd2;color: #006fd2;">
			리뷰 이벤트</p>
	</c:if>
	</div>
	<div class="event_content" style="border-top: 1px solid #ccc;">
		<div style="text-align:right;">
			<p>${dto.eventStart }~${dto.eventEnd }</p>
		</div>
	
		<%-- content --%>
		<div class="work_intro" style="padding-bottom:80px;">
			<div class="wrap">
				<h1 style="margin-top: 60px;"></h1>
				${dto.content}
			</div>
		</div>
	</div>
</div>
</div>


