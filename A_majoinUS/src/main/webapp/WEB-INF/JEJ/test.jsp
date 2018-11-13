<%@ page contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored = "false" %>
<html>
<head>
<title>Insert title here</title>
<style>
#hey {
	weight : 100px;

}
</style>
</head>
<body>
	
	<div align="center">
		<form >
		    <select name="string">
		          <option value="writer">작성자</option>
		          <option value="subject">제목</option>
		          <option value="content">내용</option>
		    </select>
		         <input type="text" size="15" maxlength="50" name="search"/>&nbsp;
		         <input type="submit" value="검색"/>
		         <input type="button" value="글목록" onclick="document.location.href='board.do'">
		</form>
	</div>
	
	
	<div class="box">
            <div class="box-header">
              <h3 class="box-title">Button Addon</h3>
            </div>
            <div class="box-body">
              <p>With dropdown</p>

              <div class="input-group margin">
                <div class="input-group-btn">
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Action
                    <span class="fa fa-caret-down"></span></button>
                  <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
                <!-- /btn-group -->
                <input type="text" class="form-control" id="hey" >
              </div>
</div>
</div>
	
	
</body>

</body>
</html>