<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title>상세보기</title>
<script>
	function check() {
		if (confirm("삭제하시겠습니까?")) {
			alert('삭제되었습니다');
			document.location.href = 'qna_delete?num=${qna.qna_num}';
		} else {
			alert("글목록으로 돌아갑니다.")
			document.location.href = 'qna';
		}
	}
</script>
</head>

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title">Notice</h4>
	</div>

<form>
	<table class="table">
		<tr>
			<td>글번호</td>
			<td><input class="form-control" id="q_number" name="q_number"
				readonly="readonly" value="${qna.qna_num}"></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea class="form-control" id="content"
					readonly="readonly">${qna.q_content}</textarea></td>
		</tr>


		<div class="box box-default">
			<div class="box-header with-border">
				<h4>
					찾으시는 내용이 없으시다면 <a href="inquiry_user">1:1문의</a>로 문의 부탁드립니다.
				</h4>
			</div>
		</div>
	</table>

	<div class="modal-footer">

		<%-- 	<c:if test="${!empty sessionScope.id}">
			<c:if test="${sessionScope.id eq 'amajoinus@gmail.com'}">
	  <input type="button" value="글수정" class="btn btn-warning pull-left"
	        onclick="document.location.href='qna_update?num=${qna.qna_num}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" class="btn btn-danger pull-left"
	       onclick="document.location.href='delete?num=${notice.notice_num}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;  
	   </c:if>
	   </c:if>  --%>


		<c:if test="${sessionScope.id eq 'amajoinus@gmail.com'}">
			<input type="button" value="글수정" class="btn btn-warning pull-left"
				class="btn btn-primary"
				onclick="document.location.href='qna_update?num=${qna.qna_num}'">
	         
	   &nbsp;&nbsp;&nbsp;&nbsp;  
	  <input type="button" value="글삭제" class="btn btn-danger pull-left"
				onclick="check();">
		</c:if>
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-success"
			id="submit" value="확인" onclick="history.go(0)">
	</div>

</form>
</body>



</html>