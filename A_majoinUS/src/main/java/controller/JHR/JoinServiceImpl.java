package controller.JHR;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import dao.JHR;
import controller.JHR.MemberDTO;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	private JHR dao;
	private JavaMailSender mailSender;
	
	//회원가입
	@Override
	public void register(MemberDTO dto)  {
		dao.register(dto);
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
	
	//아이디 찾기
	@Override
	public MemberDTO findId(MemberDTO dto) {
		return dao.findId(dto);
	}
	//비밀번호 찾기
	@Override
	public MemberDTO findPw(MemberDTO dto) {
		 return dao.findPw(dto);
	
	}
	//비밀번호 업데이트
	public void memberUpdate(String id, String string, String password) {
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPassword(password);
		dao.updatePW(dto);		
	}


}








