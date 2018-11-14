<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<script>    
function check(){
	if(confirm("삭제하시겠습니까?")){
		alert('삭제되었습니다');
		document.location.href='delete?num=${notice.notice_num}';
	}else {  
		alert("글목록으로 돌아갑니다.")
		document.location.href='notice';
	}
}    	

</script>  
<title>공지사항 상세보기 </title>
</head>    
      
  

  <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Notice</h4>
              </div>

	<form>
		<table class="table">
			<tr>
				<td>글번호</td>
				<td><input class="form-control" id="number" name="number"
					readonly="readonly" value="${notice.notice_num}"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input class="form-control" id="date" name="date"
					readonly="readonly" value="${notice.notice_date}"></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input class="form-control" id="subject"
					readonly="readonly" value="${notice.subject}"></td>
			</tr>
			<tr>  
				<td>글내용</td>
				<td><textarea class="form-control" id="content" 
					readonly="readonly" >${notice.content}</textarea>
				    </td>    
			</tr>    

			
			<div class="box box-default">
				<div class="box-header with-border">
					<h4>찾으시는 내용이 없으시다면 <a href="qna">F&Q</a>에서 찾아주세요.</h4>
				</div>
			</div>
		</table>
    
    
    <div class="modal" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
    	<div class="modal-dialog modal-lg">
          <div class="modal-content">  
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">Modal 2</h4>
            </div><div class="container"></div>
            <div class="modal-body">
              Content for the dialog / modal goes here.
              <br>  
              <br>
              <p>come content</p>  
              <br>
              <br>
              <br>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Save changes</a>
            </div>
          </div>
        </div>
    </div>
     
    
    
    
    
    

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
	  <input type="button" value="글수정" class="btn btn-warning pull-left" 
	   class="btn btn-primary"  onclick="document.location.href='update?num=${notice.notice_num}'" >
	         
	   &nbsp;&nbsp;&nbsp;&nbsp;  
	  <input type="button" value="글삭제" class="btn btn-danger pull-left"
	       onclick="check();">
	       </c:if>
	   &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-success" id="submit"
				value="Cancel" onclick="history.go(0)">
		</div>
      
	</form>    
	</body>
	
  


</html>