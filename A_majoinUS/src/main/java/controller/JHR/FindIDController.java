/*package controller.JHR;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import project.DTO.MemberDTO;

@Controller
@RequestMapping("/aus/JHR")
public class FindIDController {
	
	@Autowired
	private FindIDService service;
	
	@RequestMapping(value = "/findingId" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody String findingId(@ModelAttribute MemberDTO dto, 
			Model model , HttpServletResponse response)throws Exception {

		System.out.println(dto.toString());


		ArrayList <String> emailList = service.findId(dto);
		System.out.println(emailList.toString());
		System.out.println(emailList.get(0));
		String findEmail = "{\"email\":\""+emailList+"\"}";

		System.out.println(findEmail);

		return findEmail;
	}
	
}
*/