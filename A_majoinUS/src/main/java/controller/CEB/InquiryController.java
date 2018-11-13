package controller.CEB;

import java.util.List;

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
			@RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string) {
		
		System.out.println("sssss");
		int pageSize = 5;
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
			@RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string) {
		
		System.out.println("sssss");
		int pageSize = 5;  
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = 0;
		  
		List<InquiryDTO> inquiryList = null;
		
        if(search==null) {
        	count = inquiryDAO.show_count_id("test.amajo@gmail.com");   
        	  
        	if(count > 0) {  
    			inquiryList = inquiryDAO.show_list_id(startRow, endRow, "test.amajo@gmail.com");
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
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("inquiryList",inquiryList);
		
		return "CEB/inquiry/in_Form_user"; 
	}
	
	
	@RequestMapping(value="/in_writeForm", method = RequestMethod.GET)
	public String write_list_2() {
	System.out.println("write");
		return "CEB/inquiry/in_writeForm";
		
	}		

	@RequestMapping(value="/in_writeForm", method = RequestMethod.POST) 
	public String show_list1_2(/*@ModelAttribute("inquiry")*/InquiryDTO inquiry,
			BindingResult result, ModelMap model) {
		int num = inquiryDAO.next_num();
		
		System.out.println("post start");
		if(result.hasErrors()) {
			return "CEB/inquiry/in_writeForm";
		}
		inquiryDAO.add_article_2(inquiry);
		System.out.println("post.last");
		return "redirect:/aus/inquiry"; 
	}
	
	@RequestMapping(value="/in_content") 
	public String show_content_2(ModelMap model,int num) {
		InquiryDTO inquiry = inquiryDAO.show_listOne_2(num);
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