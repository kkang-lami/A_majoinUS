package controller.CEB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.CEB;
import project.DTO.MemberDTO;
import project.DTO.NoticeDTO;
import project.DTO.PaymentDTO;

@Controller
@RequestMapping("/aus")
public class PaymentController {
	
	@Autowired
	private CEB payDAO;

	public void setService(CEB payDAO) {
		this.payDAO = payDAO;
	}
	

	@ModelAttribute("pay")
	public CEB formBacking() {
		return new CEB();
	}
		
	
	

	
	
	

/*	@RequestMapping(value="/Payment_write", method = RequestMethod.POST)
	public String (@ModelAttribute("dto")PaymentDTO dto, BindingResult result, ModelMap model) {
	int num = PaymentDAO.next_num();
	
		
		if(result.hasErrors()) {
			return "CEB/payment/fail";
		}
		
		memberDAO.add_article(dto);    
		return "CEB/payment/IamportTest";
		 
		}*/
  




	
	
}