<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/mainstyle.css" type="text/css">
<div class="body-container">
    <div class="wrap">
    
    
    	<div class="clearfix mt50">
    		<div class="mbt30">
    			<h2 class="lovelac">I <span class="fred">♥</span> LOVE LAC !</h2>
	    		<p class="follow">Follow us</p>
	    		<p class="follow">1년 365일 공연과 전시가 끊이지 않는 루모스 아트센터의 소셜 미디어(SNS)를 소개합니다.</p>
	    		<ul class="snsUl">
	    			<li><a><img src="<%=cp%>/resource/images/lumos/sns_f.png"></a></li>
	    			<li><a><img src="<%=cp%>/resource/images/lumos/sns_t.png"></a></li>
	    			<li><a><img src="<%=cp%>/resource/images/lumos/sns_i.png"></a></li>
	    			<li><a><img src="<%=cp%>/resource/images/lumos/sns_n.png"></a></li>
	    			<li><a><img src="<%=cp%>/resource/images/lumos/sns_plus.png"></a></li>
	    			<li><a><img src="<%=cp%>/resource/images/lumos/sns_tv.png"></a></li>
	    			<li><a><img src="<%=cp%>/resource/images/lumos/sns_youtube.png"></a></li>
	    			<li class="last"><a><img src="<%=cp%>/resource/images/lumos/sns_podcast.png"></a></li>
	    		</ul>
    		</div>
    	</div>
    	
    	
    	<div class="evtntc">
	        <div class="eventDiv">   
	        	<h1>진행중인 이벤트</h1>
	        	<ul class="eventUl">
	        		<c:forEach items="${evtList}" var="evt">
		        		<li>
		        			<span class="evtkind"><span>
		        			${selectOption==reply?"댓글 이벤트":selectOption==review?"리뷰 이벤트":""}</span></span>
		        			<a href="<%=cp%>/community/event/article?eventNum=${evt.eventNum}"><span class="sub">${evt.title}</span></a>
		        			<span class="endDate">~${evt.eventEnd}</span>
		        		</li>
	        		</c:forEach>
	        	</ul>
	        	<a class="more" style="bottom: 152px;" href="<%=cp%>/community/event/eventTab">더보기+</a>
	        </div>
	        <div class="noticeDiv">
	        	<h1>공지사항</h1>
	        	<ul class="noticeUl">
	        		<c:forEach items="${ntcList}" var="ntc">
		        		<li>
		        			<span class="update">${ntc.created}</span>
		        			<a href="<%=cp%>/customerCenter/main_notice?noticeNum=${ntc.noticeNum}">
		        				<span class="subj ${ntc.important==1?'bold':''}">${ntc.title}</span>
		        			</a>
		        		</li>
	        		</c:forEach>
	        	</ul>
	        	<a class="more" style="bottom: 302px;" href="<%=cp%>/customerCenter/main">더보기+</a>
	        </div>
		</div>
		
		
		<div class="clearfix mt50"></div>
    </div>
</div>