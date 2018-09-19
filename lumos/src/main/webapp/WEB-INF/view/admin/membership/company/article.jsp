<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
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

<div class="body-right" style="width: 1380px; height: 800px;">
	<div class="body-title">
          <h3><span class="glyphicon glyphicon-book"></span> 게시판 </h3>
    </div>
    <div class="table-responsive" style="clear: both;">
    	<div class="bbs-article">
    		<table class="table">
    			<thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                                ${dto.companyIndex}
                         </th>
                     </tr>
                <thead>
                <tbody>
                	<tr>
                		<td>${dto.companyIndex}</td>
                		<td>${dto.companyName}</td>
                		<td>${dto.businessNumber}</td>
                		<td>${dto.address1}</td>
                	</tr>
                	<tr>
                		<td>${dto.repname}</td>
                		<td colspan="2">${dto.repnumber}</td>
                		<td>${dto.fax}</td>
                	</tr>
                </tbody>
                <tfoot>
                	<tr>
                		<td>
                			<button type="button" onclick="updateCompany();"></button>
                		</td>
                		<td>
                			<button type="button" onclick="javascript:location.href='<%=cp%>/admin/member/company/companyList?${query}';"></button>
                		</td>
                	</tr>
                </tfoot>
    		</table>
    	</div>
    </div>
</div>
