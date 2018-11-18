package controller.CEB;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CEB;
import project.DTO.MemberDTO;
import project.DTO.PointDTO;
import project.DTO.TicketDTO;
  
@Controller
@RequestMapping("/aus")
public class TicketContoroller {
	
	@Autowired
	private CEB ticketDAO;
	
	public void setService(CEB ticketDAO) {
		this.ticketDAO = ticketDAO;
	}
	
	@ModelAttribute("myTicket")
	public CEB formBacking() {
		return new CEB();  

	}
	
	    
	@RequestMapping(value = "/buying")
	public String content (ModelMap model,HttpSession session) {
		session.removeAttribute("Dday");
		session.removeAttribute("pjm_num");
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "redirect:/aus/main";
		}
		
		MemberDTO member = ticketDAO.get_member_modal(id);
		model.addAttribute("member", member);
		
		return "CEB/ticket/Buy_thing";
	}  

          
	@RequestMapping(value="/buy_ticket", method = RequestMethod.POST)
	public String modallist(@ModelAttribute("dto")TicketDTO dto,@ModelAttribute("dto1")PointDTO dto1,Model m) {      
		
		ticketDAO.buying_ticket(dto);               
		ticketDAO.insert_pointlist_2(dto1); 
		
		System.out.println(":::insert ticket 됨:::"+dto + "\n");           
		int t_num = dto.getT_num();    
		
		TicketDTO ticket = ticketDAO.select_Ticket(t_num);
		
		m.addAttribute("t_num",t_num);
		m.addAttribute("ticket",ticket);  
		System.out.println("aaaaaaaa");
		
		return "redirect:/aus/Insert_Ticket";
		 
	}
	
	@RequestMapping(value="/Insert_Ticket", method = RequestMethod.GET) 
	   public String Insert_Ticket(ModelMap model, @RequestParam(value="t_num") int t_num, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "redirect:/aus/main";
		}
		System.out.println("::::::::::여기");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("t_num", t_num);
		map.put("id",id);/*세션으로 넣어라*/
		
		System.out.println(map);    
		
		
		ticketDAO.update_ticketpoint(map);
		System.out.println(":::::::업데이트 완료"+map);
	      
	        
        model.addAttribute("t_num", t_num); 
	    
	      
	      return "CEB/ticket/InsertSuccess"; 
	   } 
	}      

	
	



