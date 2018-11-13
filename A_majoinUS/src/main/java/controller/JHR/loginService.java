package controller.JHR;

import java.util.List;

import javax.servlet.http.HttpSession;
import controller.JHR.MemberDTO;

public interface loginService {

	//로그인 체크
	public boolean loginCheck(MemberDTO dto, HttpSession session);
	//로그인한 맴버보기
	public MemberDTO checkMember(MemberDTO dto);
	//로그아웃
	public void logout(HttpSession session);
	
	//정보 수정
	public MemberDTO mypage(String id);
	//카테고리
	public List<String> getLevel1(String col);

	public List<String> getLevel2(String col);
	
	//정보 수정 업데이트
	public boolean memberUpdate(MemberDTO dto);
	//비번 체크
	public boolean checkPw(String id, String password); 
	//탈퇴
	public void deleteSecession(String id); 
	
	
	
}
