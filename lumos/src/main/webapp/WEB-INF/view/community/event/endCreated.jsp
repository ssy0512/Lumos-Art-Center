<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function check() {
    // 스마트에디터 입력 내용
  
	str = f.content.value;
    if(!str || str=="<p>&nbsp;</p>") {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action="<%=cp%>/admin/community/event/endUpdate";

    return true;
}

</script>

<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitArticle.css" type="text/css">


<%-- 포스터 + 상세정보 --%>
<form name="boardForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data">
<div class="exhibit_detail" style="min-height:450px;">
	<div class="wrap">
		<div class="pageTitleAndButton">
			<span>이벤트 등록</span>
		</div>
		<div class="poster left">
			<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/${dto.saveFilename}">
		</div>
		<div class="content right" style="min-height:350px;">
			<table class="detail_inform">
				<tbody>
					<tr style="height:40px">
						<th>제목</th>
						<td>${dto.title}</td>						
					</tr>
					<tr style="height:40px">
						<th>기간</th>
						<td>
							${dto.eventStart}">~${dto.eventEnd}
						</td>						
					</tr>
					<tr style="height:40px">
						<th>당첨자 발표</th>
						<td>${dto.eventWin}</td>						
					</tr>
					<tr style="height:40px">
						<th>이벤트 방식</th>
						<td>
							<div class="selectOption" style="margin-top:50px;">
								<c:if test="${dto.selectOption == 'reply' }">
									<p  style="border-color: #fd8424;color: #fd8424;">
										댓글 이벤트</p>
								</c:if>
								<c:if test="${dto.selectOption == 'review' }">
									<p  style="border-color: #006fd2;color: #006fd2;">
										리뷰 이벤트</p>
								</c:if>
							</div>
						</td>
					</tr>
					<tr style="height:40px">
						<th>저장된 이미지</th>
						<td> ${dto.originalFilename }</td>	
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
</div>

<div style="width: 1020px;    margin: 0 auto; min-height: 620px;">
	
	    <textarea name="content" id="content" style="width: 95%; height: 500px;">
	    <c:if test="${empty dto.endContent }"> ${dto.content}</c:if>
	    <c:if test="${not empty dto.endContent }">${dto.endContent }</c:if>
	    </textarea> <br>
	    <div class="eBtnDiv">
		    <button type="submit" class="eBtn" style="margin-right: 5px;'">수정완료</button>
			<button type="reset" class="eBtn" style="margin-right: 5px;'">다시입력</button>
			<button type="button" class="eBtn" onclick="javascript:location.href='<%=cp%>/community/event/eventTab';">수정취소</button>
		    <input type="hidden" name="num" value="${dto.eventNum}">
	    </div>
</div>
</form>


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