<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<title>글목록 보여주기</title>
</head>
	
	
<body>
<tiles:insertDefinition name="header" />
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
	<div align="center">
	
		<b>내가 한 질문 목록(전체 글 : ${count})</b>
	</div>
	<br>
	<table width="700" align="center">
		<tr>
			<td align="right" >
				<a href="in_writeForm">글쓰기</a>
			</td>
		</tr>  
	</table>
	<c:set var="no" value="1" /> 
	
	<c:if test="${count == 0}">
		<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
			<tr height="30">
				<td align="center" width="50">번호</td>
				<td align="center" width="250">제목</td>
				<td align="center" width="250">작성일</td>
				<td align="center" width="50">상태</td>
			</tr>			
			<tr>
				<td colspan="5" align="center">
					게시판에 저장된 글이 없습니다.
				</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test="${count > 0}">
		<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
			<tr height="30">
				<td align="center" width="50">번호</td>
				<td align="center" width="250">제목</td>
				<td align="center" width="250">작성일</td>
				<td align="center" width="50">상태</td>
			</tr>
			
			<c:forEach var="inquiry" items="${inquiryList}">
				<tr height="30">
					<td align="center" width="50">
						<c:out value="${no}" />
					</td>
					
					<td width="250">				
						<a href="in_content?num=${inquiry.i_num }&pageNum=${currentPage}">${inquiry.i_subject}</a>
					</td>
					
					<td align="center" width="250">
						${inquiry.i_date}
					</td>  
					<td align="center" width="250">
						${inquiry.i_state}
					</td> 
					
					<c:set var="no" value="${no+1}" />
				</tr>
			</c:forEach>			
		</table>
	</c:if>
	<br>
	<div align="center">
		<c:if test="${count > 0}">
		   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
		   <!-- pageCount:11 -->
		   <c:set var="pageBlock" value="${10}"/>
		   <!-- pageBlock:10 -->
		   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
		   <!-- result:0 -->   
		   <c:set var="startPage" value="${result * 10 + 1}" />
		   <!-- startPage:1 -->
		   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
		   <!-- endPage:10 -->
		   <c:if test="${endPage > pageCount}">
		        <c:set var="endPage" value="${pageCount}"/>
		        <!-- endPage:10 -->
		   </c:if>
		         
		   <c:if test="${startPage > 10}">
		       <c:if test="${search1 != 1 }">
		   	   		<a href="inquiry?pageNum=${startPage - 10 }">[이전]</a>
		   	   </c:if>
		   	   <c:if test="${search1 == 1 }">
		   	   		<a href="inquiry?pageNum=${startPage - 10 }&search=${search}&string=${string}">[이전]</a>
		   	   </c:if>	
		   </c:if>
		
		   <c:forEach var="i" begin="${startPage}" end="${endPage}">
		   	   <c:if test="${search1 != 1 }">
		   	   		<a href="inquiry?pageNum=${i}">[${i}]</a>
		   	   </c:if>
		   	   <c:if test="${search1 == 1 }">
		   	   		<a href="inquiry?pageNum=${i}&search=${search}&string=${string}">[${i}]</a>
		   	   </c:if>				   	   
		   </c:forEach>
		
		   <c:if test="${endPage < pageCount}">
		   	   <c:if test="${search1 != 1 }">
		   	   		<a href="inquiry?pageNum=${startPage + 10}">[다음]</a>
		   	   </c:if>
		   	   <c:if test="${search1 == 1 }">
		   	   		<a href="inquiry?pageNum=${startPage + 10 }&search=${search}&string=${string}">[이후]</a>
		   	   </c:if>
		   </c:if>
		</c:if>	
	</div>
	
	<br>
	<div align="center">
		<form >
		    <select name="string">
		          <option value="subject">제목</option>
		          <option value="content">내용</option>
		    </select>
		         <input type="text" size="15" maxlength="50" name="search"/>&nbsp;
		         <input type="submit" value="검색"/>
		         <input type="button" value="글목록" onclick="document.location.href='inquiry'">
		</form>
	</div>
			
			</section>
		</div>
	</div>
	
</body>

<tiles:insertDefinition name="left" />
<tiles:insertDefinition name="footer" />
</html>