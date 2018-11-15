package controller.JHR;

public interface JoinService {
	
	//회원가입
		public void register(MemberDTO dto);
		//아이디찾기
		public MemberDTO findId(MemberDTO dto);
		//비밀번호 찾기
		public MemberDTO findPw(MemberDTO dto);
		//비밀번호 업데이트
		public void memberUpdate(String id, String string, String password);

}
