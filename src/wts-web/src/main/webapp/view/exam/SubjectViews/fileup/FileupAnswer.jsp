<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--考题答案表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary"> <c:if
				test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formSubjectanswer">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<input type="hidden" id="entity_id" name="versionid"
				value="${versionid}">
			<table class="editTable">
				<tr>
					<td class="title">位置:</td>
					<td><input type="text" style="width: 120px;"
						class="easyui-validatebox"
						data-options="required:true,validType:['integer','maxLength[5]']"
						id="entity_sort" name="sort" value="${entity.sort}"></td>
					<td class="title"></td>
					<td></td>
				</tr>
				<tr>
					<td class="title">评价标准:</td>
					<td colspan="3">
						<textarea rows="2" style="width: 360px;"
							class="easyui-validatebox"
							data-options="validType:['maxLength[256]']" id="entity_answer"
							name="answer">${entity.answer}</textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==1}">
				<a id="dom_add_entitySubjectanswer" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">增加</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entitySubjectanswer" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formSubjectanswer" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionSubjectanswer = 'subjectanswer/add.do';
	var submitEditActionSubjectanswer = 'subjectanswer/edit.do';
	var currentPageTypeSubjectanswer = '${pageset.operateType}';
	var submitFormSubjectanswer;
	$(function() {
		//表单组件对象
		submitFormSubjectanswer = $('#dom_formSubjectanswer').SubmitForm({
			pageType : currentPageTypeSubjectanswer,
			grid : gridSubjectanswer,
			currentWindowId : 'winSubjectanswer'
		});
		//关闭窗口
		$('#dom_cancle_formSubjectanswer').bind('click', function() {
			$('#winSubjectanswer').window('close');
		});
		//提交新增数据
		$('#dom_add_entitySubjectanswer').bind('click', function() {
			submitFormSubjectanswer.postSubmit(submitAddActionSubjectanswer);
		});
		//提交修改数据
		$('#dom_edit_entitySubjectanswer').bind('click', function() {
			submitFormSubjectanswer.postSubmit(submitEditActionSubjectanswer);
		});
		if (typeof $('#entity_pointweight').val() == "undefined"
				|| $('#entity_pointweight').val() == null
				|| $('#entity_pointweight').val() == "") {
			$('#entity_pointweight').val('1');
		}
	});
//-->
</script>