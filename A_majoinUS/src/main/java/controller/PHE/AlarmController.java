package controller.PHE;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.PHE;
import net.sf.json.JSONObject;
import project.DTO.AlarmDTO;

@Controller
@RequestMapping(value = "/aus")
public class AlarmController {
	@Autowired
	PHE dao;

	public void setDao(PHE dao) {
		this.dao = dao;
	}
	
	/************************* 프로젝트 알림 ************************/
	/*@RequestMapping(value = "/projectAlarmList")
	public ModelAndView projectAlarmList(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession(true);
		String sessionId =(String)session.getAttribute("id");			
		
		String a_type = "참가";
		List<ProjectAlarmListDTO> projectApplyAlarm = dao.getProjectApplyAlarm(receiver, a_type);
		
		a_type="초대";
		List<ProjectAlarmListDTO> projectProposalAlarm = dao.getProjectApplyAlarm(receiver, a_type);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/projectAlarm");
		mav.addObject("projectApplyAlarm", projectApplyAlarm);
		mav.addObject("projectProposalAlarm", projectProposalAlarm);

		return mav;
	}*/

	
	// 참가신청 리스트
	@RequestMapping(value = "/projectAlarm")
	public ModelAndView projectApplyAlarm(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession(true);
		session.removeAttribute("Dday");
		session.removeAttribute("pjm_num");
		String receiver =(String)session.getAttribute("id");	
		
		String a_type = "참가";
		List<ProjectAlarmListDTO> projectApplyAlarm = dao.getProjectApplyAlarm(receiver, a_type);
		
		a_type="초대";
		List<ProjectAlarmListDTO> projectProposalAlarm = dao.getProjectApplyAlarm(receiver, a_type);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/projectAlarm");
		mav.addObject("projectApplyAlarm", projectApplyAlarm);
		mav.addObject("projectProposalAlarm", projectProposalAlarm);

		return mav;
	}
	
	@RequestMapping(value = "/acceptMember", method=RequestMethod.POST)
	// method = { RequestMethod.GET, RequestMethod.POST }
	@ResponseBody
	public String acceptMember(@ModelAttribute("projectApplyAlarm") AlarmDTO dto,
			int pj_num, String sender,  HttpServletResponse response) throws IOException {
		
		System.out.println("==========apply===========");

		int memberCount = dao.memberCount(pj_num);
		int memberLimit = dao.memberLimit(pj_num);
		

		System.out.println("참가신청:" + memberCount +"/" + memberLimit);
		/*JSONObject jso = new JSONObject();
		PrintWriter out;*/
		String chk = dao.memberCheck(sender, pj_num);

		
		if(memberCount<memberLimit) {
			if(chk == null) {
				dao.joinMember(sender, pj_num);
				dao.removeFromAlarm_apply(sender, pj_num);
				
				System.out.println("sender : " + sender);
				System.out.println("pj_num : " + pj_num);
				
				
				return "register";
				/*jso.put("result", "register");
				response.setContentType("text/html;charset=utf-8");
				
				out = response.getWriter();
				System.out.println(jso.toString());
				out.print(jso.toString());*/
			} else {
				System.out.println("이미 참여중인 회원입니다" + chk);
				dao.removeFromAlarm_apply(sender, pj_num);

				
				return "already";
				/*jso.put("result", "already");
				response.setContentType("text/html;charset=utf-8");
				
				out = response.getWriter();
				System.out.println(jso.toString());
				out.print(jso.toString());*/
			}
		
		} else {
			System.out.println("else--");
			System.out.println("sender : " + sender);
			System.out.println("pj_num : " + pj_num);
			
			/*jso.put("result", "notRegister");
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			System.out.println("jso.toString : " + jso.toString());
			out.print(jso.toString());*/
			return "notRegister";
			
		}
		
		//System.out.println("==========apply End===========");
		//return "redirect:/ama/projectAlarm";
		
		// 자르는건 잘랐는데,,, 흠,,,,,,,,, // 아무 소용없다
		// 나에게 참가 신청을 하는거니까, 
		//메세지 보낸 사람 아이디+프로젝트 번호 가져와서 Alarm 에서 "내 아이디는 필요없고 " 보낸이와 프로젝트 번호 가져와서 삭제
		// 수락하면 Pj_mem 에다 프로젝트 번호와 보낸이의 아이디를 인서트
	}
	
