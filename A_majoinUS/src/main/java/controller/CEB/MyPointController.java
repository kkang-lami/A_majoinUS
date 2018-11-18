package controller.CEB;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.CEB;
import project.DTO.MemberDTO;
import project.DTO.PageDTO;
import project.DTO.PaymentDTO;
import project.DTO.PointDTO;

@Controller
@RequestMapping("/aus")
@SessionAttributes("id")    

public class MyPointController {  

	@Autowired
	private CEB memberDAO;
	

	public void setService(CEB memberDAO) {
		this.memberDAO = memberDAO;
	}

	@ModelAttribute("mypoint")
	public CEB formBacking() {
		return new CEB();
  
	}
	
	@RequestMapping(value = "/Fail")
	public String fail (ModelMap model) {
		return "CEB/payment/Fail";
	}          

	
	@RequestMapping(value = "/MyPoint")
	public String show_content(ModelMap model, @RequestParam(value="pageNum", defaultValue="1")int pageNum,	String search, String string, HttpSession session) {
		session.removeAttribute("Dday");
		session.removeAttribute("pjm_num");
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "main";
		}
		int myPoint = memberDAO.show_listOne_3(id);/*id*/
		model.addAttribute("myPoint", myPoint);    
      
		int pageSize = 10;          
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = 0;    
		       
		  
		List<PointDTO> pointList = null;      
		int count1 = memberDAO.show_count_ticket(id);
     
		System.out.println(count1);  
		    
        if(search==null) {
        	count = memberDAO.show_count_3(id);
        	
        	  
        	if(count > 0) {
    			pointList = memberDAO.show_list_point(startRow, endRow, id);  
        	}
        	
        }      
			 
		number=count-(currentPage-1)*pageSize;
		
		model.addAttribute("number",number);
		model.addAttribute("count",count);
		model.addAttribute("count1",count1);    
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pointList",pointList);
		
		System.out.println(count1);		
		System.out.println(pointList);  
		
		return "CEB/MyPoint/myPagePoint";
	}    

	
	/*@RequestMapping(value="/my_content") 
	public String show_content(ModelMap model,int num) {
		PointDTO dto = memberDAO.show_listOne_point(num);
		model.addAttribute("MyPoint",dto);
		System.out.println(dto);
		return "CEB/MyPoint/myPagePoint"; 
	}    */
	

	@RequestMapping(value="/Payment_write", method = RequestMethod.GET)
	public String paymentlist(ModelMap model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		MemberDTO member = memberDAO.get_member(id);
		model.addAttribute("member", member);  
	    
		return "CEB/payment/Main_Payment";     
	}
	
	@RequestMapping(value="/Payment_write", method = RequestMethod.POST)
	public String paymentlist(@ModelAttribute("dto")PaymentDTO dto,
			@ModelAttribute("dto1")PointDTO dto1,Model m) {
		
		
		memberDAO.insert_paylist(dto);       
		memberDAO.insert_pointlist(dto1);     
		     
		int pay_no = memberDAO.next_num_3();
		/*int p_num = memberDAO.next_num_5();  */
		
		PaymentDTO payment = memberDAO.selectpay_no(pay_no);
		/*PointDTO point = memberDAO.selectp_num(p_num);*/
		
		System.out.println(pay_no);
		System.out.println("payment : " + payment);  
		System.out.println(dto1);
		
		m.addAttribute("pay_no",pay_no);
		m.addAttribute("payment",payment);
		/*m.addAttribute("point",point);*/
		/*m.addAttribute("p_num",p_num);*/

		return "CEB/payment/IamportTest";  
		   
	}    
	
	@RequestMapping(value="/Insert_Impuid", method = RequestMethod.GET) 
	   public String insert_impuid(ModelMap model,
			   @RequestParam(value="pay_no") int pay_no,
			   @RequestParam(value="imp_uid") String imp_uid, 
			   @RequestParam(value="pay_price") int pay_price,HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pay_no", pay_no);
		map.put("imp_uid", imp_uid);
		map.put("pay_price", pay_price);
		map.put("id", id);/*세션으로 넣어라*/
		
		System.out.println(map);
		
	      memberDAO.insert_impuid(map);  
	      memberDAO.insert_state(map);
	      memberDAO.update_allpoint(map);
	      
	        
          model.addAttribute("pay_no", pay_no);
	      model.addAttribute("imp_uid", imp_uid);
	      
	      return "CEB/payment/InsertSuccess"; 
	   } 
	
	}
	

