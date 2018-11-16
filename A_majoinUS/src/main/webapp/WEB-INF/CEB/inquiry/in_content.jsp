<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<title>상세보기</title>
</head>

<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Inquiry</h4>
              </div>
  
	<form>
		<table class="table">
			<tr>
				<td>글번호</td>
				<td><input class="form-control" 
					readonly="readonly" value="${inquiry.i_num}"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input class="form-control" 
					readonly="readonly" value="${inquiry.i_date}"></td>
			</tr>
			<tr>
				<td>상태</td>
				<td><input class="form-control" 
					readonly="readonly" value="${inquiry.i_state}"></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input class="form-control" 
					readonly="readonly" value="${inquiry.i_subject}"></td>
			</tr>
			<tr>  
				<td>글내용</td>
				<td><textarea class="form-control" 
					readonly="readonly" >${inquiry.i_content}</textarea>
				    </td>    
			</tr>    

			
			<div class="box box-default">
				<div class="box-header with-border">
					<h4>질의 하시기 전에<a href="notice">공지사항</a>과, <a href="qna">F&Q</a>에서 먼저 찾아주세요.</h4>
				</div>
			</div>
		</table>
    
		<div class="modal-footer">  
		
<%-- 	<c:if test="${!empty sessionScope.id}">
			<c:if test="${sessionScope.id eq 'amajoinus@gmail.com'}">
	  <input type="button" value="글수정" class="btn btn-warning pull-left"
	       onclick="document.location.href='update?num=${notice.notice_num}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" class="btn btn-danger pull-left"
	       onclick="document.location.href='delete?num=${notice.notice_num}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;    
	   </c:if>
	   </c:if>  --%>         
		  
	 
		  <c:if test="${sessionScope.id eq 'amajoinus@gmail.com'}">
	  <input type="button" value="답변하기" class="btn btn-warning pull-left" class="btn btn-primary"  onclick="document.location.href='in_update?num=${inquiry.i_num}'" >
	   </c:if>
	   &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-success" id="submit" value="확인" onclick="history.go(0)">
		</div>
      
	</form>  
	</body>



</html>