	@RequestMapping(value = "/proposalAccept")
	@ResponseBody
	public String proposalAccept(HttpServletRequest request, HttpServletResponse response, int pj_num) throws IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession(true);
		String receiver =(String)session.getAttribute("id");
		System.out.println("==========proposalAccept========== ");

		int memberCount = dao.memberCount(pj_num);
		System.out.println("memberCount : " + memberCount);

		int memberLimit = dao.memberLimit(pj_num);
		System.out.println("memberLimit : " + memberLimit);
		
		/*JSONObject jso = new JSONObject();
		PrintWriter out;*/
		String chk = dao.memberCheck(receiver, pj_num);
		
		if(memberCount<memberLimit) {
			if(chk == null) {
				dao.joinMember(receiver, pj_num);
				dao.removeFromAlarm_invitation(receiver, pj_num);
				System.out.println("receiver : " + receiver);
				System.out.println("pj_num : " + pj_num);

				return "register";
				/*jso.put("result", "register");
				response.setContentType("text/html;charset=utf-8");
				
				out = response.getWriter();
				System.out.println(jso.toString());
				out.print(jso.toString());*/
				
			}else {
				System.out.println("이미 참여중인 회원입니다" + chk);
				
				return "already";
				/*jso.put("result", "already");
				response.setContentType("text/html;charset=utf-8");
				
				out = response.getWriter();
				System.out.println(jso.toString());
				out.print(jso.toString());*/
				
			}
			
			
		
		} else {
			System.out.println("else--");
			System.out.println("receiver : " + receiver);
			System.out.println("pj_num : " + pj_num);
			
			return "notRegister";
			/*jso.put("result", "notRegister");
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			System.out.println("jso.toString : " + jso.toString());
			out.print(jso.toString());*/
			
		}
		
		//다른 사람이 나에게 프로젝트에 초대한거니까
		//그 팀장이 나 말고도 다른 사람에게 초대장을 보냈을 수도 있기 때문에 sender 로 잡지 말고
		//받는 사람인 "나의 아이디"와 제안했던 프로젝트 번호 를 가져와서 Alarm 에서 삭제
		//Pj_mem 에는 내가 들어가는거니까 내 아이디와 pj_num 을 가지고 인서트
		//System.out.println("==========proposal End==========");
	}
	
	@RequestMapping(value = "/removeFromAlarm_apply", method=RequestMethod.POST)
	@ResponseBody
	public void removeFromAlarm_apply(HttpServletRequest request, HttpServletResponse response,int pj_num, String sender) throws IOException {
		JSONObject jso = new JSONObject();
		PrintWriter out;
		dao.removeFromAlarm_apply(sender, pj_num);
		jso.put("remove", "removeApply");
		response.setContentType("text/html;charset=utf-8");
		
		out = response.getWriter();
		System.out.println(jso.toString());
		out.print(jso.toString());
	}
	
	@RequestMapping(value = "/removeFromAlarm_invitation", method=RequestMethod.POST)
	@ResponseBody
	public void removeFromAlarm_invite(HttpServletRequest request, HttpServletResponse response, int pj_num) throws IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession(true);
		String receiver =(String)session.getAttribute("id");
		
		JSONObject jso = new JSONObject();
		PrintWriter out;
		dao.removeFromAlarm_invitation(receiver, pj_num);
		jso.put("remove", "removeIvite");
		response.setContentType("text/html;charset=utf-8");
		
		out = response.getWriter();
		System.out.println(jso.toString());
		out.print(jso.toString());
	}

	
	

}