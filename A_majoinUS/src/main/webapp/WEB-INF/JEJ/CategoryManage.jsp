<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>카테고리 관리</title>
<script src="jquery-2.1.4.js" type="text/javascript"></script>
<script language="JavaScript">

function categoryUpdate(formName) {
	window.open("./updatecategory?c_2_num="+formName.c_2_num.value+"&cate_num="+formName.cate_num.value, "a", "width=500, height=400, left=100, top=50");
}  

function categoryDelete(formName) {
	var check = confirm("해당 카테고리를 삭제하시겠습니까?");
	if(check) {
		window.location.href = "./deleteCategory?c_2_num="+formName.c_2_num.value;
		alert("삭제되었습니다.");
	}
}

</script>
</head>
<body>
<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
<h1>
        카테고리 관리
        <small>프로젝트 매칭을 위한 카테고리를 관리합니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">MyPage</a></li>
        <li class="active">Category Manage</li>
      </ol>
    </section>
<!-- content 시작! -->


<!-- Main content -->
    <section class="content">		



<!--  -->
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Category</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">

                <table class="table no-margin">
                  <thead>
                  <tr>
	<th>카테고리명</th>
	<th>1차</th>
	<th>2차</th>
	<th></th>
                  </tr>
                  </thead>
                  <tbody>


<c:forEach items="${categoryList}" var="category" >
<tr>
	<td>${category.c_name}</td>
	<td>${category.c_1_name}</td>
	<td>${category.c_2_name}</td>
	<td>
	 <form name="category_12">
	<!--  <td> -->
	 	<input type="hidden" name="cate_num" value="${category.cate_num}" />
		<input type="hidden" name="cate_1_num" value="${category.cate_1_num}" />
		<input type="hidden" name="c_2_num" value="${category.c_2_num}" />
		<button type="button" class="btn btn-info btn-flat btn-sm" onclick="categoryUpdate(this.form)">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<!-- </td> -->
	<!-- <td> -->
		<button type="button" class="btn btn-default btn-flat btn-sm" onclick="categoryDelete(this.form)">삭제</button>
	<!-- </td> -->
	 </form>
	</td>
</tr>
</c:forEach>
</table>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           <!--  <div class="box-footer clearfix">
              <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
              <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
            </div> -->
            <!-- /.box-footer -->
          </div>
				
				
				
				
	</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />				
</body>
</html> --%>


<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>카테고리 관리</title>
<script src="jquery-2.1.4.js" type="text/javascript"></script>
<script language="JavaScript">

function categoryUpdate(formName) {
   window.open("./updatecategory?c_2_num="+formName.c_2_num.value+"&cate_num="+formName.cate_num.value, "a", "width=500, height=400, left=100, top=50");
}

function categoryDelete(formName) {
   var check = confirm("해당 카테고리를 삭제하시겠습니까?");
   if(check) {
      window.location.href = "./deleteCategory?c_2_num="+formName.c_2_num.value;
      alert("삭제되었습니다.");
   }
}

</script>
<style>
.row {
 width : 755px;
}

.wide {
   width : 650px;
}
</style>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">
            <!-- 들어갈 내용 -->
<h1>
        카테고리 관리
        <small>프로젝트 매칭을 위한 카테고리를 관리합니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">MyPage</a></li>
        <li class="active">Category Manage</li>
      </ol>
    </section>
<!-- content 시작! -->


<!-- Main content -->
    <section class="content">      



<!--  -->
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Category</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
              
              
              
<!--  -->              <!--  -->
<div class="row">
        <!-- /.col -->
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="fa fa-files-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">카테고리</span>
              <span class="info-box-number">직군</span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description">
                    ${cateSize}개의 카테고리
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>

<div class="col-md-6 col-sm-12 ">        
<table class="wide">
                  <thead>
                  <tr>
   <!-- <th>카테고리명</th>
   <th>&nbsp;</th> -->
   <th>1차 카테고리</th>
   <th>2차 카테고리</th>
   <th></th>
                  </tr>
                  </thead>
                  <tbody>


<c:forEach items="${categoryList}" var="category" >
<tr>
   <td>${category.c_name}</td>
   <td>&nbsp;</td>
   <td>${category.c_1_name}</td>
   <td>${category.c_2_name}</td>
   <td>
    <form name="category_12">
   <!--  <td> -->
       <input type="hidden" name="cate_num" value="${category.cate_num}" />
      <input type="hidden" name="cate_1_num" value="${category.cate_1_num}" />
      <input type="hidden" name="c_2_num" value="${category.c_2_num}" />
      <button type="button" class="btn btn-info btn-flat btn-sm" onclick="categoryUpdate(this.form)">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <!-- </td> -->
   <!-- <td> -->
      <button type="button" class="btn btn-default btn-flat btn-sm" onclick="categoryDelete(this.form)">삭제</button>
   <!-- </td> -->
    </form>
   </td>
</tr>
</c:forEach>
</tbody>
</table>        
</div>
        
</div>

<hr />
<div class="row">

        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon"><i class="fa fa-flag-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">카테고리</span>
              <span class="info-box-number">지역</span>

               <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div> 
                  <span class="progress-description">
                    ${cateSize1}개의 카테고리
                  </span>
            </div>
            
          </div>
          <!-- /.info-box -->
        </div>
        
        <div class="col-md-6">
        <table class="wide">
        <thead>   
                  <tr>
   <!-- <th>카테고리명</th>
   <th>&nbsp;</th> -->
   <th>1차 카테고리</th>
   <th>2차 카테고리</th>
   <th></th>
                  </tr>
                  </thead>
        
