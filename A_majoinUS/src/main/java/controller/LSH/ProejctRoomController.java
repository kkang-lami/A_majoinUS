package controller.LSH;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.KMJ;

@Controller
@RequestMapping("/aus/ProejctRoom")
public class ProejctRoomController {
	
	private ProjectRoomService service;
	
	@Autowired
	private KMJ mj_dao;
	
	@Autowired	
	public void setService(ProjectRoomService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/Main")
	public String form(@RequestParam(value="pj_Num",defaultValue="0") int pageNum,Model model,HttpSession session) {
		System.out.println(pageNum+"[프로젝트룸 생성중]");
		String id= (String) session.getAttribute("id");
		

		int pjm_num = mj_dao.getpjm_num(pageNum, id);
		session.setAttribute("pjm_num", pjm_num);

		List<Map<String,Object>> list = service.getProgress(pageNum);

		String d_day = (String)list.get(0).get("d_day");
		
		if(Integer.parseInt(d_day) >= 0) {
			System.out.println("false");
			session.setAttribute("Dday", "FALSE");
		}else {
			System.out.println("true");
			session.setAttribute("Dday", "TRUE");
		}
		
		model.addAttribute("pj_num",pageNum);
		model.addAttribute("list", list);
		return "LSH/ProjectRoom";
	}
	
	@RequestMapping(value="/transfer")
	public String transfer(@RequestParam(value="id") String id,@RequestParam(value="pj_Num")int pj_Num) {
		System.out.println(id+"[팀장변경]"+pj_Num);
		
		int x = service.updateLeader(id, pj_Num);
		System.out.println("결과는? ::"+x);
		
		return "redirect:Main?pj_Num="+pj_Num;
	}
	
	@RequestMapping(value="/kick")
	public String kick(@RequestParam(value="pjm_num") int pjm_num,@RequestParam(value="pj_Num") int pj_Num) {
		System.out.println(pjm_num+"[강퇴]"+pj_Num);
		int x = service.kick(pjm_num);
		
		System.out.println("결과는? ::"+x);
		
		return "redirect:Main?pj_Num="+pj_Num;
	}
}