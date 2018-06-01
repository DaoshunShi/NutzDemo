<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>

<input type="hidden" name="pageNum" id="pageNum" value="${obj.pager.pageNumber}"/>
<input type="hidden" name="rows" id="pageSize" value="${obj.pager.pageSize}"/>
<table  width="100%" border="0" align="center" cellspacing="0">
	<tr>
		<td align="right">
			&nbsp;共 <strong>${obj.pager.recordCount}</strong> 条记录  &nbsp;|&nbsp;
			&nbsp;<a href="javascript:jumpPage(1)">首页</a>
			<c:if test="${obj.pager.pageNumber != 1}">
			&nbsp;<a href="javascript:jumpPage(${obj.pager.pageNumber-1})">上一页</a>
			</c:if>
			<c:if test="${obj.pager.pageNumber == 1}">
			&nbsp;<a href="#">上一页</a>
			</c:if>
			<c:if test="${obj.pager.pageNumber < obj.pager.pageCount}">
			&nbsp;<a href="javascript:jumpPage(${obj.pager.pageNumber+1})">下一页</a>
			</c:if> 
			<c:if test="${obj.pager.pageNumber == obj.pager.pageCount}">
			&nbsp;<a href="#">下一页</a>
			</c:if> 
			&nbsp;<a href="javascript:jumpPage(${obj.pager.pageCount})">尾页</a>&nbsp;|&nbsp;
			共&nbsp;<strong>${obj.pager.pageCount}</strong> &nbsp;页 当前为 第&nbsp;<strong>${obj.pager.pageNumber}/${obj.pager.pageCount}</strong>&nbsp;页 |
			&nbsp;转到第 
			<input type="text" class="dfinput" style="width:30px;" id="jumpNo" name="jumpNo" />
			页&nbsp;<a href="javascript:jumpNo()">go</a>
		</td>
		<td width="45px;"></td>
	</tr>
</table>

<script language="JavaScript">
	function jumpNo() {
		if($("#jumpNo").val()<=parseInt('${obj.pager.pageCount}') && $("#jumpNo").val()>0){
			jumpPage($("#jumpNo").val());
		}else{
			$("#jumpNo").val("");
		}
	}
	function jumpPage(pageNum) {
		$("#pageNum").val(pageNum);
		$("#pageForm").submit();
	}
	function changeSize() {
		$("#pageForm").submit();
	}
</script>