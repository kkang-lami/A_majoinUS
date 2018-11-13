package controller.JEJ;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.JEJ;
import project.DTO.PageDTO;
import project.DTO.ProjectroomDTO;

@Controller
public class ProjectManageController {
	
	@Autowired
	private JEJ service;

	public void setService(JEJ service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/aus/ProjectManage")
	public String project_manage(Model model, @RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string) throws Exception {
		int pageSize = 6;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = 0;
		
		//System.out.println("search:"+search);
		//System.out.println("string:"+string);
		
		List<ProjectroomDTO> projectroomList = null;
		
        if(search==null) { // 서치가 없을떄
        	count = service.count_projectroom(); // 전체 글 수
        	if(count > 0) {
    			PageDTO dto = new PageDTO();
    			dto.setEndRow(endRow);
    			dto.setStartRow(startRow);
    			projectroomList = service.getProjectroom(dto);
        	}
        	
        } else { // 서치가 있을때

        	count = service.projectroom_search_count(search, string);
        	if(count > 0) {
        		
        		projectroomList = service.projectroom_search_list(search, string, startRow, endRow);
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
		model.addAttribute("projectroomList",projectroomList);
		
		return "JEJ/ProjectManage";
	}
}
