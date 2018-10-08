<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
var pageNo=1;
var totalPage=1;

function login() {
	location.href="<%=cp%>/member/login";
}

$(function () {
	$("#btn-latest").addClass("clickOn");
	eReviewListPage(1);


	// 클릭으로 탭 전환
	$("ul.orderUl li").click(function() {
		order = $(this).attr("data-order");
		
		$("ul.orderUl li").each(function () {
			$(this).removeClass("clickOn");
		});
		
		$("#btn-"+order).addClass("clickOn");
		
		$("#eReviewListBody").empty();
		pageNo=1;
		eReviewListPage(1);
	});
});

function eReviewListPage(page) {
	var url="<%=cp%>/community/exhibitReview/list";
	order = $("li.clickOn").attr("data-order");

	var query="pageNo="+page+"&order="+order;
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			printEReview(data);
			$(".rcount").find("span").eq(0).html(data.dataCount.toLocaleString('en'));
		}
	    ,beforeSend:function(jqXHR) {
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

function printEReview(data) {
	var uid="${sessionScope.member.userId}";
	var dataCount = data.dataCount;
	var page = data.pageNo;
	totalPage = data.total_page;
	
	var out="";
	if(dataCount!=0) {
		for(var idx=0; idx<data.eReviewList.length; idx++) {
			var exReviewNum=data.eReviewList[idx].exReviewNum;
			var exhibitNum=data.eReviewList[idx].exhibitNum;
			var score=data.eReviewList[idx].score;
			var exhibitName=data.eReviewList[idx].exhibitName;
			var exhibitStart=data.eReviewList[idx].exhibitStart;
			var exhibitEnd=data.eReviewList[idx].exhibitEnd;
			var content=data.eReviewList[idx].content;
			var created=data.eReviewList[idx].created;
			var hallName=data.eReviewList[idx].hallName;
			var exProfileImage=data.eReviewList[idx].exProfileImage;
			var userId=data.eReviewList[idx].userId;
			var userName=data.eReviewList[idx].userName;
			
			out+="<div class='erv_item' id='review-"+exReviewNum+"'>";
			out+="	<div class='erv_content'>";
			out+="		<a style='text-decoration: none;' href='<%=cp %>/exhibit/article?num="+exhibitNum+"'>";
			
			if(exProfileImage==null || exProfileImage==''){
				out+="			<img src='<%=cp %>/resource/images/lumos/noposter.png'>";
			} else {
				out+="			<img src='<%=cp %>/uploads/image/"+exProfileImage+"'>";
			}
			
			out+="		</a>";
			out+="		<div class='conDiv'>";
			out+="			<div class='topD'>";
			out+="				<h3>";
			out+="					<a>"+exhibitName+"</a>";
			out+="				<div style='float: right;'>";
			out+="					<button id='btnReviewLike-"+exReviewNum+"' class='btnlike' onclick='erLike("+exReviewNum+");'>추천 <span></span></button></div>";
			out+="				</h3>";
			out+="				<p style='color: #777;''>";
			out+="				작성자 | "+userName;
			out+="				<p style='color: #777;''>";
			out+="					"+hallName+" | "+exhibitStart+" ~ "+exhibitEnd;
			out+="					<span>작성일 : "+created+"</span></p>";
			out+="				<div class='starDiv' data-score='"+score+"'>";
			out+="				</div>";
			out+="			</div>";
			out+="			<div class='botD'>";
			out+="				<p data-rvNum="+exReviewNum+">"+content+"</p>";
			out+="				<div class='clearfix' style='margin-bottom: 10px;'></div>";
			
			out+="				<div style='float: right;'>";
			if(userId==uid){
				out+="					<button class='btnEdit' onclick='erUpdate("+exhibitNum+");'>수정</button>";
			}
			if(userId==uid || uid=="admin"){
				out+="					<button class='btnDel' onclick='deleteEReview("+exReviewNum+")'>삭제</button>";
			}
			out+="				</div>";
			out+="			</div>";
			out+="			<div class='clearfix' style='margin-bottom: 15px;'></div>";
			out+="		</div>";
			out+="	</div>";
			out+="</div>";
			out+="<div class='clearfix' style='margin-top : 10px; border-bottom: 1px solid #eee;'></div>";
		}
		
		$("#eReviewListBody").append(out);
		cReviewStar();
		miribogi();
		
		if(pageNo>=totalPage) {
			$("#eReviewListFooter").hide();
		} else {
			$("#eReviewListFooter").show();
		}
		
	} else {
		out+="<p class='emptyMsg'>“ 등록된 전시 후기가 없습니다. ”</p>";
		$("#eReviewListBody").append(out);
		$("#eReviewListFooter").hide();
	}
}


function moreERv() {
	if(pageNo<totalPage) {
		++pageNo;
		eReviewListPage(pageNo);
	} else {
		$("#eReviewListFooter").hide();
	}
}

function cReviewStar() {
	$(".starDiv").each(function () {
		var score=$(this).attr("data-score");
		var html="";
		if(score%2==0){
			for(var i=1;i<=score/2;i++){
				html+="<img src='<%=cp %>/resource/images/lumos/star-on.png'>";
			}
			for(var i=1;i<=5-(score/2);i++){
				html+="<img src='<%=cp %>/resource/images/lumos/star-off.png'>";
			}
			$(this).html(html);
		}else{
			for(var i=1;i<=score/2;i++){
				html+="<img src='<%=cp %>/resource/images/lumos/star-on.png'>";
			}
			html+="<img src='<%=cp %>/resource/images/lumos/star-half.png'>";
			for(var i=1;i<=4.5-(score/2);i++){
				html+="<img src='<%=cp %>/resource/images/lumos/star-off.png'>";
			}
			$(this).html(html);
		}
	});
}

function miribogi() {
	$("div.botD").each(function () {
		erLikeCount($(this).find("p").attr("data-rvNum"));
		$(this).addClass("smallDiv");
	});
}

$("body").on("click", "div.botD.smallDiv p", function() {
	$(this).parent().removeClass("smallDiv");
	$(this).parent().addClass("fullDiv");
	erLikeCount($(this).attr("data-rvNum"));
});

$("body").on("click", "div.botD.fullDiv p", function() {
	$(this).parent().removeClass("fullDiv");
	$(this).parent().addClass("smallDiv");
});


function erUpdate(num){
	var url="<%=cp%>/exhibitReview/created?num="+num;
	location.href=url;
}

function deleteEReview(rnum) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		alert("로그인이 필요 합니다.");
		return;
	}
	
	if(confirm("작성하신 리뷰를 삭제하시겠습니까 ? ")) {	
		var url="<%=cp%>/exhibitReview/delete";
		var query="num="+rnum;
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				// var state=data.state;
				$("#eReviewListBody").empty();
				pageNo=1;
				eReviewListPage(1);
			}
		    ,beforeSend:function(jqXHR) {
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
}

