<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<body>
<h2>Hello World!</h2>
<c:set var="userId" value="test.amajo@gmail.com" scope="session"/>
<%-- <% 
	response.sendRedirect("aus/LSH/SearchUserForm");
%>   --%>                         
<a href="aus/LSH/SearchUserForm">팀원검색</a>
<a href="aus/LSH/Team/SearchTeamForm">팀검색</a>
<a href="aus/LSH/ProejctRoom/Main?pj_Num=88">프로젝트룸</a>

<a data-toggle="modal" href="#myModal" class="btn btn-primary">Launch modal</a>

<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
        
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Modal 1</h4>
            </div>
            <div class="container"></div>
            <div class="modal-body">Content for the dialog / modal goes here.
                <br>
                <br>
                <br>
                <a data-toggle="modal" href="#myModal2" class="btn btn-primary">Launch modal</a>

            </div>
            <div class="modal-footer">	<a href="#" data-dismiss="modal" class="btn">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal2">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                	<h4 class="modal-title">Modal 2</h4>
            </div>
            <div class="modal-body">Content for the dialog / modal goes here.

            </div>
            <div class="modal-footer">	<a href="#" data-dismiss="modal" class="btn">Close</a>
	<a href="#" class="btn btn-primary">Save changes</a>

            </div>
        </div>
    </div>
</div>


<div class="collapse" id="collapseExample">
    동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이 보전하세.
</div>
<p>
  <a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    href 링크
  </a>
</p>


<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script>
$(document).ready(function () {

    $('#openBtn').click(function () {
        $('#myModal').modal({
            show: true
        })
    });

   $(document).on('show.bs.modal', '.modal', function (event) {
       var zIndex = 1040 + (10 * $('.modal:visible').length);
       $(this).css('z-index', zIndex);
       setTimeout(function() {
           $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
       }, 0);
   });


});

</script>
</body>
</html>