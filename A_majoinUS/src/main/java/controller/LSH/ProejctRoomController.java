package controller.LSH;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/aus/LSH/ProejctRoom")
public class ProejctRoomController {
	
	public ProejctRoomController() {System.out.println("[공지]프로젝트룸 컨트롤러생성");}

	private ProjectRoomService service;
	
	@Autowired	
	public void setService(ProjectRoomService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/Main")
	public String form(@RequestParam(value="pj_Num",defaultValue="0") int pageNum,Model model) {
		System.out.println(pageNum+"[프로젝트룸 생성중]");
		
		List<Map<String,Object>> list = service.getProgress(pageNum);
		for(Map<String,Object> m : list) {
			System.out.println(m);
		}
		model.addAttribute("list", list);
		return "LSH/ProjectRoom";
	}
	
	@RequestMapping(value="/transfer")
	public String transfer(@RequestParam(value="id") String id,@RequestParam(value="pj_Num")String pj_Num) {
		System.out.println(id+"[팀장변경]"+pj_Num);
		
		return "redirect:Main?pj_Num="+pj_Num;
	}
	
	@RequestMapping(value="/kick")
	public String kick(@RequestParam(value="id") String id,@RequestParam(value="pj_Num")String pj_Num) {
		System.out.println(id+"[강퇴]"+pj_Num);
		

		return "redirect:Main?pj_Num="+pj_Num;
	}
	
}