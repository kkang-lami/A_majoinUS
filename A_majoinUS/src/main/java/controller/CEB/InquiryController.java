package controller.CEB;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.CEB;
import project.DTO.*;
    
@Controller
@RequestMapping("/aus") 
@SessionAttributes("id")   
public class InquiryController {
	
	@Autowired
	private CEB inquiryDAO;  

	public void setService(CEB inquiryDAO) {
		this.inquiryDAO = inquiryDAO;
	}
	
  
	
	@ModelAttribute("inquiry")
	public InquiryDTO formBacking() {
		return new InquiryDTO();
	}
		
	@RequestMapping("/inquiry") 
	public String show_list_2(ModelMap model,
			@RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string,HttpSession session) {
		
		session.removeAttribute("Dday");
		session.removeAttribute("pjm_num");
		
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = 0;
		
		List<InquiryDTO> inquiryList = null;
		
		 int count1 = inquiryDAO.show_count_answer();
		
        if(search==null) { // 서치가 없을떄
        	count = inquiryDAO.show_count_2(); // 전체 글 수
        	if(count > 0) {
    			PageDTO dto = new PageDTO();
    			dto.setEndRow(endRow);
    			dto.setStartRow(startRow);
    			inquiryList = inquiryDAO.show_list1_2(dto);
        	}
        	
        } else { // 서치가 있을때

        	count = inquiryDAO.show_search_count_2(search, string);
        	if(count > 0) {
        		
        		inquiryList = inquiryDAO.show_search_list_2(search, string, startRow, endRow);
        		model.addAttribute("search1",1);
        		model.addAttribute("string",string);
        		model.addAttribute("search",search);
        	}
        }
			
		number=count-(currentPage-1)*pageSize;
		
		model.addAttribute("number",number);
		model.addAttribute("count",count);
		model.addAttribute("count1",count1); 
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("inquiryList",inquiryList);
		
		return "CEB/inquiry/in_Form"; 
	}
	
	@RequestMapping("/inquiry_user") 
	public String show_list_user(ModelMap model,
			@RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string,HttpSession session) {
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "main";
		}
		System.out.println("sssss");
		int pageSize = 10;  
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = 0;
		  
		List<InquiryDTO> inquiry_List = null;
		List<InquiryDTO> inquiry = new ArrayList<InquiryDTO>();
        if(search==null) {
        	count = inquiryDAO.show_count_id(id);   
        	  
        	if(count > 0) {  
        		PageDTO dto = new PageDTO();    
    			dto.setStartRow(startRow);  
    			dto.setEndRow(endRow);  
    			System.out.println(endRow+startRow);  
    			
    			inquiry_List = inquiryDAO.show_list1_id(startRow ,endRow, id);
    			
    			for(int i =0;i<inquiry_List.size(); i++) {
    				InquiryDTO Idto = inquiry_List.get(i);
    				Idto.setI_date(Idto.getI_date().substring(0, Idto.getI_date().indexOf(" ")));
    				inquiry.add(Idto);
    			}
        	}
        	
        } else { // 서치가 있을때  

        	count = inquiryDAO.show_search_count_id(search, string,id);
        	if(count > 0) {
        		
        		inquiry_List = inquiryDAO.show_search_list_id(search, string, startRow, endRow,id);
        		model.addAttribute("search1",1);
        		model.addAttribute("string",string);     
        		model.addAttribute("search",search);
        	}
        }
			
		number=count-(currentPage-1)*pageSize;
		
		model.addAttribute("number",number);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("inquiry_List",inquiry_List);
		
		return "CEB/inquiry/in_Form_user"; 
	}
	
	
	@RequestMapping(value="/in_writeForm", method = RequestMethod.GET)
	public String write_list_2() {
	System.out.println("write");
		return "CEB/inquiry/in_writeForm";
		
	}		

	@RequestMapping(value="/in_writeForm", method = RequestMethod.POST) 
	public String show_list1_2(/*@ModelAttribute("inquiry")*/InquiryDTO inquiry,
			BindingResult result, ModelMap model,HttpSession session) {
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "main";
		}
		inquiry.setId(id);
		int num = inquiryDAO.next_num();
		
		System.out.println("post start");
		if(result.hasErrors()) {
			return "CEB/inquiry/in_writeForm";
		}
		inquiryDAO.add_article_2(inquiry);
		System.out.println("post.last");
		return "redirect:/aus/inquiry_user"; 
	}
	
	@RequestMapping(value="/in_content") 
	public String show_content_2(ModelMap model,int num) {
		InquiryDTO inquiry = inquiryDAO.show_listOne_2(num);
		inquiry.setI_date(inquiry.getI_date().substring(0,inquiry.getI_date().indexOf(" ")));
		model.addAttribute("inquiry",inquiry);
		return "CEB/inquiry/in_content"; 
	}

	
	@RequestMapping(value="/in_update", method = RequestMethod.GET) 
	public String update_2(ModelMap model,int num) {

		InquiryDTO inquiry = inquiryDAO.show_listOne_2(num);
		model.addAttribute("inquiry", inquiry);
		return "CEB/inquiry/in_updateForm"; 
	}  
	
	@RequestMapping(value="/in_update", method = RequestMethod.POST) 
	public String update_pro_2(ModelMap model,@ModelAttribute("writeform")InquiryDTO inquiry) {
			inquiryDAO.update_2(inquiry);
  
			return "redirect:/aus/inquiry";
	}
	
}