package controller.PHE;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.PHE;
import net.sf.json.JSONObject;
import project.DTO.AlarmDTO;
import project.DTO.Pj_jobDTO;
import project.DTO.Pj_locationDTO;
import project.DTO.ProjectroomDTO;

@Controller
@RequestMapping(value = "/aus/PHE")
public class ProjectroomController {
	@Autowired
	PHE dao;

	public void setDao(PHE dao) {
		this.dao = dao;
	}

	/********************************* 프로젝트룸 *************************************/
	// create
	@RequestMapping(value = "/createProjectForm")
	public void createProjectForm() {
		System.out.println("create controller");
	}

	@RequestMapping(value = "/createProjectForm", method = RequestMethod.POST)
	public String submittedProjectForm(ProjectroomDTO command1, Pj_jobDTO command2,
			Pj_locationDTO command3, HttpServletRequest request,String end_d) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error");
		}
		HttpSession session = request.getSession();
		session = request.getSession(true);
		String sessionId =(String)session.getAttribute("userId");
		
		System.out.println(end_d);
		  
		System.out.println("create controller");
		//System.out.println("controller command1"+command1);
		
		dao.createProject(command1);
		dao.createProjectJob(command2);
		dao.createProjectLocation(command3);
		dao.insertToPjMem(sessionId);		
		
		String end = "2099-12-31";
		if(end.equals(end_d)) {
			dao.useTicket(sessionId);
		}

		
		
		return "redirect:/aus/PHE/projectList";
	}

	// list
	@RequestMapping(value = "/projectList")
	public ModelAndView listAll(HttpServletRequest request) throws Exception {// public List<Board> listAll() {
		HttpSession session = request.getSession();
		session = request.getSession(true);
		String sessionId =(String)session.getAttribute("userId");
		String a_type="참가";
		List<ProjectListDTO> ongoing_list = dao.ongoing_getListData(sessionId);
		List<ProjectListDTO> finish_list = dao.finish_getListData(sessionId);
		List<AlarmDTO> apply_list = dao.apply_getListData(sessionId, a_type);
		List<ProjectroomDTO> list = dao.getListData();

		//List<AlarmDTO> projectAlarmList = dao.getProjectAlarmList(id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/projectList");
		mav.addObject("list", list);
		mav.addObject("ongoing_list", ongoing_list);
		mav.addObject("finish_list", finish_list);
		mav.addObject("apply_list", apply_list);


		return mav;
	}

	// content 상세보기
	@RequestMapping(value = "/projectContent", produces = "text/plain;charset=UTF-8")
	// @ResponseBody
	public ModelAndView contentView(@RequestParam int pj_num, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/projectContent");
		mav.addObject("list", dao.read(pj_num));
		mav.addObject("list2", dao.read2(pj_num));
		mav.addObject("list3", dao.read3(pj_num));
		return mav;
	}

	// 프로젝트 수정
	@RequestMapping("/modifyProject")
	public ModelAndView modifyProject(HttpServletRequest request, HttpSession session, @RequestParam int pj_num) {
		ProjectroomDTO dto1 = dao.read(pj_num);
		Pj_jobDTO dto2 = dao.read2(pj_num);
		Pj_locationDTO dto3 = dao.read3(pj_num);
		
		Map<String,String> date = dao.Project_Date(pj_num);
		System.out.println("con date: " + date);

		ModelAndView mav = new ModelAndView();

		mav.addObject("command1", dto1);
		mav.addObject("command2", dto2);
		mav.addObject("command3", dto3);
		mav.addObject("date", date);
		mav.setViewName("PHE/modifyProject");
		return mav;
	}

	@RequestMapping(value = "/modifyProject", method = RequestMethod.POST)
	public ModelAndView modifyProjectPro(ProjectroomDTO command1, Pj_jobDTO command2, Pj_locationDTO command3,
			@RequestParam("pj_num") int pj_num, HttpSession session) {

		dao.projectModify(command1);
		dao.projectModify_job(command2);
		dao.projectModify_location(command3);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pj_num", command1.getPj_num());
		mav.addObject("pj_num", command2.getPj_num());
		mav.addObject("pj_num", command3.getPj_num());

		mav.setViewName("redirect:/aus/PHE/projectContent");
		return mav;
	}

	// 글삭제
	@RequestMapping(value = "/projectDelete")
	// @ResponseBody 이거 쓰면 redirect:/ama/projectList라는 페이지가 생성됨
	public String delete(@RequestParam("pj_num") int pj_num, HttpSession session) {
		dao.deleteProject(pj_num);
		dao.deleteProject_job(pj_num);
		dao.deleteProject_location(pj_num);
		return "redirect:/aus/PHE/projectList";
	}

	// ticket 개수
	@RequestMapping(value = "/countTicket")
	public void countTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session = request.getSession(true);
		String sessionId = (String) session.getAttribute("userId");

		JSONObject jso = new JSONObject();
		PrintWriter out;

		String t_status = "미사용";
		int ticket = dao.ticketCount(t_status, sessionId);
		System.out.println("미사용티켓 개수 : " + ticket);
		if (ticket == 0) {
			jso.put("ticket", ticket);

		} else {
			jso.put("ticket", ticket);

		}
		response.setContentType("text/html;charset=utf-8");
		out = response.getWriter();
		System.out.println(jso.toString());
		out.print(jso.toString());

	}
	


	
	
	
	
	

}