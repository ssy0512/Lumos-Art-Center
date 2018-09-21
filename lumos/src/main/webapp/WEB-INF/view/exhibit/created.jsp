<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    function check() {
        var f = document.boardForm;
    	str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

        f.action="<%=cp%>/admin/exhibit/${mode}";

        return true;
    }
</script>

<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitArticle.css" type="text/css">


<%-- 포스터 + 상세정보 --%>
<div class="exhibit_detail">
	<div class="wrap">
		<div class="pageTitleAndButton">
			<span>전시 상세 정보</span>
		</div>
		<div class="poster left">
			<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/${dto.exProfileImage}">
		</div>
		<div class="content right">
			<h2>${dto.exhibitName}</h2>
			<table class="detail_inform">
				<tbody>
					<tr>
						<th>기간</th>
						<td>${dto.exhibitStart}~${dto.exhibitEnd}</td>						
					</tr>
					<tr>
						<th>시간</th>
						<td>${dto.admitStart}~${dto.admitEnd}</td>						
					</tr>
					<tr>
						<th>장소</th>
						<td>${dto.hallName}&nbsp;${dto.exHallLocate}</td>						
					</tr>
					<tr>
						<th>관람등급</th>
						<td>${dto.ratingName}</td>						
					</tr>
					<tr>
						<th>장르</th>
						<td>${dto.genre}</td>						
					</tr>
					<tr>
						<th>가격</th>
						<td></td>						
					</tr>
					<tr>
						<th>주최</th>
						<td>${dto.host}</td>						
					</tr>
					<c:if test="${dto.host!='lac' && not empty dto.supervise}">
						<tr>
							<th>주관</th>
							<td>${dto.supervise}</td>						
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div style="width: 1020px;    margin: 0 auto; min-height: 620px;">
	<form name="boardForm" method="post" onsubmit="return submitContents(this);">
	    <textarea name="content" id="content" style="width: 95%; height: 500px;">${dto.content}</textarea> <br>
	    <div class="eBtnDiv">
		    <button type="submit" class="eBtn" style="margin-right: 5px;'">${mode=='update'?'수정완료':'등록하기'}</button>
			<button type="reset" class="eBtn" style="margin-right: 5px;'">다시입력</button>
			<button type="button" class="eBtn" onclick="javascript:location.href='<%=cp%>/exhibit/main';">${mode=='update'?'수정취소':'등록취소'}</button>
			
			 <c:if test="${mode=='update'}">
			         <input type="hidden" name="num" value="${dto.exhibitNum}">
			</c:if>
			        
	    </div>
	</form>
</div>


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
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
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>

