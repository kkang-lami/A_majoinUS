package controller.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import interceptor.NoLoginCheck;



@Controller
@RequestMapping("/aus")
@NoLoginCheck
public class MainController {
	
	
	@RequestMapping("/main")
	public String start(HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "main";
		}else {
			return "redirect:/aus/MyPageMain";
		}
	}
}
