<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<style type="text/css">

.imgLayout {
    height: 100%;
    margin: 30px 30px 30px 30px;
    background-color: #fff;
}

</style>

<script type="text/javascript">

function check() {
    var f = document.boardForm;

	var str = f.classInfo.value;
    if(!str || str=="<p>&nbsp;</p>") {
        alert("내용을 입력하세요.");
        f.classInfo.focus();
        return false;
    }

	f.action="<%=cp%>/academy/${mode}";

	return true;
}

</script>

<div class="body-content-container">
     <div class="body-academy-title">
         <span class="academy-title">아카데미 수강신청 </span>
     </div>  
     
     <div>		
		<div class="imgLayout">
             <img src="<%=cp%>/uploads/image/${dto.acProfileImage}" width="240" height="180" border="0" onclick="javascript:article('${dto.academyNum}');">
             	<div class="academy_desc3">	
                   	<p class="academy_desc3-title">
                   		<span>${dto.academyName}</span> 
                   	</p>
             		<p class="font14">강사<span style="width: 500px; font-weight: 600; text-decoration: none; float: right;">| &nbsp;${dto.instName}</span></p>		
             		<p class="font14">요일.시간
             			<span style="width: 500px; font-weight: 600; text-decoration: none; float: right;">| &nbsp;(${dto.lectureDay}) ${dto.startTime}~${dto.endTime}</span></p>	  
             		<p class="font14">수강기간
             			<span style="width: 500px; font-weight: 600; text-decoration: none; float: right;">| &nbsp;${dto.startDate}(${dto.lectureDay})~${dto.endDate}(${dto.lectureDay})</span></p>
             		<p class="font14">장소<span style="width: 500px; font-weight: 600; text-decoration: none; float: right;">| &nbsp;${dto.position} | ${dto.roomName}</span></p>  
             		<p class="font14">모집정원<span style="width: 500px; font-weight: 600; text-decoration: none; float: right;">| &nbsp;${dto.totalCount} 명</span></p> 
             		<p class="font14">수강료
             			<span style="width: 500px; font-weight: 600; text-decoration: none; float: right;">|&nbsp;<font color="#aa1717">
             				<fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</font>
             			</span>
             		</p>
             	</div>            		
                   	
             <c:if test="${mode=='finish'}">
          		<p class="list-ing" style="color:darkgrey; background-color: #ffffff; border: 1px solid darkgrey;
	             								height:40px; padding: 10px 15px 5px 15px;"><span>마&nbsp;감</span></p> 	             	
             </c:if> 
             	<div style="width: 240px; margin: 5px 0px 5px 0px; float: left;">
             		<p class="list-ing" style="height:40px; padding: 10px 15px 5px 15px; margin: 25px 0px 25px 0px;">접수중</p>
             	</div> 
                   		                   	
             	<div class="academy_desc4">	
                   	<p style="padding: 20px 0px; margin-bottom: 10px; font-size: 25px; font-weight: bold;">
                   	  	수강신청하기
                   	</p>
                <c:if test="${sessionScope.member!=userId}">    	
                   	<p style="border-top: 1px solid #666; border-bottom: 1px solid #666; padding: 20px 10px; font-size: 20px; font-weight: bold;">
                   	  	결제정보
                   	  	<span style="float: right; color: #aa1717; padding-bottom: 10px;">
                   	  		<fmt:formatNumber value="${dto.price}" pattern="#,###"/>원
                   	  	</span>
                   	</p>
               
                   	<p style="padding: 20px 0px 10px; font-size: 20px; text-align: center;">
                   	  	 <button type="button" class="btn-Count" onclick="javascript:location.href='<%=cp%>/academy/classapply';">결&nbsp;&nbsp;&nbsp;제</button>
                   	</p>
                </c:if>   	                   	                   	
                   	
                <c:if test="${empty sessionScope.member}">   	
	             	<p style="border-top: 1px solid #666; border-bottom: 1px solid #666; text-align: center; font-size: 20px; margin: 10px; padding: 20px;">
                   	  	<a href="<%=cp%>/member/login">로그인이 필요 합니다.</a>
                   	</p>
                </c:if>   	
             	</div>
             	
             	<div>
             		<table style="width: 240px; height: 125px;">
             			<tr style="text-align: center; height: 30;">
	             			<th colspan="2" style="border: 1px solid #ccc; text-align: center; font-weight: 400; background-color: whitesmoke;">모집현황</th>	             			
             			</tr>
             			<tr style="text-align: center;">
	             			<td style="border: 1px solid #ccc;">신청 0명</td>
	             			<td style="border: 1px solid #ccc;">정원 ${dto.totalCount}명</td>
             			</tr>
             		</table>
             	</div>      	
         </div>		
     </div>
     
     <div style="width: 1020px; height: 1000px;">
     <form name="boardForm" method="post" onsubmit="return submitContents(this);">
	     <table style="width:1020px; height: 100%;">
			<tr>
				<td valign="top" style="padding:5px 0px 5px 0px;"> 
			        <textarea name="classInfo" id="classInfo" style="width:98%; height: 270px;">${dto.classInfo}</textarea>
			    </td>
			</tr> 
		 </table>
		
		<table>					
			<tr height="45"> 
			      <td width="1020px" align="center" style="padding: 20px;">
			      <div style="width: 310px;">
				        <button type="submit" class="btn-info">${mode=='update'?'수정완료':'등록하기'}</button>
				        <button type="button" class="btn-info" onclick="javascript:location.href='<%=cp%>/academy/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="academyNum" value="${dto.academyNum}">
			        	 <input type="hidden" name="page" value="${page}">
			         </c:if>
			      </div>
			      </td>
			    </tr>
	     	</table>
	     </form>
     </div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "classInfo",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
		}
	}, //boolean
	fOnAppLoad : function(){	
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["classInfo"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["classInfo"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["classInfo"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["classInfo"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>

</div>    