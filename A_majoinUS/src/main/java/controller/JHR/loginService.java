package controller.JHR;

import javax.servlet.http.HttpSession;

public interface loginService {

	//로그인 체크
		public MemberDTO loginCheck(MemberDTO dto/*, HttpSession session*/);
		//로그인한 맴버보기
		public MemberDTO checkMember(MemberDTO dto);
		//로그아웃
		public void logout(HttpSession session);
		
		//정보 수정
		public MemberDTO mypage(String id);
		
		//정보 수정 업데이트
		public boolean memberUpdate(MemberDTO dto);
		//비번 체크
		public boolean checkPw(String id, String password); 
		//탈퇴
		public void deleteSecession(String id); 
		
	
	
}
