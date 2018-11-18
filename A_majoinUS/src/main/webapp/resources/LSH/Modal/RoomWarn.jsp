<%@ page language="java" contentType="text/html; charset=UTF-8"%>
		    <!-- 멤버선택 경고  -->
			<div class="modal fade check_modal" id="modal-warn">
		     <div class="modal-dialog modal-sm">
		    	<div class="modal-content">
		            
		        	<div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title"></h4>
		    		</div>
		              
		        	<div class="modal-body text-center">
						<p>멤버를 선택하세요</p>
						<hr>
						<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
		           	</div>
	            </div>
		     </div>
	        </div>
	        
		    <!-- 밴회원 위임경고  -->
			<div class="modal fade check_modal" id="modal-ban">
		     <div class="modal-dialog modal-sm">
		    	<div class="modal-content">
		            
		        	<div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title"></h4>
		    		</div>
		              
		        	<div class="modal-body text-center">
						<p>차단된 회원은 위임할 수 없습니다</p>
						<hr>
						<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
		           	</div>
	            </div>
		     </div>
	        </div>