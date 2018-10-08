<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/myActivity.css" type="text/css">
<script type="text/javascript">
$(function(){
	$("#tab-all").addClass("click_on");
	listPage();
	
	// 클릭으로 탭 전환
	$("ul.maTabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.maTabs li").each(function () {
			$(this).removeClass("click_on");
		});
		
		$("#tab-"+tab).addClass("click_on");
		
		listPage();
	});
});

//글리스트 및 글쓰기폼, 글보기, 글수정폼 ajax
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$("#tab-content").html(data);
		}
		,beforeSend : function(jqXHR) {
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

// 글 리스트 및 페이징 처리
function listPage() {
	var $tab = $(".maTabs .click_on");
	var tab = $tab.attr("data-tab");
	var url = "<%=cp%>/mypage/myActivity/"+tab+"/list";
	var query = "";
	
	ajaxHTML(url, "get", query);
}

//--------------------------------------------------------------
function moveTab(tab) {
	$("ul.maTabs li").each(function () {
		$(this).removeClass("click_on");
	});
	
	$("#tab-"+tab).addClass("click_on");
	listPage();
}

//--------------------------------------------------------------
function cReviewListPage(page) {
	var url="<%=cp%>/mypage/myActivity/cReviewItemList";
	var query="pageNo="+page;
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			printCReview(data);
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

function printCReview(data) {
	var dataCount = data.dataCount;
	var page = data.pageNo;
	totalPage = data.total_page;
	
	var out="";
	if(dataCount!=0) {
		for(var idx=0; idx<data.cReviewList.length; idx++) {
			var creviewNum=data.cReviewList[idx].creviewNum;
			var concertNum=data.cReviewList[idx].concertNum;
			var score=data.cReviewList[idx].score;
			var concertName=data.cReviewList[idx].concertName;
			var concertStart=data.cReviewList[idx].concertStart;
			var concertEnd=data.cReviewList[idx].concertEnd;
			var content=data.cReviewList[idx].content;
			var created=data.cReviewList[idx].created;
			var hallName=data.cReviewList[idx].hallName;
			var conProfileImage=data.cReviewList[idx].conProfileImage;
			
			out+="<div class='crv_item'>";
			out+="	<div class='crv_content'>";
			out+="		<a style='text-decoration: none;'>";
			
			if(conProfileImage==null || conProfileImage==''){
				out+="			<img src='<%=cp %>/resource/images/lumos/noposter.png'>";
			} else {
				out+="			<img src='<%=cp %>/uploads/image/"+conProfileImage+"'>";
			}
			
			out+="		</a>";
			out+="		<div class='conDiv'>";
			out+="			<div class='topD'>";
			out+="				<h3>";
			out+="					<a>"+concertName+"</a></h3>";
			out+="				<p style='color: #777;''>";
			out+="					"+hallName+" | "+concertStart+" ~ "+concertEnd;
			out+="					<span>작성일 : "+created+"</span></p>";
			out+="				<div class='starDiv' data-score='"+score+"'>";
			out+="				</div>";
			out+="			</div>";
			out+="			<div class='botD'>";
			out+="				<p>"+content+"</p>";
			out+="				<div class='clearfix' style='margin-bottom: 10px;'></div>";
			out+="				<div style='float: right;'>";
			out+="					<button class='btnEdit'>수정</button><button class='btnDel'>삭제</button>";
			out+="				</div>";
			out+="			</div>";
			out+="			<div class='clearfix' style='margin-bottom: 15px;'></div>";
			out+="		</div>";
			out+="	</div>";
			out+="</div>";
			out+="<div class='clearfix' style='margin-top : 10px; border-bottom: 1px solid #eee;'></div>";
		}
		
		$("#cReviewListBody").append(out);
		cReviewStar();
		
		if(pageNo>=totalPage) {
			$("#cReviewListFooter").hide();
		} else {
			$("#cReviewListFooter").show();
		}
	} else {
		out+="<p class='emptyMsg'>“ 등록된 공연 후기가 없습니다. ”</p>";
		$("#cReviewListBody").append(out);
	}
}

function eReviewListPage(page) {
	var url="<%=cp%>/mypage/myActivity/eReviewItemList";
	var query="pageNo="+page;
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			printEReview(data);
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
			
			out+="<div class='erv_item'>";
			out+="	<div class='erv_content'>";
			out+="		<a style='text-decoration: none;'>";
			
			if(exProfileImage==null || exProfileImage==''){
				out+="			<img src='<%=cp %>/resource/images/lumos/noposter.png'>";
			} else {
				out+="			<img src='<%=cp %>/uploads/image/"+exProfileImage+"'>";
			}
			
			out+="		</a>";
			out+="		<div class='conDiv'>";
			out+="			<div class='topD'>";
			out+="				<h3>";
			out+="					<a>"+exhibitName+"</a></h3>";
			out+="				<p style='color: #777;''>";
			out+="					"+hallName+" | "+exhibitStart+" ~ "+exhibitEnd;
			out+="					<span>작성일 : "+created+"</span></p>";
			out+="				<div class='starDiv' data-score='"+score+"'>";
			out+="				</div>";
			out+="			</div>";
			out+="			<div class='botD'>";
			out+="				<p>"+content+"</p>";
			out+="				<div class='clearfix' style='margin-bottom: 10px;'></div>";
			out+="				<div style='float: right;'>";
			out+="					<button class='btnEdit' onclick='erUpdate("+exhibitNum+");'>수정</button><button class='btnDel' onclick='deleteEReview("+exReviewNum+")'>삭제</button>";
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
		
		if(pageNo>=totalPage) {
			$("#eReviewListFooter").hide();
		} else {
			$("#eReviewListFooter").show();
		}
	} else {
		out+="<p class='emptyMsg'>“ 등록된 전시 후기가 없습니다. ”</p>";
		$("#eReviewListBody").append(out);
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
//--------------------------------------------------------------

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

</script>

<div class="myActHead">
	<div class="wrap">
		<h2 class="tabTitle">활동내역</h2>
		<div class="myActTab">
			<ul class="maTabs">
				<li id="tab-all" data-tab="all" class="first">전체</li>
				<li id="tab-cReview" data-tab="cReview" >공연 후기</li>
				<li id="tab-eReview" data-tab="eReview" >전시 후기</li>
				<li id="tab-myQna" data-tab="myQna" class="last">나의 상담 문의</li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div id="tab-content" style="margin-top: 15px;">
</div>