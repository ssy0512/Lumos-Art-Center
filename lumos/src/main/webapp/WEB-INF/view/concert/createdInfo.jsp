<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitInfo.css" type="text/css">
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

        f.action="<%=cp%>/admin/concertHallinfo/${mode}";

        return true;
    }
</script>

<div class="place_info">
	<div class="wrap">
		<h2>${dto.hallName}
			<img class="place_icon" src="<%=cp%>/resource/images/lumos/music_icon.png">
		</h2>
		<div class="clearD"></div>
	</div>
</div>

<div style="width: 1020px;    margin: 20px auto; min-height: 620px;">
	<form name="boardForm" method="post" onsubmit="return submitContents(this);">
	    <textarea name="content" id="content" style="width: 95%; height: 500px;">${dto.content}</textarea> <br>
	    <div class="eBtnDiv">
		    <button type="submit" class="eBtn" style="margin-right: 5px;'">${mode=='update'?'수정완료':'등록하기'}</button>
			<button type="reset" class="eBtn" style="margin-right: 5px;'">다시입력</button>
			<button type="button" class="eBtn" onclick="javascript:location.href='<%=cp%>/concert/seatGuide';">${mode=='update'?'수정취소':'등록취소'}</button>
			
			 <c:if test="${mode=='update'}">
			         <input type="hidden" name="num" value="${dto.hallNum}">
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

