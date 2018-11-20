package controller.JHR;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import dao.JHR;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	private JHR dao;
	private JavaMailSender mailSender;
	
	//회원가입
	@Override
	public void register(MemberDTO dto)  {

		dao.register(dto);
		
		String id = dto.getId();
		String[] list = dto.getLocal();
		String[] list2 = dto.getJob();
		List<Map<String,Object>> job_list = new ArrayList<Map<String,Object>>();		
		List<Map<String,Object>> local_list = new ArrayList<Map<String,Object>>();		
		
		int fj_num = dao.fj_num_job();
		System.out.println("fj_num : "+ fj_num);
		if(list2 != null) {
			for(String st : list2) {
				fj_num++;
				Map<String,Object> temp = new HashMap<String,Object>();
				temp.put("fj_num", fj_num);
				temp.put("id", id);
				temp.put("f_job", st);
				job_list.add(temp);
				System.out.println(temp);
			}
			dao.insert_job(job_list);
		}
		
		
		int fl_num = dao.fl_num_local();
		System.out.println("fl_num : "+ fl_num);
		if(list != null) {
			for(String st : list) {
				fl_num++;
				Map<String,Object> temp = new HashMap<String,Object>();
				temp.put("fl_num", fl_num);
				temp.put("id", id);
				temp.put("f_local", st);
				local_list.add(temp);
				System.out.println(temp);
			}  
			dao.insert_local(local_list);
		}
		
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








