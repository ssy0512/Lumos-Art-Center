<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">
<style>
.alert-info {
    border: 1px solid #9acfea;
    border-radius: 4px;
    background-color: #d9edf7;
    color: #31708f;
    padding: 15px;
    margin-top: 10px;
    margin-bottom: 20px;
}
</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	//이화연 181009 main에서 공지글로 이동-------------------------------------
	<c:if test="${goTo=='notice'}">
		toArticleBoard("${mNoticeNum}","${goTo}", 1);
		
		// 문의글 밑 공지 볼때. 
		function toArticleBoard(num, goTo, page) {
			var url="<%=cp%>/customerCenter/"+goTo+"/article";
			var query;
			if(goTo=="questions")
				query="postNum="+num;
			else
				query="noticeNum="+num;
			
			query=query+"&page="+page;
			ajaxHTML(url, "get", query);
		}
	</c:if>
	//--------------------------------------------------------------------
	
	$("#tab-notice").addClass("active");
	
	//이화연 181009 main에서 공지글로 이동하는 경우 listPage(1);실행되지 않도록-----------
	<c:if test="${empty goTo}">
	listPage(1);
	</c:if>
	
	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		listPage(1);
	});
});

// 글리스트 및 페이징 처리
function listPage(page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCenter/"+tab+"/list";
	
	var query="page="+page;
	var search=$('form[name=customerSearchForm]').serialize();
	query=query+"&"+search;
	
	ajaxHTML(url, "get", query);
}

// 글리스트 및 글쓰기폼, 글보기, 글수정폼 ajax
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return;
			}
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

// 사용자용 검색. 
function searchList() {
	var f=document.customerSearchForm;
	f.searchKey.value=$("#searchKey").val();
	f.searchValue.value=$.trim($("#searchValue").val());

	listPage(1);
}

// 새로고침
function reloadBoard() {
	var f=document.customerSearchForm;
	f.searchKey.value="title";
	f.searchValue.value="";
	
	listPage(1);
}

// 글쓰기폼
function insertForm() {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCenter/"+tab+"/created";

	var query="tmp="+new Date().getTime();
	ajaxHTML(url, "get", query);
}


function sendOk(mode, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	
    var f = document.boardForm;

	var str = f.title.value;
    if(!str) {
        alert("제목을 입력하십시오. ");
        f.title.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하십시오. ");
        f.content.focus();
        return;
    }
    
   
	
    var url="<%=cp%>/customerCenter/"+tab+"/"+mode;
    var query = new FormData(f); 
    
	$.ajax({
        type:"post"
        ,url:url
        ,processData: false  
        ,contentType: false  
        ,data: query
        ,dataType:"json"
        ,success:function(data) {
            var state=data.state;
            if(state=="false")
                alert("게시물을 추가(수정)하지 못했습니다");

        	if(page==undefined || page=="")
        		page="1";
        	
        	if(mode=="created" || mode=="reply") {
        		reloadBoard();
        	} else {
        		listPage(page);
        	}
        }
        ,beforeSend : function(jqXHR) {
            jqXHR.setRequestHeader("AJAX", true);
        }
        ,error : function(jqXHR) {
        	if(jqXHR.status==403) {
	    		location.href="<%=cp%>/member/login";
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
        }
	});
}


function sendCancel(page) {
	if(page==undefined || page=="")
		page="1";
	
	listPage(page);
}

// 문의글 밑 공지 볼때. 
function articleBoard(num, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCenter/"+tab+"/article";
	
	var query;
	if(tab=="questions")
		query="postNum="+num;
	else
		query="noticeNum="+num;
	
	var search=$('form[name=customerSearchForm]').serialize();
	query=query+"&page="+page+"&"+search;
	
	ajaxHTML(url, "get", query);
}

// 글 수정폼
function updateForm(num, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCenter/"+tab+"/update";
	
	var query;
	if(tab=="questions")
		query="postNum="+num;
	else
		query="noticeNum="+num;
	query=query+"&page="+page
	
	ajaxHTML(url, "get", query);
}

//글 답변폼
function replyForm(num, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCenter/"+tab+"/reply";
	
	var query;
	if(tab=="questions")
		query="postNum="+num;
	else
		query="noticeNum="+num;
	query=query+"&page="+page
	
	ajaxHTML(url, "get", query);
}

// 글 삭제
function deleteBoard(num, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCenter/"+tab+"/delete";
	
	var query;
	if(tab=="questions") {
		query="postNum="+num;
	} else { 
		query="noticeNum="+num;
	}
	
	if(! confirm("위 게시물을 삭제 하시 겠습니까 ? "))
		  return;
	  
	$.ajax({
	        type:"post"
	        ,url:url
	        ,data: query
	        ,dataType:"json"
	        ,success:function(data) {
	            listPage(page);
	        }
	        ,beforeSend : function(jqXHR) {
	            jqXHR.setRequestHeader("AJAX", true);
	        }
	        ,error : function(jqXHR) {
	        	if(jqXHR.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	}
		    	console.log(jqXHR.responseText);
	        }
	});
}

</script>

<div class="body-container" style="width: 700px;">
    <div class="body-title" style="padding-top:30px;">
       <h3>   고객센터 </h3>
    </div>
    
    <div>
            <div style="clear: both;">
	           <ul class="tabs">
			       <li id="tab-notice" data-tab="notice">공지사항</li>
			       <li id="tab-questions" data-tab="questions">1:1문의</li>
			   </ul>
		   </div>
		   <div id="tab-content" style="clear:both; padding: 20px 10px 0px;"> </div>
    </div>
</div>

<form name="customerSearchForm" action="" method="post">
    <input type="hidden" name="searchKey" value="title">
    <input type="hidden" name="searchValue" value="">
</form>

