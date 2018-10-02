<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="header-top">
    <div class="header-left">        
        <a href="<%=cp%>/" style="text-decoration: none;">
            <span style="width: 100%; height: 70; position: relative; left: 20px; top:5px; color: #aa1717; filter: mask(color=red) shadow(direction=135) chroma(color=red); font-family: 맑은 고딕; font-size: 50px; font-weight: bold;">LUMOS BUSINESS</span>
        </a>        
    </div>
    <div class="header-right">
        <div style="padding-top: 20px; float: right;">
            <c:if test="${empty sessionScope.member}">
                <a href="<%=cp%>/member/login">로그인</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/">사이트맵</a>
                	&nbsp;|&nbsp;
                <a href="<%=cp%>/" style="color: #aa1717;">ART CENTER</a>
            </c:if>            
        </div>
    </div>
</div>

<div class="menu">
    <ul class="nav">
    	
    	<li class="basicBox">
	    	<a href="<%=cp%>/admin/sales/salesSub/salesMain">
	    		<span style="font-size: 13pt;">매출관리</span>
		    	<svg width="130" height="50" viewBox="0 0 130 35" xmlns="http://www.w3.org/2000/svg">
			    	<rect x='0' y='0' fill='none' width='130' height='40'/>
			  	</svg>
		  	</a>
	  	</li>
        <li class="basicBox">
        	<a href="<%=cp%>/admin/menu2/concertSchedule/insertedlist">
        		<span style="font-size: 13pt">일정관리</span>
	        	<svg width="130" height="50" viewBox="0 0 130 35" xmlns="http://www.w3.org/2000/svg">
		    		<rect x='0' y='0' fill='none' width='130' height='40'/>
			  	</svg>
		  	</a>
        </li>
        <li class="basicBox">
        	<a href="#">
        		<span style="font-size: 13pt">직원관리</span>
        		<svg width="130" height="50" viewBox="0 0 130 35" xmlns="http://www.w3.org/2000/svg">
	    			<rect x='0' y='0' fill='none' width='130' height='40'/>
		  		</svg>
        	</a>
        </li>
        <li class="basicBox">
	        <a href="<%=cp%>/admin/membership/regular/regularList">
	        	<span style="font-size: 13pt">회원관리</span>
		        <svg width="130" height="50" viewBox="0 0 130 35" xmlns="http://www.w3.org/2000/svg">
			    	<rect x='0' y='0' fill='none' width='130' height='40'/>
			  	</svg>
		  	</a>
	  	</li>
        <li class="basicBox">
        	<a href="#">
        		<span style="font-size: 13pt">대관관리</span>
        		<svg width="130" height="50" viewBox="0 0 130 35" xmlns="http://www.w3.org/2000/svg">
			    	<rect x='0' y='0' fill='none' width='130' height='40'/>
			  	</svg>
        	</a>
        </li>
        <li class="basicBox">
        	<a href="<%=cp%>/admin/customer/question/questionAdmin">
        		<span style="font-size: 13pt">고객관리</span>
        		<svg width="130" height="50" viewBox="0 0 130 35" xmlns="http://www.w3.org/2000/svg">
			    	<rect x='0' y='0' fill='none' width='130' height='40'/>
			  	</svg>
        	</a>
        </li>
        <li class="basicBox">
        	<a href="#">
        		<span style="font-size: 13pt">굿즈관리</span>
        		<svg width="130" height="50" viewBox="0 0 130 35" xmlns="http://www.w3.org/2000/svg">
			    	<rect x='0' y='0' fill='none' width='130' height='40'/>
			  	</svg>
        	</a>
        </li>			
    </ul>      
</div>
