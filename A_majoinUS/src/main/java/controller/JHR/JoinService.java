package controller.JHR;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.JHR.MemberDTO;


public interface JoinService {
	
	//회원가입
	public void register(MemberDTO dto);
	//카테고리
	public List<String> getLevel1(String col);

	public List<String> getLevel2(String col);
	//아이디찾기
	public MemberDTO findId(MemberDTO dto);
	//비밀번호 찾기
	public MemberDTO findPw(MemberDTO dto);
	//비밀번호 업데이트
	public void memberUpdate(String id, String string, String password);

}
