/*package controller.JHR;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.JHR;
import project.DTO.MemberDTO;

@Service
public class FindIDService {
	
	@Autowired
	private JHR dao;
	
	public ArrayList<String> findId(MemberDTO dto) throws Exception {
		
		logger.info("이메일 찾기 service 진입");
		List<MemberDTO> list = JHR.findId(dto);
		ArrayList<String> findId = new ArrayList<String>();  
		for(int i =0; i <list.size(); i ++) {
			String email = list.get(i).getEmail();
			findId.add(email);

		}
		return findId;
	}
}
*/