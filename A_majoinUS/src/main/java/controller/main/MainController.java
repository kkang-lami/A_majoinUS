package controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/aus")
public class MainController {
	
	@RequestMapping("/main")
	public String start() {
		return "main";
	}
}
