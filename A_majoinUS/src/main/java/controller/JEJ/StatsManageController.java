package controller.JEJ;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.JEJ;
import project.DTO.ProjectroomDTO;

@Controller
public class StatsManageController {

	@Autowired
	private JEJ service;
	
	public void setService(JEJ service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/aus/JEJ/StaticManage")
	public void stats_test3(Model model) throws Exception {
		//방문 통계
		model.addAttribute("visit_stat",service.visit_stat());
		
		//결제 통계
		model.addAttribute("pay_stat",service.pay_stat());
		
		//일대일 문의 답변율			
		model.addAttribute("inquiry",service.inquiry_stat());
		model.addAttribute("inquiry_match",service.inquiry_stat_match());
		
		
		//매칭
		//System.out.println("헤헤"+service.count_project());
		List<Integer> count = service.count_project();
		
		int match = 0;
		for(int a : count) {
		    int element = a;
		    //System.out.println(element);
		    match += service.match_project(element);		    
		    //System.out.println("hey"+match);
			}		
		//System.out.println("또잉"+match);
		model.addAttribute("all_project",service.all_project());
		model.addAttribute("match",match);
	}


	
	@RequestMapping(value = "/aus/JEJ/StatsManage")
	public void stats_list(Model model) throws Exception {
		
	}
	


}
