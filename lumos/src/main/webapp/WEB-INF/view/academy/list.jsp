<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/academystyle.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/academylayout.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>

<style type="text/css">

.imgLayout {
    width: 240px;
    height: 460px;
    margin-top: 30px;
    margin-right: 16px;
    background-color: #fff;
    border: 1px solid #ccc;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    overflow: hidden;
}

.subject {
    width: 180px;
    height: 25px;
    line-height: 25px;
    margin: 15px auto;
    /* border-top: 1px solid #DAD9FF; */
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    cursor: pointer;
}

</style>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}


</script>

<div class="body-content-container">
     <div class="body-academy-title">
         <span class="academy-title">아카데미 수강신청 </span>       	
         <button type="button" class="btn-academy-filter" onclick="javascript:location.href='<%=cp%>/academy/list?mode=finish';">전체</button>
         <button type="button" class="btn-academy-filter" onclick="javascript:location.href='<%=cp%>/academy/list?mode=ing';">마감된 강의 제외</button>
     </div>  
     
     <div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left">
			      <form name="searchForm" action="<%=cp%>/academy/list" method="post">
			          <input type="text" name="searchValue" class="list-title-boxTF"  placeholder="제목으로 검색">
				      <button type="button" class="btn-search" onclick="searchList()">검색</button>
				  </form>         
		      </td>
		   </tr>
		</table>
	
		<table style="width: 630px; margin: 0px auto; float: left; border-spacing: 0px;">
	<c:forEach var="dto" items="${list}" varStatus="status">
        <c:if test="${status.index==0}">	
			<tr>
		</c:if>
		<c:if test="${status.index!=0 && status.index%3==0}">
        	 <c:out value="</tr><tr>" escapeXml="false"/>
        </c:if>
		     <td width="210" align="center">
		        <div class="imgLayout">
		             <img src="<%=cp%>/resource/images/france.jpg" width="240" height="180" border="0" onclick="javascript:article('${dto.academyNum}');">
		             	<div class="academy_desc">		             	
		                   	<p style="font-size: 15px; font-weight: bold; padding: 10px 10px 35px 0px; height: 85px;">
		                   		<span><a href="${articleUrl}&academyNum=${dto.academyNum}&mode=${dto.mode}">${dto.academyName}</a></span> 
		                   	</p>
		                   	<p class="font12 ">${dto.position} | ${dto.roomName}</p>
		                   	<p class="font12 ">${dto.startDate}(${dto.lectureDay})~${dto.endDate}(${dto.lectureDay})</p>
		                   	<p class="font12 ">(${dto.lectureDay})${dto.startTime}~${dto.endTime}</p>
		             	</div>
		             	
		             	<div class="academy_desc2">	
			             	<c:if test="${dto.mode=='finish'}">
			             		<p class="list-finish"><span>마&nbsp;감</span></p> 	             	
			                </c:if>
			                <c:if test="${dto.mode=='ing'}">
			                	<p class="list-ing"><span>접수중</span></p>  	
			                </c:if>	
		                   	<p class="font12 totalCount">(<b>${applyDateCount}</b>/${dto.totalCount})</p>
		                   		<input type="hidden" name="academyNum" value="${dto.academyNum}">		                   	
		             	</div>
		         </div>
		     </td>
	</c:forEach>	     
		  
		<c:set var="n" value="${list.size()}"/>
		<c:if test="${n>0&&n%4!=0}">
		        <c:forEach var="i" begin="${n%4+1}" end="4" step="1">
			         <td width="210"></td>
		        </c:forEach>
		</c:if>
	
		<c:if test="${n!=0}">
		       <c:out value="</tr>" escapeXml="false"/>
		</c:if>
		
			</table>           

			<table style="width: 100%;">
			   <tr height="35">
				<td align="center" style="font-weight: bold;  padding: 50px;">
			        <c:if test="${dataCount==0 }">
			               	 검색된 결과가 없습니다.
			         </c:if>	
			        <c:if test="${dataCount!=0 }">
			               ${paging}
			         </c:if>
				</td>
			   </tr>
			</table>
     </div>
</div>
