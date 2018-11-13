package controller.JHR;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.JHR;
import controller.JHR.MemberDTO;

@Service
public class loginServiceImpl implements loginService{
	
	@Autowired
	JHR dao;
	
	//회원 로그인 확인
	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result = dao.loginCheck(dto);

		/*if(result) {//true 일 경우 세션에 등록		//세션이 안먹는다
			MemberDTO member=checkMember(dto);
			//세션 변수 등록
			session.setAttribute("id", member.getId());
			session.setAttribute("name", member.getName());
		}*/
		return result;
	}
	//회원 로그인 정보
	@Override
	public MemberDTO checkMember(MemberDTO dto) {
		return dao.checkMember(dto);
	}
	//회원 로그아웃 정보
	@Override
	public void logout(HttpSession session) {
		//세션변수 개별 삭제
		//session.removeAttribute("id");
		//세션 정보를 초기화 시킴
		session.invalidate();
	}
	@Override
	public MemberDTO mypage(String id) {
		return dao.mypage(id);
	}
	//카테고리
	public List<String> getLevel1(String col){
		List<String> list = null;
		
		try {
			list = dao.getCategory1("JHR_AUS.select1",col);
		}catch (Exception e) {
			System.out.println("[에러] Level1서비스실패 ::"+e.toString());
		}
		return list;
	}

	public List<String> getLevel2(String col){
		List<String> list = null;
		
		try {
			list = dao.getCategory1("JHR_AUS.select2",col);
		}catch (Exception e) {
			System.out.println("[에러] Level2서비스실패 ::"+e.toString());
		}
		return list;
	}
	@Override
	public boolean memberUpdate(MemberDTO dto) {
		return dao.memberUpdate(dto);
	}
	
	@Override
	public boolean checkPw(String id, String password) {
	return dao.checkPw(id, password);
	}
	
	@Override
	public void deleteSecession(String id) {
		dao.deleteSecession(id);
	}
	
}
