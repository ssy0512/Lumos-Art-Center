<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/eventLayout.css" type="text/css">
<script type="text/javascript">
function deleteBoard() {
	<c:if test="${sessionScope.member.userId=='admin'}">
		var eventNum = "${dto.eventNum}";
		var query = "eventNum="+eventNum;
		var url = "<%=cp%>/admin/community/event/delete?" + query;

		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
				location.href=url;
		}
	</c:if>    
	<c:if test="${sessionScope.member.userId!='admin'}">
		alert("게시물을 삭제할 수  없습니다.");
	</c:if>
	}

	function updateBoard() {
	<c:if test="${sessionScope.member.userId=='admin'}">
		var eventNum = "${dto.eventNum}";
		var query = "eventNum="+eventNum;
		var url = "<%=cp%>/admin/community/event/endUpdate?" + query;

		location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.userId!='admin'}">
		alert("게시물을 수정할 수  없습니다.");
	</c:if>
	}

//페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	var url="<%=cp%>/community/event/listReply";
	var query="eventNum=${dto.eventNum}&pageNo="+page;
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$("#listReply").html(data);
		}
	    ,beforeSend :function(jqXHR) {
	    	jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		location.href="<%=cp%>/member/login";
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

//리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		
		var eventNum="${dto.eventNum}";
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return;
		}
		content = encodeURIComponent(content);
		
		var query="eventNum="+eventNum+"&content="+content;
		var url="<%=cp%>/community/event/insertReply";
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				$tb.find("textarea").val("");
				
				var state=data.state;
				if(state=="true") {
					listPage(1);
				} else if(state=="false") {
					alert("댓글을 추가 하지 못했습니다.");
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
});

// 댓글 삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? "))
		    return;
		
		var commentNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="<%=cp%>/community/event/deleteReply";
		var query="commentNum="+commentNum;
		
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				// var state=data.state;
				listPage(page);
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
});

//게시글 보기
function articleBoard(num, page) {
	var url="<%=cp%>/community/event/endArticle";
	
	var query="eventNum="+num;
	
	var search=$('form[name=searchForm]').serialize();
	query=query+"&pageNo="+page+"&"+search;
	
	location.href=url+"?"+query;
}
</script>

<div class="event_info">
<div class="wrap" >
	<div class="pageTitleAndButton">
			<span style="line-height: 40px;">당첨자 발표 · 지난 이벤트</span>
			<c:if test="${sessionScope.member.userId=='admin'}">
				<button type="button" class="adBtn" onclick="deleteBoard();">
					삭제
				</button>
				<button type="button" class="adBtn" onclick="updateBoard();">
					수정
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
		<div class="work_intro" style="padding-bottom:80px;border-bottom:1px solid #ccc;">
			<div class="wrap">
				<h1 style="margin-top: 60px;"></h1>
				<c:if test="${empty dto.endContent }">
					${dto.content}
				</c:if>
				<c:if test="${not empty dto.endContent }">
					${dto.endContent}
				</c:if>
			</div>
			
		</div>
        <c:if test="${not empty preReadDto}">
			<p style="border-bottom: 1px solid #cccccc;padding:20px 0px;">
    			<span style="border-right: 1px solid #ccc;padding-right:20px;">이전글 </span>
            	<span style="padding-left:20px;"><a href="javascript:articleBoard('${preReadDto.eventNum}', '${pageNo}');">${preReadDto.title}</a>
    			</span>
			</p>
        </c:if>
        <c:if test="${not empty nextReadDto}">
			<p style="border-bottom: 1px solid #cccccc;padding:20px 0px;">
    			<span style="border-right: 1px solid #ccc;padding-right:20px;"> 다음글 </span>
			    <span style="padding-left:20px;"><a href="javascript:articleBoard('${nextReadDto.eventNum}', '${pageNo}');">${nextReadDto.title}</a>
			    </span>
			</p>
        </c:if>
		<button type="button" class="adBtn" style="margin: 20px 0px;" onclick="javascript:location.href='<%=cp%>/community/event/eventTab'">
			목록으로
		</button>
	</div>
</div>
</div>
