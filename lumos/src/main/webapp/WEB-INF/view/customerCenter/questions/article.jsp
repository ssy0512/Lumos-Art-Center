<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.bbs-article .table {
    margin-top: 15px;
}
.bbs-article .table thead tr, .bbs-article .table tbody tr {
    height: 30px;
}
.bbs-article .table thead tr th, .bbs-article .table tbody tr td {
    font-weight: normal;
    border-top: none;
    border-bottom: none;
}
.bbs-article .table thead tr {
    border-top: #d5d5d5 solid 1px;
    border-bottom: #dfdfdf solid 1px;
} 
.bbs-article .table tbody tr {
    border-bottom: #dfdfdf solid 1px;
}
.bbs-article .table i {
    background: #424951;
    display: inline-block;
    margin: 0 7px 0 7px;
    position: relative;
    top: 2px;
    width: 1px;
    height: 13px;    
}
</style>

<script type="text/javascript">
function deleteQuestion() {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.memberIndex==dto.memberIndex}">
    var postNum = "${dto.postNum}";
    var page = "${page}";
    var query = "postNum="+postNum+"&page="+page;
    var url = "<%=cp%>/customerCenter/questions/delete?" + query;

    if(confirm("문의글을 삭제 하시겠습니까? "))
  	    location.href=url;
</c:if>    
<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.memberIndex!=dto.memberIndex}">
  alert("문의글을 삭제할 수  없습니다.");
</c:if>
}

function updateQuestion() {
<c:if test="${sessionScope.member.memberIndex==dto.memberIndex}">
    var postNum = "${dto.postNum}";
    var page = "${page}";
    var query = "postNum="+postNum+"&page="+page;
    var url = "<%=cp%>/customerCenter/questions/update?" + query;

    location.href=url;
</c:if>

<c:if test="${sessionScope.member.memberIndex!=dto.memberIndex}">
     alert("게시물을 수정할 수  없습니다.");
</c:if>
}

</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-question-sign"></span> 1:1문의 </h3>
    </div>
    
    
    <div class="table-responsive" style="clear: both;">
        <div class="bbs-article">
            <table class="table">
                 <thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                                <c:if test="${dto.depth!=0}">
                                    [Re]
                                </c:if>
                                ${dto.title}
                         </th>
                     </tr>
                <thead>
                
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                             작성자 : ${dto.userName}
                         </td>
                         <td style="text-align: right;">
                          ${dto.created}
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 230px;">
                              ${dto.content}
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
                              <c:if test="${not empty preReadDto }">
                                  <a href="<%=cp%>/customerCenter/questions/article?${query}&postNum=${preReadDto.postNum}">${preReadDto.title}</a>
                              </c:if>					
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
                              <span style="display: inline-block; min-width: 45px;">다음글</span> :
                              <c:if test="${not empty nextReadDto }">
                                  <a href="<%=cp%>/customerCenter/questions/article?${query}&postNum=${nextReadDto.postNum}">${nextReadDto.title}</a>
                              </c:if>
                         </td>
                     </tr>                                          
                </tbody>
                
                <tfoot>
                	<tr>
                		<td>
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/customerCenter/questions/reply?postNum=${dto.postNum}&page=${page}';">답변</button>
<c:if test="${sessionScope.member.memberIndex==dto.memberIndex}">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="updateQuestion();">수정</button>
</c:if>
<c:if test="${sessionScope.member.memberIndex==dto.memberIndex || sessionScope.member.userId=='admin'}">	                		    
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteQuestion();">삭제</button>
</c:if>                		    
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>customerCenter/questions/list?${query}';"> 목록으로 </button>
                		</td>
                	</tr>
                </tfoot>
            </table>
       </div>

   </div>

</div>