package controller.LSH;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import controller.LSH.DTO.PagingDTO;
import controller.LSH.DTO.ResultDTO;
import controller.LSH.DTO.SearchDTO;
import project.DTO.AlarmDTO;
import project.DTO.IssueDTO;

@Controller
@RequestMapping("/aus")
public class SearchController {
	 
	@Autowired
	private SearchService service;
	
	@RequestMapping(value="/SearchUserForm",method=RequestMethod.GET)
	public String form(@ModelAttribute("command") SearchDTO dto,HttpServletRequest req,Model model) {
		
		String id = req.getSession().getAttribute("id").toString();
		System.out.println("[유저 검색]"+id);

		dto.setSort("joindate"); 
		dto.setSort_way("DESC"); 
		
		model.addAttribute("recomend",getRecomendUser(id));
		return "LSH/SearchUser";
	}
	
	@RequestMapping(value="/SearchUserForm",method=RequestMethod.POST)
	public String post(@ModelAttribute("command") SearchDTO dto,HttpServletRequest req,Model model) {
		System.out.println("[멤버] 포스트실행"+dto);

		PagingDTO pdto = DB(dto,0);
		model.addAttribute("pdto",pdto);
		model.addAttribute("recomend",getRecomendUser(req.getSession().getAttribute("id").toString()));
		return "LSH/SearchUser";
	}

	public List<ResultDTO> getRecomendUser(String id){
		List<ResultDTO> Recomend_User = new ArrayList<ResultDTO>();
		if(!id.equals("amajoinus@gmail.com")) {
			Map<String,Object> map = service.getMy_fav(id);
			Recomend_User = service.recommend_User(map);			
		}
		return Recomend_User;
	} 
	
	@RequestMapping(value="/first_List_LSH",method=RequestMethod.GET)
	public @ResponseBody Map<String,List<String>> first_List(){
		System.out.println("[1] first_List실행");
		
		Map<String,List<String>> map = new HashMap<String,List<String>>();
		map.put("job_list", service.getLevel1("직군"));
		map.put("local_list", service.getLevel1("지역"));
		
		return map;
	}
	
	@RequestMapping(value="/second_List_LSH",method=RequestMethod.GET)
	public @ResponseBody List<String> second_List(@RequestParam(defaultValue="0")int pageNum,String hint){
		System.out.println("[2] second_List실행");
		return service.getLevel2(hint);
	}

	@RequestMapping(value="/UserSort",method=RequestMethod.GET)
	public @ResponseBody PagingDTO sort(SearchDTO dto,@RequestParam(defaultValue="0")int pageNum){
		System.out.print("[멤버] sort실행 ::"+pageNum);
		return DB(dto,pageNum);
	}
	
	@RequestMapping(value="/show",method=RequestMethod.GET)
	public @ResponseBody List<HashMap<String,Object>> plus_member(String id){
		System.out.println("[멤버] 내 프로젝트 목록 "+ id);
		return service.getMyProject(id);
	}

	@RequestMapping(value="/insert_Message",method=RequestMethod.POST)
	public @ResponseBody void insert_Message(AlarmDTO alarm){
		System.out.println("[통합] 메세지전송 ::"+ alarm.getA_type());
		service.insert_Message(alarm);
	}
	
	@RequestMapping(value="/follow",method=RequestMethod.POST)
	public @ResponseBody void follow(String id,String login_id,String status){
		System.out.println("[멤버] 친구 등록&삭제 "+ id +"~"+ login_id+"~"+status);
		service.follow(login_id, id, status);
	}
	
	@RequestMapping(value="/UserProfile",method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> profile(String id,HttpServletRequest req){
		System.out.println("[멤버] 상세보기 "+id);
		
		String login_id = req.getSession().getAttribute("id").toString();
		boolean accessCheck = req.getHeader("referer").contains("SearchUserForm");
		
		Map<String, Object> param = new HashMap<String, Object>();

		if(accessCheck && !login_id.equals("amajoinus@gmail.com")) {
			param.put("view_count", true);
		}
		
		param.put("id", id);
		param.put("login_id", login_id);
		
		return service.get_user_profile(param);
	}
	
	@RequestMapping(value="/issue",method=RequestMethod.POST)
	public @ResponseBody int issue(String id,String login_id,@RequestParam(defaultValue="0")int pj_num,String is_content){

		System.out.println("[통합] 신고"+ id +"-"+ login_id+"-"+is_content+"-"+pj_num);
		return service.issue(new IssueDTO(login_id,id,pj_num,is_content));
	}
	
	public PagingDTO DB(SearchDTO dto,int pageNum) {
		if(pageNum == 0) {
			pageNum = 1;
		}

		int pageSize = 3;
		int pageBlock = 3;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		int rowCount = service.getNumber(dto);
		int pageCount = (int) Math.ceil(rowCount/(double) pageSize);
		int endPage = (int) Math.ceil(pageNum/(double) pageBlock) * pageBlock;
		int startPage = (endPage - pageBlock) + 1;

		if(pageCount < endPage) {
			endPage = pageCount;
		}
		
		System.out.print("::현재페이지"+pageNum+"::전체"+rowCount+"~첫글 번호"+startRow+"~끝글번호"+endRow);
		System.out.println("::페이지수 "+pageCount+" ::시작페이지 "+startPage+" ::끝페이지 "+endPage);
		
		dto.setStartRow(startRow);
		dto.setEndRow(endRow);
		List<ResultDTO> list = service.getResult(dto);
		
		
		return new PagingDTO(pageNum,rowCount,pageCount,startPage,endPage,list,pageBlock);
	}



}


