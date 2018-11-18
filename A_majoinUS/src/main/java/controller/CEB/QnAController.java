package controller.CEB;

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
import project.DTO.PageDTO;
import project.DTO.QnADTO;


  
@Controller
@RequestMapping("/aus")   
@SessionAttributes("id")    

public class QnAController {
	
	@Autowired
	private CEB QnADAO;

	public void setService(CEB QnADAO) {
		this.QnADAO = QnADAO;
	}
	

	@ModelAttribute("qna")
	public CEB formBacking() {
		return new CEB();
	}
		
	@RequestMapping("/qna") 
	public String show_list_1(ModelMap model, 
			@RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string,HttpSession session) {

		session.removeAttribute("Dday");
		session.removeAttribute("pjm_num");
		
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = 0;
		
		List<QnADTO> qnaList = null;
		
        if(search==null) { // 서치가 없을떄
        	count = QnADAO.show_count_1(); // 전체 글 수
        	if(count > 0) {
    			PageDTO p_dto = new PageDTO();
    			p_dto.setEndRow(endRow);
    			p_dto.setStartRow(startRow);
    			qnaList = QnADAO.show_list1_1(p_dto);
        	}
        	
        } else { // 서치가 있을때

        	count = QnADAO.show_search_count_1(search, string);
        	if(count > 0) {
        		
        		qnaList = QnADAO.show_search_list_1(search, string, startRow, endRow);
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
		model.addAttribute("qnaList",qnaList);
		
		return "CEB/qna/qna_Form"; 
	}
	
	
	
	
	
	@RequestMapping(value="/qna_writeForm", method = RequestMethod.GET) 
	public String write_list_1() {
		System.out.println("cccccccccc");
	
		return "CEB/qna/qna_writeForm";   
	}		      
	

	@RequestMapping(value="/qna_writeForm", method = RequestMethod.POST)
	public String show_list1_1(/*@ModelAttribute("dto")*/QnADTO qna, BindingResult result, ModelMap model) {
		
		int num = QnADAO.next_num_1();
		
		if(result.hasErrors()) {
			return "CEB/qna/qna_writeForm";
		}

		QnADAO.add_article_1(qna);    
		return "redirect:/aus/qna";  
		 
		}
		  
	
	@RequestMapping(value="/qna_content") 
	public String show_content_1(ModelMap model,int num) {
		QnADTO qna = QnADAO.show_listOne_1(num);
		model.addAttribute("qna",qna);
		return "CEB/qna/qna_content"; 
	}
	
	@RequestMapping(value="/qna_delete", method = RequestMethod.GET) 
	public String delete_pro_1(ModelMap model,@RequestParam("num") int num) {
			QnADAO.delete_1(num);
			return "redirect:/aus/qna";
		
		}
	
	
	
	@RequestMapping(value="/qna_update", method = RequestMethod.GET) 
	public String update_1(ModelMap model,int num) {

		QnADTO qna = QnADAO.show_listOne_1(num);
		model.addAttribute("qna", qna);
		return "CEB/qna/qna_updateForm"; 
	}
	
	
	@RequestMapping(value="/qna_update", method = RequestMethod.POST) 
	public String update_pro_1(ModelMap model,@ModelAttribute("qna_writeform") QnADTO qna ){
		  System.out.println(qna.getQ_content()+"\n"+qna.getQna_num() +"\n"+ qna.getQ_subject());
		QnADAO.update_1(qna);
		
			return "redirect:/aus/qna";  
	}
	
	
}
