<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%><%@ taglib
	uri="/view/conf/tip.tld" prefix="TIP"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>答题卡- <PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<link href="view/web-simple/paper/text/card.css" rel="stylesheet">
<script charset="utf-8"
	src="<PF:basePath/>text/lib/codemirror/codemirror.min.js"></script>
<link href="<PF:basePath/>text/lib/codemirror/codemirror.css"
	rel="stylesheet">
</head>
<body oncontextmenu="return false" onselectstart="return false">
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<!-- /.carousel -->
	<div class="containerbox">
		<div
			style="background-color: #ffffff; border-bottom: 1px solid #cccccc;">
			<div class="container" style="padding: 4px;">
				<div class="col-xs-9" style="padding: 4px;">
					<div style="text-align: center;">
						<!-- 卷头部 -->
						<h1>
							<c:if test="${empty paper.roomPaper.name}">${paper.info.name}</c:if>
							<c:if test="${not empty paper.roomPaper.name}">${paper.roomPaper.name}</c:if>
						</h1>
						<span style="font-weight: 700;">共${paper.rootChapterNum}道大题，${paper.subjectNum}道小题，满分${paper.allPoint}分</span>
						<span style="font-weight: 700;"><br />答题时间<span
							class="wts-red">${room.timelen}分钟</span>,答题人: <c:if
								test="${room.writetype=='2'}">
								<span class="wts-red">匿名</span>
							</c:if> <c:if test="${room.writetype!='2'}">
								<span class="wts-red">${USEROBJ.name}</span>
							</c:if> </span>
						<c:if test="${!empty paper.info.papernote}">
							<div class="ke-content ke-content-borderbox"
								style="border-top: 1px dashed #cccccc; margin-top: 20x; padding-top: 20px;">${paper.info.papernote}</div>
						</c:if>
						<input type="hidden" id="roomId-Input" value="${room.id}">
						<input type="hidden" id="paperId-Input" value="${paper.info.id}">
						<input type="hidden" id="cardId-Input" value="${card.id}">
					</div>
					<div class="wts-paper-forms">
						<c:forEach items="${paper.chapters}" var="chapter1">
							<div class="chapterBox">
								<!-- 一级章節头部 -->
								<h2 id='${chapter1.chapter.id}-NAVI'>${chapter1.chapter.name}<span
										class="chapter-info">共${chapter1.subjectNum}道小题，${chapter1.allpoint}分</span>
								</h2>
								<c:if test="${not empty chapter1.chapter.textnote}">
									<div class="chapter-note ke-content ke-content-borderbox">${chapter1.chapter.textnote}</div>
								</c:if>
								<c:if test="${not empty chapter1.materials}">
									<c:forEach items="${chapter1.materials}" var="material">
										<div class="chapter-material">
											<div class="chapter-material-title">${material.title}</div>
											<div class="ke-content ke-content-borderbox">
												<TIP:InitHtmlContentTag html="${material.text}"></TIP:InitHtmlContentTag>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<%@ include file="commons/IncludeLeve1Subjects.jsp"%>
								<c:forEach items="${chapter1.chapters}" var="chapter2">
									<div>
										<!-- 二级章節头部 -->
										<h3 id='${chapter2.chapter.id}-NAVI'>${chapter2.chapter.name}<span
												class="chapter-info">共${chapter2.subjectNum}道小题，${chapter2.allpoint}分</span>
										</h3>
									</div>
									<c:if test="${not empty chapter2.chapter.textnote}">
										<div class="chapter-note ke-content ke-content-borderbox">${chapter2.chapter.textnote}</div>
									</c:if>
									<c:if test="${not empty chapter2.materials}">
										<c:forEach items="${chapter2.materials}" var="material">
											<div class="chapter-material">
												<div class="chapter-material-title">${material.title}</div>
												<div class="ke-content ke-content-borderbox">
													<TIP:InitHtmlContentTag html="${material.text}"></TIP:InitHtmlContentTag>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<%@ include file="commons/IncludeLeve2Subjects.jsp"%>
									<c:forEach items="${chapter2.chapters}" var="chapter3">
										<div>
											<!-- 二级章節头部 -->
											<h4 id='${chapter3.chapter.id}-NAVI'>${chapter3.chapter.name}<span
													class="chapter-info">共${chapter3.subjectNum}道小题，${chapter3.allpoint}分</span>
											</h4>
										</div>
										<c:if test="${not empty chapter3.chapter.textnote}">
											<div class="chapter-note ke-content ke-content-borderbox">${chapter3.chapter.textnote}</div>
										</c:if>
										<c:if test="${not empty chapter3.materials}">
											<c:forEach items="${chapter3.materials}" var="material">
												<div class="chapter-material">
													<div class="chapter-material-title">${material.title}</div>
													<div class="ke-content ke-content-borderbox">
														<TIP:InitHtmlContentTag html="${material.text}"></TIP:InitHtmlContentTag>
													</div>
												</div>
											</c:forEach>
										</c:if>
										<%@ include file="commons/IncludeLeve3Subjects.jsp"%>
									</c:forEach>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-xs-3">
					<jsp:include page="commons/IncludeSideCard.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${flag=='learn' }">
		<jsp:include page="../adjudge/commons/includeSubjectInfoWin.jsp"></jsp:include>
	</c:if>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<script src="view/web-simple/paper/text/card.js"></script>
	<script type="text/javascript">
	$(function() {
		//加载问答题编辑器
		$('.interlocutionInput').each(function(i, obj) {
			var editor = CodeMirror.fromTextArea(obj, {
				lineNumbers : true,
				lineNumberFormatter : function(num) {
					if (num == 1) {
						return "答:"
					}
					return num;
				}
			});
			editor.on("blur", function(Editor, changes) {
				$(obj).val(editor.getValue());
				$(obj).change()
			});
			editor.setSize('auto', '150px');
		});
	});
</script>
</body>
</html>