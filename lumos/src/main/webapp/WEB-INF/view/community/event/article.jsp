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
		var url = "<%=cp%>/admin/community/event/update?" + query;

		location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.userId=='admin'}">
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
		
		var query="eventNum="+eventNum+"&content="+content+"&answer=0";
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
		
		var replyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="<%=cp%>/community/event/deleteReply";
		var query="replyNum="+replyNum+"&mode=reply";
		
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
</script>

<div class="event_info">
<div class="wrap" >
	<div class="pageTitleAndButton">
			<span style="line-height: 40px;">진행 중인 이벤트</span>
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
		<div class="work_intro" style="padding-bottom:80px;">
			<div class="wrap">
				<h1 style="margin-top: 60px;"></h1>
				${dto.content}
			</div>
		<button type="button" class="adBtn" style="margin-top: 60px;" onclick="javascript:location.href='<%=cp%>/community/event/eventTab'">
			목록으로
		</button>
		</div>
	</div>
</div>
</div>

<c:if test="${dto.selectOption == 'reply' }">
	<div style="background-color: #fbfbfb;  border-top: 1px solid #e8e8e8;">
		<div class="wrap">
		<table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
			<tr height='30'> 
				 <td align='left' >
				 	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				 </td>
			</tr>
			<tr>
			   	<td style='padding-bottom: 5px;'>
					<textarea class='boxTA' style='width:100%; height: 70px;'></textarea>
			    </td>
			</tr>
			<tr>
			   <td align='right'>
			        <button type='button' class='adBtn btnSendReply' data-num='10' style="width:100px;height:40px;">댓글 등록</button>
			    </td>
			 </tr> 
		</table>
		     
		<div id="listReply"></div>
		</div>
	</div>
</c:if>
