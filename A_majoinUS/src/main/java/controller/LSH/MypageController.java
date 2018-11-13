package controller.LSH;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.DTO.Todo_listDTO;

@Controller
@RequestMapping("/aus/LSH/Mypage")
public class MypageController {
	
	private MypageService service;
	
	@Autowired	
	public void setService(MypageService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/Main")
	public String main(HttpServletRequest req,Model model) {
		System.out.println("[투두리스트 실행]");
		
		String id = req.getSession().getAttribute("userId").toString();
		
		List<Todo_listDTO> list = service.getTodo(id);
		for(Todo_listDTO m : list) {
			System.out.println(m);
		}
		model.addAttribute("todo", list);
		return "LSH/Mypage";
	}
	
	@RequestMapping(value="/insertTodo")
	public void insertTodo(Todo_listDTO dto,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		System.out.println("[+]"+dto);
		int x = service.insertTodo(dto);
		System.out.println("결과"+x);
	}
	
	@RequestMapping(value="/updateTodo")
	public void updateTodo(Todo_listDTO dto) {
		System.out.println("[++]");
		int x = service.updateTodo(dto);
		System.out.println("결과"+x);

	}
	
	@RequestMapping(value="/deleteTodo")
	public void deleteTodo(String todo_num) {
		System.out.println("[-]");
		int x = service.deleteTodo(todo_num);
		System.out.println("결과"+x);
	}

	
}