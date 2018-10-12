<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitReviewForm.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/reviewStar.css" type="text/css">
<script type="text/javascript">
$(function() {
	var mode="${mode}";
	if(mode=="update"){
		setScore();
	}
});

function setScore() {
	  var f = document.reviewForm;
	  var score = f.score.value;
	  $("#p"+score).prop("checked","true");
	  $(".star-input").find("output>b").text($("#p"+score).val());
}

 function sendOk() {
     var f = document.reviewForm;

     
     var s = $("output b").html();
     f.score.value=s;
     str = f.score.value;
     if(str=="0") {
         alert("점수를 선택하세요. ");
         f.score.focus();
         return;
     }
     
 	var str = f.subject.value;
     if(!str) {
         alert("제목을 입력하세요. ");
         f.subject.focus();
         return;
     }

 	str = f.content.value;
     if(!str) {
         alert("감상평을 입력하세요. ");
         f.content.focus();
         return;
     }

     
     var mode="${mode}";
     
   	 f.action="<%=cp%>/concertReview/${mode}";

     f.submit();
 }
</script>
<div>
	<div class="wrap">
		<div class="titleDiv">
			<h1 class="title" style="margin-top: 60px;">
				<img src="<%=cp %>/resource/images/lumos/reviews_gray.png">
			관람평쓰기
			</h1>
		</div>
		<div class="bodyDiv" style="padding: 0 100px;">
			<form name="reviewForm" method="post" >
				<table style="width: 100%;">
					<thead class="border_b">
						<tr>
							<th style="width: 15%;">작성자</th>
							<td style="padding: 10px 0; width: 85%;">
								${sessionScope.member.userName}
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>작품명</th>
							<td colspan="2" style="padding: 10px 0; font-size: 18px;">
								${dto.concertName}
							</td>
						</tr>
						<tr>
							<th>종합평점<span class="f_red">*</span></th>
							<td colspan="2" style="padding: 10px 0; font-size: 18px;">
								<div class="starBox">
									<%-- 별점 --%>
									<span class="star-input">
									  <span class="input" style="vertical-align: middle;">
									    <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
									    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
									    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
									    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
									    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
									    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
									    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
									    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
									    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
									    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
									  </span>
									  <output for="star-input" style="vertical-align: middle;"><b style="font-size: 14px; line-height: 24px;">0</b></output>
										<input type="hidden" name="score" value="${rdto.score}">
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>제목<span class="f_red">*</span></th>
							<td colspan="2">
								<input type="text" id="subject" name="subject" placeholder="제목*" value="${rdto.subject}" style="height: 35px; width: 100%;">
							</td>
						</tr>
						<tr>
							<th>관람평<span class="f_red">*</span></th>
							<td colspan="2">
								<textarea name="content" style="height: 215px; width: 100%; padding: 10px 10px;" placeholder="관람평*">${rdto.content}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: center; height: 80px;">
								<button type="button" class="eBtn" onclick="sendOk();" style="margin-right: 5px;'">${mode=='update'?'수정완료':'등록하기'}</button>
								<button type="reset" class="eBtn" style="margin-right: 5px;'">다시입력</button>
								<button type="button" class="eBtn" onclick="javascript:location.href='<%=cp%>/exhibit/article?num=${dto.concertNum}';">${mode=='update'?'수정취소':'등록취소'}</button>
								
								 <c:if test="${mode=='update'}">
								         <input type="hidden" name="num" value="${rdto.creviewNum}">
								</c:if>
								<c:if test="${mode=='created'}">
								         <input type="hidden" name="num" value="${dto.concertNum}">
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	// star rating
	var starRating = function(){
	  var $star = $(".star-input"),
	      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".star-input>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".star-input>.input", function(){
	    var $this = $(this);
	    setTimeout(function(){
	      if($this.find(":focus").length === 0){
	        $this.removeClass("focus");
	      }
	    }, 100);
	  })
	    .on("change", ".star-input :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".star-input label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".star-input>.input", function(){
	    var $checked = $star.find(":checked");
	    if($checked.length === 0){
	      $result.text("0");
	    } else {
	      $result.text($checked.next().text());
	    }
	  });
	};
	starRating();
</script>