<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<style type="text/css">

body {
  font-family: 'Roboto', sans-serif;
  font-weight: 300;
  overflow-x: hidden;  
  overflow-y: auto;
}   
</style>    

  <aside class="main-sidebar">  
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <c:if test="${sessionScope.id ne 'amajoinus@gmail.com'}">
        <li class="header">MY PAGE</li>    
        <li class="active">
          <a href="<%=request.getContextPath()%>/aus/MyPageMain">
           <i class="fa fa-fw fa-thumb-tack"></i> <span>My Dashboard</span>
            
          </a>          
        </li>    
        
        <li>
          <a href="<%=request.getContextPath()%>/aus/projectList">      
            <i class="fa fa-fw fa-object-group"></i> <span>Project 관리</span>
          </a>
        </li>
        
         <li>
          <a href="<%=request.getContextPath()%>/aus/portfolioList">
            <i class="fa fa-fw fa-file-text"></i> <span>My Portfolio</span>
          </a>
        </li>
        
          <li class="treeview">
          <a href="#"><i class="fa fa-fw fa-star-half-o"></i>
            <span>Total Review</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">new</small>
              <!-- 밑에 원래 옆에 화살표 바 주석 풀면 나타남 대신 new 지워줄 것 
              <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>
          
          <ul class="treeview-menu">
            <li><a href="<%=request.getContextPath()%>/aus/reviewListForMe"><i class="fa fa-fw fa-hand-o-left"></i>review to me</a></li>
            <li><a href="<%=request.getContextPath()%>/aus/reviewListByMe"><i class="fa fa-fw fa-hand-o-right"></i> review from other</a></li>
          </ul>
        </li>
        
         <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-krw"></i>
            <span>My Point</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<%=request.getContextPath() %>/aus/buying"><i class="fa fa-fw fa-opencart"></i> Charge Point/Buy Ticket</a></li>
            <li><a href="<%=request.getContextPath() %>/aus/MyPoint"><i class="fa fa-spinner fa-spin fa-fw"></i>  My Point History</a></li>
          </ul>
        </li>    
      
        <li>
          <a href="<%=request.getContextPath()%>/aus/followList">
            <i class="fa fa-fw fa-users"></i> <span>My Friends</span>
          </a>
        </li>
        
        <li>
          <a href="<%=request.getContextPath()%>/aus/projectAlarm">
            <i class="fa fa-fw fa-paper-plane"></i><span>Invitation/Notification</span>
          </a>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-info"></i>
            <span>Supports</span>
            <span class="pull-right-container">    
              <!-- <i class="fa fa-angle-left pull-right"></i> -->
              <small class="label pull-right bg-red">3</small>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<%=request.getContextPath() %>/aus/notice"><i class="fa fa-fw fa-bullhorn"></i>notice</a></li>
            <small class="label pull-right bg-red">3</small>
            <li><a href="<%=request.getContextPath() %>/aus/qna"><i class="fa fa-fw fa-lightbulb-o"></i>F&Q</a></li>
            <li><a href="<%=request.getContextPath() %>/aus/inquiry_user"><i class="fa fa-fw fa-comments-o"></i>Talk to us</a></li>
          </ul>
        </li>      
        </c:if>
       <c:if test="${sessionScope.id eq 'amajoinus@gmail.com'}">
        
        <li class="header">Management</li>
        <li><a href="<%=request.getContextPath() %>/aus/ProjectManage"><i class="fa fa-fw fa-object-ungroup"></i> <span>Managing Projects</span></a></li>
        <li><a href="<%=request.getContextPath() %>/aus/CategoryManage"><i class="fa fa-fw fa-home"></i> <span>Managing Search-Category</span></a></li>
        <li><a href="<%=request.getContextPath() %>/aus/PaymentAjax"><i class="fa fa-fw fa-credit-card"></i> <span>Payment list</span></a></li>
        <li><a href="<%=request.getContextPath() %>/aus/review_admin"><i class="fa fa-fw fa-clipboard"></i> <span>Evaluation</span></a></li>
        <li><a href="<%=request.getContextPath() %>/aus/StaticManage"><i class="fa fa-fw fa-bar-chart"></i> <span>AUS Static</span></a></li>
           
        <li class="treeview">
          <a href="#">
              <i class="fa fa-cog fa-spin fa-fw"></i>      
            <span>Managing Supports</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
          </a>
          <ul class="treeview-menu">  
            <li><a href="<%=request.getContextPath() %>/aus/notice"><i class="fa fa-fw fa-bullhorn"></i>managing-notice</a></li>
            <li><a href="<%=request.getContextPath() %>/aus/qna"><i class="fa fa-fw fa-lightbulb-o"></i>managing-F&Q</a></li>
            <li><a href="<%=request.getContextPath() %>/aus/inquiry"><i class="fa fa-fw fa-comments-o"></i>managing-Talk to us</a></li>
          </ul>  
        
         <li class="treeview">    
          <a href="#">
            <i class="fa fa-fw fa-group"></i>
            <span>Member management</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<%=request.getContextPath() %>/aus/MemberManage"><i class="fa fa-fw fa-group"></i> Managing User</a></li>
            <li><a href="<%=request.getContextPath() %>/aus/issue_admin"><i class="fa fa-fw fa-ban"></i> Report management</a></li>

          </ul>
        </li>
    	</c:if>
      </ul>
	    
 
      
      <!-- /.sidebar-menu -->
    </section>
    
    <!-- /.sidebar -->
  </aside>  
  