$(function () {
	$("p.rvCont").click(function () {
		var rnum = $(this).parents("li").attr("data-rnum");
		clickBest(rnum);
	});
});

function clickBest(num) {
	var url="<%=cp%>/community/exhibitReview/clickBest";
	order = $("li.clickOn").attr("data-order");
	
	var query="num="+num+"&order="+order;
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			$("#location").val(data.location);
			$("#listNum").val(data.listNum);
			scrollMove(num, data.location, data.listNum);
		}
	    ,beforeSend:function(jqXHR) {
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

function scrollMove(num, location, listNum) {
	if(location==1 || location<=pageNo){
		var offset = $("#review-"+num).offset();
		$('html, body').animate({scrollTop : offset.top}, 400);
	} else{
		for(var i=1;i<location;i++){
			moreERv();
		}
		
		var offset1 = $("div.erv_item").eq(0).offset();
		var offset2 =$("div.erv_item").eq(1).offset();
		var divh=offset2.top-offset1.top;
		var height = offset1.top+(listNum-1)*divh;
		
		$('html, body').animate({scrollTop : height}, 400);
	}
}

function erLike(num) {
	var url="<%=cp%>/community/exhibitReview/like";
	
	$.ajax({
		type:"post"
		,url:url
		,data:{num:num}
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			if(state=="true") {
				var count = data.reviewLikeCount;
				$("#btnReviewLike-"+num).find("span").html(count);
			} else if(state=="false") {
				alert("좋아요는 한번만 가능합니다. !!!");
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

function erLikeCount(num) {
	var url="<%=cp%>/community/exhibitReview/likeCount";
	$.ajax({
		type:"post"
		,url:url
		,data:{num:num}
		,dataType:"json"
		,success:function(data) {
			var likeCount=data.likeCount;
			$("#btnReviewLike-"+num).find("span").html(likeCount);
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
//--------------------------------------------------------------

</script>


<link rel="stylesheet" href="<%=cp%>/resource/css/commReview.css" type="text/css">

<div class="headImg" style="background: url(<%=cp%>/resource/images/lumos/zine_full_main_2.jpg) no-repeat center;">
	<h1 class="headtitle">전시 후기</h1>
	<a class="rcount">
		<span style="margin-top: 5px; display: inline-block;"></span><br>
		<span>Reviews</span>
	</a>
	<div class="titlefooter">
		<div class="blackDiv" style="background: url(<%=cp%>/resource/images/lumos/opacity45.png) repeat;">
			<div class="wrap">
				<img src="<%=cp%>/resource/images/lumos/reviews.png" class="hLeft">
				<div class="ment">
					<p>※ 관람평은 각 공연·전시의 상세정보페이지에 가시면 작성하실 수
							있습니다.</p>
					<p>※ 저속한 표현, 타인의 명예훼손, 광고성 게시물 등은 통보 없이
							삭제할 수 있음을 양지하여 주십시오.</p>
				</div>
			</div>
			<div style="clear: both; display: block;"></div>
		</div>
	</div>
</div>


<div class="mt_40">
	<div class="wrap">
		<h3 class="titl">최다 추천 후기</h3>
		<input type="hidden" id="listNum" value="">
		<input type="hidden" id="location" value="">
		<ul class="mt_60">
			<c:forEach var="dto" items="${bestList}" varStatus="vnum">
				<li class="i_li" id="bestReview-${dto.exReviewNum}" data-rnum="${dto.exReviewNum}" ${vnum.count!=3?"style='margin-right: 60px;'":""}>
					<a class="mta" href="<%=cp %>/exhibit/article?num=${dto.exhibitNum}">
						<c:if test="${not empty dto.exProfileImage}">
							<img class="liPoster" src="<%=cp %>/uploads/image/${dto.exProfileImage}">
						</c:if>
						<c:if test="${empty dto.exProfileImage}">
							<img class="liPoster" src="<%=cp %>/resource/images/lumos/noposter.png">
						</c:if>
					</a>
					<div class="i_contDiv">
						<p class="i_titlp"><a class="i_tilt">${dto.exhibitName}</a></p>
						<div class="i_rvDiv" style="margin-top: 25px;">
							<p>
								${dto.userName} 
									<span> | ${dto.created}</span>
							</p>
							<div class="starDiv" data-score="${dto.score}"></div>
							<p class="rvCont">
								${dto.content}
							</p>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
		<div class="clearfix"></div>
	</div>
</div>

<div class="list_bg" style="margin-top: 20px;">
		<div class="wrap">
			<div class="erTitle">
				전시 후기
				<div style="float: right;">
					<ul class="orderUl">
						<li class="first" id="btn-latest" data-order="latest">최신순</li>
						<li class="last" id="btn-highscore" data-order="highscore">평점 높은 순</li>
					</ul>
				</div>
			</div>
				<div id="eReviewListBody" style="padding-bottom: 80px;">
					<!-- item -->
				</div>
				<div id="eReviewListFooter">
					<div class="line"></div>
					<div class="more_load" onclick="moreERv();">
						<img src="<%=cp %>/resource/images/lumos/more.png">
						<span>더보기</span>
					</div>
				</div>
			<div class="clearfix" style="margin-bottom: 30px;"></div>
		</div>
	</div>
	