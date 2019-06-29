package controller.LSH;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import controller.PHE.ProjectAlarmListDTO;
import controller.PHE.ProjectListDTO;
import dao.JEJ;
import project.DTO.Todo_listDTO;

@Controller
@RequestMapping("/aus")
public class MypageController {
	
	private MypageService service;
	
	@Autowired
	private JEJ dao;
	
	@Autowired	
	public void setService(MypageService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/MyPageMain")
	public String main(HttpServletRequest request,Model model) throws Exception{
		
		HttpSession session = request.getSession();
		session = request.getSession(true);
		session.removeAttribute("Dday");
		session.removeAttribute("pjm_num");
		String receiver =(String)session.getAttribute("id");	
		
		String a_type = "참가";
		List<ProjectAlarmListDTO> projectApplyAlarm = dao.getProjectApplyAlarm(receiver, a_type);
		
		a_type="초대";
		List<ProjectAlarmListDTO> projectProposalAlarm = dao.getProjectApplyAlarm(receiver, a_type);
		
		
		//진행중인 프로젝트
		List<ProjectListDTO> ongoing_list = dao.ongoing_getListData(receiver);

		
		// LSH. getTodo
		String id = session.getAttribute("id").toString();
		List<Todo_listDTO> list = service.getTodo(id);

		model.addAttribute("ongoing_list",ongoing_list);
		model.addAttribute("projectApplyAlarm_size", projectApplyAlarm.size());
		model.addAttribute("projectApplyAlarm", projectApplyAlarm);
		model.addAttribute("projectProposalAlarm_size", projectProposalAlarm.size());
		model.addAttribute("projectProposalAlarm", projectProposalAlarm);
		model.addAttribute("todo", list);
		return "LSH/Mypage";
	}
	
	@RequestMapping(value="/insertTodo")
	public void insertTodo(Todo_listDTO dto,HttpServletResponse resp) throws Exception{
		System.out.println("[todo 등록]");
		resp.sendError(service.insertTodo(dto));
	}
	
	@RequestMapping(value="/Fin")
	public void Fin(String todo_num,String status,HttpServletResponse resp) throws Exception{
		System.out.println("[todo 완료]"+todo_num+"~"+status);
		int x = 0;
		if(status.equals("추가")) {
			x = service.updateFin(todo_num);
		}else {
			x = service.deleteFin(todo_num);
		}
		System.out.println("결과"+x);
	}
	
	@RequestMapping(value="/deleteTodo")
	public void deleteTodo(@RequestParam(value="todo_nums[]") List<String> todo_nums,HttpServletResponse resp) throws Exception{
		System.out.println("[todo 삭제]"+todo_nums);
		int x = service.deleteTodo(todo_nums);
		System.out.println("결과 ::"+x);
	}

	
}