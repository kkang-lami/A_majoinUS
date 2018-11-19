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
import project.DTO.NoticeDTO;
import project.DTO.PageDTO;

@Controller
@RequestMapping("/aus") 
@SessionAttributes("id")    
public class NoticeController {
	
	@Autowired
	private CEB noticeDAO;

	public void setService(CEB noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	

	@ModelAttribute("dto")
	public CEB formBacking() {
		return new CEB();
	}
		
	@RequestMapping("/notice") 
	public String show_list(ModelMap model, 
			@RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string,HttpSession session) {
        
		session.removeAttribute("Dday");
		session.removeAttribute("pjm_num");
		
		
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = 0;
		
		List<NoticeDTO> noticeList = null;
		List<NoticeDTO> notice = new ArrayList<NoticeDTO>();
		
        if(search==null) { // 서치가 없을떄
        	count = noticeDAO.show_count(); // 전체 글 수
        	if(count > 0) {
    			PageDTO dto = new PageDTO();
    			dto.setEndRow(endRow);
    			dto.setStartRow(startRow);
    			noticeList = noticeDAO.show_list1(dto);
    			
    			for(int i = 0; i<noticeList.size() ; i++) {
    				NoticeDTO Ndto = noticeList.get(i);
    				Ndto.setNotice_date(Ndto.getNotice_date().substring(0, Ndto.getNotice_date().indexOf(" ")));
    				notice.add(Ndto);
    			}
        	}
        	
        } else { // 서치가 있을때

        	count = noticeDAO.show_search_count(search, string);
        	if(count > 0) {
        		
        		noticeList = noticeDAO.show_search_list(search, string, startRow, endRow);
        		for(int i = 0; i<noticeList.size() ; i++) {
    				NoticeDTO Ndto = noticeList.get(i);
    				Ndto.setNotice_date(Ndto.getNotice_date().substring(0, Ndto.getNotice_date().indexOf(" ")));
    				notice.add(Ndto);
    			}
        		
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
		model.addAttribute("noticeList",notice);
		
		return "CEB/notice/Form"; 
	}
	
	
	
	
	
	@RequestMapping(value="/writeForm", method = RequestMethod.GET)
	public String write_list() {
		System.out.println("notice write");
		return "CEB/notice/writeForm";   
	}		

	@RequestMapping(value="/writeForm", method = RequestMethod.POST)
	public String show_list1(/*@ModelAttribute("dto")*/NoticeDTO dto, BindingResult result, ModelMap model) {
	int num = noticeDAO.next_num();
		
		if(result.hasErrors()) {
			return "CEB/notice/writeForm";
		}
		noticeDAO.add_article(dto);    
		return "redirect:/aus/notice";
		 
		}
		  
	
	@RequestMapping(value="/content") 
	public String show_content(ModelMap model,int num) {
		NoticeDTO dto = noticeDAO.show_listOne(num);
		dto.setNotice_date(dto.getNotice_date().substring(0, dto.getNotice_date().indexOf(" ")));
		model.addAttribute("notice",dto);
		return "CEB/notice/content"; 
	}
	

	@RequestMapping(value="/delete", method = RequestMethod.GET) 
	public String delete(ModelMap model,@RequestParam("num")int num) {
		noticeDAO.delete(num);
		
		return "redirect:/aus/notice";
	}
	
	
	@RequestMapping(value="/update", method = RequestMethod.GET) 
	public String update(ModelMap model,int num) {

		NoticeDTO dto = noticeDAO.show_listOne(num);
		model.addAttribute("notice", dto);
		return "CEB/notice/updateForm"; 
	}
	
	
	@RequestMapping(value="/update", method = RequestMethod.POST) 
	public String update_pro(ModelMap model,@ModelAttribute("writeform") NoticeDTO dto ){
		noticeDAO.update(dto);
		
			return "redirect:/aus/notice";  
	}
	
	
}
