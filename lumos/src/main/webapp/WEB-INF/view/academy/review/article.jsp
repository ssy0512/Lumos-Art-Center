<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/academystyle.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/academylayout.css" type="text/css">

<script type="text/javascript">

function updateReview() {
	var num = "${dto.classReviewNum}";
	var page = "${page}";
	var query = "classReviewNum="+num+"&page="+page;
	var url = "<%=cp%>/academy/review/update?"+query;

	location.href=url;

}

function deleteReview() {
	var num = "${dto.classReviewNum}";
	var page = "${page}";
	var query = "classReviewNum="+num+"&page="+page;
	var url = "<%=cp%>/academy/review/delete?" + query;

	if(confirm("게시물을 삭제 하시겠습니까?")) {
			location.href=url;
	}
}

$(function(){
	$(".btnSendReviewLike").click(function(){
		var url="<%=cp%>/academy/review/insertReviewLike";
		var num="${dto.classReviewNum}";
		
		// alert(num);
		$.ajax({
			type:"post"
			,url:url
			,data:{classReviewNum:num}
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="true") {
					var count = data.reviewLikeCount;
					$("#reviewLikeCount").text(count);
				} else if(state=="false") {
					alert("좋아요는 한 번만 가능합니다.");
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


</script>



<div class="body-content-container">
    <div class="body-academy-title">
         <span class="academy-title">아카데미 수강후기 작성</span>
    </div>
    
    <div>
			<form name="boardForm" method="post" enctype="multipart/form-data">
			  <table style="width: 900px; margin: 40px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			   <tr align="left" height="55">
			      <td colspan="3" style="padding-left:10px;"> 
					${dto.academyName}
			      </td>
			  </tr>
			  <tr align="left" height="55" style="border-bottom: 2px solid #aa1717"> 
			      <td colspan="2" style="padding-left:10px; font-size: 20px; font-weight: 600;"> 
			        ${dto.subject}
			      </td>
			      <td align="right" style="padding-right:10px; font-size: 20px; font-weight: 600;"> 
			       <c:if test="${sessionScope.member.userId==dto.userId}"> 
			        <button type="button" class="list-ing" style="width: 71px; cursor: pointer;" onclick="updateReview();">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}"> 
			        <button type="button" class="list-ing" style="width: 71px; cursor: pointer;" onclick="deleteReview();">삭제</button>
			       </c:if>
			      </td>
			  </tr>
			
			  <tr align="left" height="55" style="border-top: 2px solid #aa1717; border-bottom: 2px solid #aa1717;"> 
			      <td width="200" style="text-align: left;">
			      	<span style="font-weight: 600; text-align: left; padding: 10px;">작성자</span>
			      	<span style="padding: 10px;">${dto.userName}</span>
			      </td>
			      <td width="200" style="text-align: left;">
			      	<span style="font-weight: 600; text-align: left; padding: 10px;">작성일</span>
			      	<span style="padding: 10px;">${dto.created}</span>
			      </td>
			      <td width="200" style="text-align: left;">
			      	<span style="font-weight: 600; text-align: left; padding: 10px;">조회수</span>
			      	<span style="padding: 10px;">${dto.hitCount}</span>
			      </td>
			  </tr>
			
			  <tr align="left" style=""> 
			      <td colspan="3" valign="top" style="padding: 40px;"> 
			        ${dto.content}
			        
			      </td>
			  </tr>
			  <tr align="center" style="border-bottom: 2px solid #aa1717"> 
			      <td colspan="3" valign="top" style="padding: 40px;"> 
			        <button type="button" style="width: 70px; background-color: #ffffff;" class="list-ing btnSendReviewLike">
			        <span style="color: #aa1717;">♥</span>&nbsp;&nbsp;<span id="reviewLikeCount" style="color: #aa1717;">${dto.reviewLikeCount}</span></button>
			      </td>
			  </tr>
			  </table>
			
			  <div style="width: 1020px; text-align: center; padding: 30px;"><button type="button" class="list-ing" style="width: 71px; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/academy/review/list';">목록</button></div>
			
			  <table style="width: 900px; border-top: 2px solid #aa1717; margin: 0px auto; border-spacing: 0px;">
			     <tr height="70"> 
			      <td align="left" style="padding: 30px;">
			        <span>&lt; 이전글</span>
			      	<c:if test="${not empty preReviewDto}">
			              <span style="font-weight: 600; padding-left: 40px;">
			              	<a href="<%=cp%>/academy/review/article?${query}&classReviewNum=${preReviewDto.classReviewNum}">${preReviewDto.subject}</a>
			              </span>
			      	</c:if>
			      	<c:if test="${empty preReviewDto}">
			        	<span style="font-weight: 600; padding-left: 40px;">이전글이 없습니다.</span>
			        </c:if>
			      </td>
			      <td align="right" style="padding: 30px;">
			        <c:if test="${empty nextReviewDto}">
			        	<span style="font-weight: 600; padding-right: 40px;">다음글이 없습니다.</span>
			        </c:if>
			      	<c:if test="${not empty nextReviewDto}">
			      		<span style="font-weight: 600; padding-right: 40px;">
			              <a href="<%=cp%>/academy/review/article?${query}&classReviewNum=${nextReviewDto.classReviewNum}">${nextReviewDto.subject}</a>
			      		</span>
			      	</c:if>
			      	<span>다음글 &gt;</span>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
    
</div>    