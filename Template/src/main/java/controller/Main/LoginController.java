package controller.Main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/aus")
public class LoginController {

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String form() {
		System.out.println("예시 레이아웃 배치도");
		return "TilesTemplate/layout";
	}
  
}