package controller.JEJ;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.JEJ;
import project.DTO.IssueDTO;
import project.DTO.PageDTO;
import project.DTO.Review_adminDTO;

@Controller
public class Issue_ReviewController {

	@Autowired
	private JEJ service;

	public void setService(JEJ service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/aus/issue_admin")
	public String issue(Model model,@RequestParam(value="pageNum", defaultValue="1")int pageNum,@RequestParam(value="pageNum2", defaultValue="1")int pageNum2, String search, String string) throws Exception {
		//회원 신고
		//model.addAttribute("memberIssue", service.getMemberIssue());
		int pageSize = 5;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = service.countMemberIssue();
		
		PageDTO dto = new PageDTO();
		dto.setEndRow(endRow);
		dto.setStartRow(startRow);
		number=count-(currentPage-1)*pageSize;
		
		model.addAttribute("number",number);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("memberIssue", service.getMemberIssuePage(dto));
		
		
		//프로젝트 신고
		//model.addAttribute("projectIssue", service.getProjectIssue());
		int pageSize1 = 5;
		int currentPage1 = pageNum;
		int startRow1 = (currentPage1 - 1) * pageSize1 + 1;
		int endRow1 = currentPage1 * pageSize1;
		int number1 = 0;
		int count1 = service.countRoomIssue();
		
		PageDTO dto1 = new PageDTO();
		dto1.setEndRow(endRow1);
		dto1.setStartRow(startRow1);
		
		System.out.println("count1"+count1);
		System.out.println("getRoomIssuePage"+service.getRoomIssuePage(dto1));
		
		
		number1=count1-(currentPage1-1)*pageSize1;
		
		model.addAttribute("number1",number1);
		model.addAttribute("count1",count1);
		model.addAttribute("pageSize1",pageSize1);
		model.addAttribute("currentPage1",currentPage1);
		model.addAttribute("projectIssue", service.getRoomIssuePage(dto1));
		
		return "JEJ/issue_admin";
	}
	
	
	/*@RequestMapping(value = "/aus/review_admin")
	public String review(Model model, @RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string) throws Exception {
		//model.addAttribute("reviewList", service.getReviewpage(dto));
		//return "JEJ/review_admin";
		
		int pageSize = 5;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = service.countReview();
		
		PageDTO dto = new PageDTO();
		dto.setEndRow(endRow);
		dto.setStartRow(startRow);
		
		System.out.println("count"+count);
		System.out.println("getReviewPage"+service.getReviewPage(dto));
		
		
		number=count-(currentPage-1)*pageSize;
		
		model.addAttribute("number",number);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("reviewList", service.getReviewPage(dto));
		
		return "JEJ/review_admin";
	}*/

	
	 @RequestMapping(value = "/aus/review_admin")
	   public String review(Model model, @RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string) throws Exception {
	      //model.addAttribute("reviewList", service.getReviewpage(dto));
	      //return "JEJ/review_admin";
	      
	      int pageSize = 10;
	      int currentPage = pageNum;
	      int startRow = (currentPage - 1) * pageSize + 1;
	      int endRow = currentPage * pageSize;
	      int number = 0;
	      int count = service.countReview();
	      
	      PageDTO dto = new PageDTO();
	      dto.setEndRow(endRow);
	      dto.setStartRow(startRow);
	      
	      System.out.println("count"+count);
	      System.out.println("getReviewPage"+service.getReviewPage(dto));
	      
	      
	      number=count-(currentPage-1)*pageSize;
	      
	      model.addAttribute("number",number);
	      model.addAttribute("count",count);
	      model.addAttribute("pageSize",pageSize);
	      model.addAttribute("currentPage",currentPage);
	      model.addAttribute("reviewList", service.getReviewPage(dto));
	      
	      //
	      model.addAttribute("name", service.getReviewName());
	/*      System.out.println("은주당"+service.getReviewList());
	      System.out.println("dld"+service.getReviewName());*/
	      
	      return "JEJ/review_admin";
	   }

	
}
