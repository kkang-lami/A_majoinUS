package controller.JHR;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.JHR;

@Service
public class loginServiceImpl implements loginService{
	
	@Autowired
	JHR dao;
	
	//회원 로그인 확인
	@Override
	public MemberDTO loginCheck(MemberDTO dto/*, HttpSession session*/) {
		boolean result = dao.loginCheck(dto);
		MemberDTO member; 
		if(result) {//true 일 경우 세션에 등록		//세션이 안먹는다
			member=checkMember(dto);
			//세션 변수 등록
		//	session.setAttribute("id", member.getId());
		//	session.setAttribute("name", member.getName());
		}else {
			return null;
		}
		return member;
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
		MemberDTO dto = dao.mypage(id);
		List<String> st = dao.my_location(dto.getId());
		List<String> st2 = dao.my_job(dto.getId());
		dto.setLocal(st.toArray(new String[st.size()]));
		dto.setJob(st2.toArray(new String[st2.size()]));

		return dto;
	}
	/*//카테고리
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
	}*/
	@Override
	public boolean memberUpdate(MemberDTO dto) {
		
		String id = dto.getId();
		dao.delete_job(id);
		dao.delete_location(id);
		if(dto.getLocal() != null) {
			String[] list = dto.getLocal();
			List<Map<String,Object>> local_list = new ArrayList<Map<String,Object>>();	
			
			for(String st : list) {
				Map<String,Object> temp = new HashMap<String,Object>();
				temp.put("id", id);
				temp.put("f_local", st);
				local_list.add(temp);
			}
			dao.insert_local(local_list);
		
			System.out.println("로컬"+local_list);
		}
		if(dto.getJob() != null) {
			String[] list2 = dto.getJob();
			List<Map<String,Object>> job_list = new ArrayList<Map<String,Object>>();	
			
			for(String st : list2) {
				Map<String,Object> temp = new HashMap<String,Object>();
				temp.put("id", id);
				temp.put("f_job", st);
				job_list.add(temp);
			}
			dao.insert_job(job_list);
			
			
			System.out.println("잡"+job_list);
		}
		//List<Map<String,Object>> job_list = new ArrayList<Map<String,Object>>();	

		
		//List<Map<String,Object>> local_list = new ArrayList<Map<String,Object>>();	
		
	
		/*for(String st : list) {
			Map<String,Object> temp = new HashMap<String,Object>();
			temp.put("id", id);
			temp.put("f_local", st);
			local_list.add(temp);
		}
		dao.insert_local(local_list);
	
		System.out.println("로컬"+local_list);*/
		
		
		/*for(String st : list2) {
			Map<String,Object> temp = new HashMap<String,Object>();
			temp.put("id", id);
			temp.put("f_job", st);
			job_list.add(temp);
		}
		dao.insert_job(job_list);
		
		
		System.out.println("잡"+job_list);*/
		
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
