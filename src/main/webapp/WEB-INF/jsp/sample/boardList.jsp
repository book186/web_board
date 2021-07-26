<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
	<body>
		<h2>
			<a href="test.jsp" onclick="window.open(this.href, '_blank', 'width=500px, height=500px, toolbars=no, scrollbars=no'); return false;">게시판 목록</a>
		</h2>

		<table class="board_list">
			<colgroup>
				<col width="10%" />
				<col width="*" />
				<col width="15%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<!-- 전자정부프레임워크 페이지네이션 -->
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach var="row" items="${list}" varStatus="status">
							<tr>
								<td>${row.IDX }</td>
								<td class="title"><a href="#this" name="title">${row.TITLE }</a>
									<input type="hidden" id="IDX" value="${row.IDX }"></td>
								<td>${row.HIT_CNT }</td>
								<td>${row.CREA_DTM }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>

			<!-- jQuery & Ajax 페이지네이션 -->
			<!--
			<tbody></tbody>
			-->
		</table>

		<!-- 전자정부프레임워크 페이지네이션 -->
		<c:if test="${not empty paginationInfo}">
			<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="fn_search" />
		</c:if>
	
		<input type="hidden" id="currentPageNo" name="currentPageNo" />
		<br/>

		<!-- jQuery & Ajax 페이지네이션 -->
		<!--
		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
		<br/>
		-->
		
		<a href="#this" class="btn" id="write">글쓰기</a>
	
		<%@ include file="/WEB-INF/include/include-body.jspf"%>
		<script type="text/javascript">
			$(document).ready(function( ){
				<!-- jQuery & Ajax 페이지네이션 -->
				//fn_selectBoardList(1);

				$("#write").on("click", function(e) { //글쓰기 버튼
					e.preventDefault();
					fn_openBoardWrite();
				});
	
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			});
	
			function fn_openBoardWrite() {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
				comSubmit.submit();
			}

			function fn_openBoardDetail(obj) {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
				comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
				comSubmit.submit();
			}
			<!-- 전자정부프레임워크 페이지네이션 -->
			function fn_search(pageNo) {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
				comSubmit.addParam("currentPageNo", pageNo);
				comSubmit.submit();
			}

			<!-- jQuery & Ajax 페이지네이션 -->
			<!--
			function fn_selectBoardList(pageNo ){
				var comAjax = new ComAjax();
				comAjax.setUrl("<c:url value='/sample/selectBoardList.do' />");
				comAjax.setCallback("fn_selectBoardListCallback");
				comAjax.addParam("PAGE_INDEX",pageNo);
				comAjax.addParam("PAGE_ROW", 15);
				comAjax.ajax();
			}

			function fn_selectBoardListCallback(data) {
				var total = data.TOTAL;
				var body = $("table>tbody");
				body.empty();

				if(total == 0) {
					var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>";
					body.append(str);
				} else {
					var params = { divId : "PAGE_NAVI", pageIndex : "PAGE_INDEX", totalCount : total, eventName : "fn_selectBoardList" };
					gfn_renderPaging(params); var str = "";
					$.each(data.list, function(key, value) {
						str += "<tr>" + "<td>" + value.IDX + "</td>" + "<td class='title'>" + "<a href='#this' name='title'>" + value.TITLE 
							+ "</a>" + "<input type='hidden' name='title' value=" + value.IDX + ">" + "</td>" + "<td>" 
							+ value.HIT_CNT + "</td>" + "<td>" + value.CREA_DTM + "</td>" + "</tr>"; }); 
						body.append(str);
						$("a[name='title']").on("click", function(e) { //제목
							e.preventDefault();
							fn_openBoardDetail($(this));
						});
				}
			}
			-->
		</script>
	</body>
</html>