<c:forEach items="${categoryList1}" var="category" >
<tr>
   <td>${category.c_name}</td>
   <td>&nbsp;</td>
   <td>${category.c_1_name}</td>
   <td>${category.c_2_name}</td>
   <td>
    <form name="category_123">
   <!--  <td> -->
       <input type="hidden" name="cate_num" value="${category.cate_num}" />
      <input type="hidden" name="cate_1_num" value="${category.cate_1_num}" />
      <input type="hidden" name="c_2_num" value="${category.c_2_num}" />
      <button type="button" class="btn btn-info btn-flat btn-sm" onclick="categoryUpdate(this.form)">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <!-- </td> -->
   <!-- <td> -->
      <button type="button" class="btn btn-default btn-flat btn-sm" onclick="categoryDelete(this.form)">삭제</button>
   <!-- </td> -->
    </form>
   </td>
</tr>
</c:forEach>
</table>
</div>
</div>
<!--  -->      
              </div>
              <!-- /.table-responsive -->
            </div>
          </div>
            
            
            
            
   </section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />            
</body>
</html> --%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>카테고리 관리</title>
<script src="jquery-2.1.4.js" type="text/javascript"></script>
<script language="JavaScript">

function categoryUpdate(formName) {
   window.open("./updatecategory?c_2_num="+formName.c_2_num.value+"&cate_num="+formName.cate_num.value, "a", "width=500, height=400, left=100, top=50");
}

function categoryDelete(formName) {
   var check = confirm("해당 카테고리를 삭제하시겠습니까?");
   if(check) {
      window.location.href = "./deleteCategory?c_2_num="+formName.c_2_num.value;
      alert("삭제되었습니다.");
   }
}

</script>
<style>
.row {
 width : 755px;
}

.wide {
   width : 650px;
}

</style>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">
            <!-- 들어갈 내용 -->
<h1>   
        카테고리 관리
        <small>프로젝트 매칭을 위한 카테고리를 관리합니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">MyPage</a></li>
        <li class="active">Category Manage</li>
      </ol>
    </section>
<!-- content 시작! -->


<!-- Main content -->
    <section class="content">      



<!--  -->
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Category</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
              
              
              
<!--  -->              <!--  -->
<div class="row">
        <!-- /.col -->
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="fa fa-files-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">카테고리</span>
              <span class="info-box-number">직군</span>

              <div class="progress">
                <div class="progress-bar progress-bars" style="width: 100%"></div>
              </div>
                  <span class="progress-description">
                    ${cateSize}개의 카테고리
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>

<div class="col-md-6 col-sm-12 ">        
<table class="wide" style="width: 1000px;">
                  <thead>
                  <tr>
   <!-- <th>카테고리명</th>
   <th>&nbsp;</th> -->
   <th>1차 카테고리</th>
   <th>2차 카테고리</th>
   <th></th>
                  </tr>
                  </thead>
                  <tbody>


<c:forEach items="${categoryList}" var="category" >
<tr>
   <%-- <td>${category.c_name}</td>
   <td>&nbsp;</td> --%>
   <td>${category.c_1_name}</td>
   <td>${category.c_2_name}</td>
   <td>
    <form name="category_12">
   <!--  <td> -->
       <input type="hidden" name="cate_num" value="${category.cate_num}" />
      <input type="hidden" name="cate_1_num" value="${category.cate_1_num}" />
      <input type="hidden" name="c_2_num" value="${category.c_2_num}" />
      <button type="button" class="btn btn-info btn-flat btn-sm noman" onclick="categoryUpdate(this.form)">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <!-- </td> -->
   <!-- <td> -->
      <button type="button" class="btn btn-default btn-flat btn-sm noman" onclick="categoryDelete(this.form)">삭제</button>
   <!-- </td> -->
    </form>
   </td>
</tr>
</c:forEach>
</tbody>
</table>        
</div>
        
</div>

<hr />
<div class="row">

        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon"><i class="fa fa-flag-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">카테고리</span>
              <span class="info-box-number">지역</span>

               <div class="progress">
                <div class="progress-bar progress-bars" style="width: 100%"></div>
              </div> 
                  <span class="progress-description">
                    ${cateSize1}개의 카테고리
                  </span>
            </div>
            
          </div>
          <!-- /.info-box -->
        </div>
        
        <div class="col-md-6">
        <table class="wide" style="width: 1000px;">
        <thead>   
                  <tr>
   <!-- <th>카테고리명</th>
   <th>&nbsp;</th> -->
   <th>1차 카테고리</th>
   <th>2차 카테고리</th>
   <th></th>
   <th></th>
                  </tr>
                  </thead>
        
<c:forEach items="${categoryList1}" var="category" >
<tr>
   <%-- <td>${category.c_name}</td>
   <td>&nbsp;</td> --%>
   <td>${category.c_1_name}</td>
   <td>${category.c_2_name}</td>
   <td></td>
   <td>
    <form name="category_123">
   <!--  <td> -->
       <input type="hidden" name="cate_num" value="${category.cate_num}" />
      <input type="hidden" name="cate_1_num" value="${category.cate_1_num}" />
      <input type="hidden" name="c_2_num" value="${category.c_2_num}" />
      <button type="button" class="btn btn-info btn-flat btn-sm" onclick="categoryUpdate(this.form)">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <!-- </td> -->
   <!-- <td> -->
      <button type="button" class="btn btn-default btn-flat btn-sm" onclick="categoryDelete(this.form)">삭제</button>
   <!-- </td> -->
    </form>
   </td>
</tr>
</c:forEach>
</table>
</div>
</div>
<!--  -->      
              </div>
              <!-- /.table-responsive -->
            </div>
          </div>
            
            
            
            
   </section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />            
</body>
</html>