<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 장바구니 모달 -->
<div class="modal fade" id="modal_cart">
	          <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	            
	            	<!-- 장바구니 헤더 -->
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title">프로젝트 스크랩</h4>
		            </div>
		        	
		        	<!-- 장바구니 목록 -->
		           	<div class="modal-body">
						<div class="box box-primary">
							<div class="box-header with-border"><strong>스크랩 목록</strong><small id="cart_len">(${fn:length(cart)})</small></div>

							<div class="box-body">
								<table id="cart_table" class="table table-hover text-center">
									<tr>
										<th colspan="2">모집정보</th>
										<th>프로젝트 기간</th>
									</tr>
									
									<c:if test="${fn:length(cart) < 1}">
									<tr><td colspan="7" class="none"><strong>스크랩한 프로젝트가 없습니다</strong></td></tr>
									</c:if>
			
									<c:forEach var="item" items="${cart}">
									<tr id="${item.pj_num}">
										<td><a href="#" id="star_btn" class="star"><i class="fa fa-fw fa-star text-yellow"></i></a></td>
										<td><a href="#" class="Team_btn" data-toggle='modal' data-target='#modal_Team'>${item.pj_name}</a></td>
										<td>${item.start_d} ~ ${item.end_d}</td>
									</tr>
									</c:forEach>
								</table>
							</div>
			        	</div>
	            	</div>
	            	
	            	
	            </div>
	          </div>
</div>