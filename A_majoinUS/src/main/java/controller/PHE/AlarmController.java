package controller.PHE;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.PHE;
import project.DTO.AlarmDTO;

@Controller
@RequestMapping(value = "/aus/PHE")
public class AlarmController {
	@Autowired
	PHE dao;

	public void setDao(PHE dao) {
		this.dao = dao;
	}
	
	/************************* 프로젝트 알림 ************************/
	@RequestMapping(value = "/projectAlarmList")
	public ModelAndView projectAlarmList(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession(true);
		String sessionId =(String)session.getAttribute("userId");			
		
		List<AlarmDTO> projectAlarmList = dao.getProjectAlarmList(sessionId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/projectAlarmList");
		mav.addObject("projectAlarmList", projectAlarmList);

		return mav;
	}

	
	// 참가신청 리스트
	@RequestMapping(value = "/projectAlarm")
	public ModelAndView projectApplyAlarm(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession(true);
		String receiver =(String)session.getAttribute("userId");	
		
		String a_type = "참가";
		List<AlarmDTO> projectApplyAlarm = dao.getProjectApplyAlarm(receiver, a_type);
		
		a_type="초대";
		List<AlarmDTO> projectProposalAlarm = dao.getProjectApplyAlarm(receiver, a_type);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/projectAlarm");
		mav.addObject("projectApplyAlarm", projectApplyAlarm);
		mav.addObject("projectProposalAlarm", projectProposalAlarm);

		return mav;
	}
	
	
	@RequestMapping(value = "/accetpMember")
	// method = { RequestMethod.GET, RequestMethod.POST }
	public String acceptMember(@ModelAttribute("projectApplyAlarm") AlarmDTO dto,
			@RequestParam("pj_num") int pj_num, @RequestParam("sender") String sender, String a_type) 
	{
		dao.acceptMember(sender, pj_num);
		dao.removeFromAlarm_apply(sender, pj_num);
		System.out.println("sender : " + sender);
		System.out.println("pj_num : " + pj_num);
		System.out.println("a_type : " + a_type);
		System.out.println("=====================");
		return "redirect:/aus/PHE/projectAlarm";
		
		// 나에게 참가 신청을 하는거니까, 
		//메세지 보낸 사람 아이디+프로젝트 번호 가져와서 Alarm 에서 "내 아이디는 필요없고 " 보낸이와 프로젝트 번호 가져와서 삭제
		// 수락하면 Pj_mem 에다 프로젝트 번호와 보낸이의 아이디를 인서트
	}
	
	@RequestMapping(value = "/proposalAccept")
	public String proposalAccept(@ModelAttribute("projectApplyAlarm") AlarmDTO dto,
			@RequestParam("pj_num") int pj_num, @RequestParam("receiver") String receiver) {
		
		dao.acceptMember(receiver, pj_num);
		dao.removeFromAlarm_invitation(receiver, pj_num);
		System.out.println("receiver : " + receiver);
		System.out.println("pj_num : " + pj_num);
		return "redirect:/aus/PHE/projectAlarm";
		
		//다른 사람이 나에게 프로젝트에 초대한거니까
		//그 팀장이 나 말고도 다른 사람에게 초대장을 보냈을 수도 있기 때문에 sender 로 잡지 말고
		//받는 사람인 "나의 아이디"와 제안했던 프로젝트 번호 를 가져와서 Alarm 에서 삭제
		//Pj_mem 에는 내가 들어가는거니까 내 아이디와 pj_num 을 가지고 인서트
	}

}