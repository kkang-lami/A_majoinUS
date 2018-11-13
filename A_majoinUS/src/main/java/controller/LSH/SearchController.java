package controller.LSH;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.json.JSONObject;
import project.DTO.AlarmDTO;
import project.DTO.IssueDTO;

@Controller
@RequestMapping("/aus/LSH")
public class SearchController {
	
	private SearchService service;
	
	@Autowired	
	public void setSearchService(SearchService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/SearchUserForm",method=RequestMethod.GET)
	public String form(@ModelAttribute("command") SearchDTO dto,Model model) {
		System.out.println("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
		dto.setSort("joindate");
		dto.setSort_way("DESC");
		model.addAttribute("rowCount", -1);
		
		System.out.println("[-] 겟실행"+dto);
		return "LSH/SearchUser";
	}
	
	@RequestMapping(value="/SearchUserForm",method=RequestMethod.POST)
	public String post(@ModelAttribute("command") SearchDTO dto,Model model) {
		System.out.println("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
		System.out.println("[0] 포스트실행"+dto);

		PagingDTO pdto = DB(dto,1);
		
		model.addAttribute("pdto",pdto);
		return "LSH/SearchUser";
	}
	
	@RequestMapping(value="/first_List",method=RequestMethod.POST)
	public void first_List(HttpServletResponse resp) throws Exception{
		System.out.println("[1] first_List실행");
		resp.setContentType("text/html;charset=utf-8");
		
		List<String> job_list = service.getLevel1("직군");
		List<String> local_list = service.getLevel1("지역");
		
		JSONObject jso = new JSONObject();
		jso.put("job_list", job_list);
		jso.put("local_list", local_list);
		
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	
	@RequestMapping(value="/second_List",method=RequestMethod.POST)
	public void second_List(HttpServletResponse resp,@RequestParam(defaultValue="0")int pageNum,String hint) throws Exception{
		System.out.println("[2] second_List실행");
		resp.setContentType("text/html;charset=utf-8");
		
		List<String> step2 = service.getLevel2(hint);
		JSONObject jso = new JSONObject();
		jso.put("list", step2);
		
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}

	@RequestMapping(value="/sort",method=RequestMethod.POST)
	public void sort(SearchDTO dto,@RequestParam(defaultValue="0")int pageNum,HttpServletResponse resp) throws Exception{
		System.out.print("[3](∩ 'ω')⊃━♡°.*・｡♡° sort실행 ::"+pageNum);
		resp.setContentType("text/html;charset=utf-8");
		
		PagingDTO pdto = DB(dto,pageNum);
		
		JSONObject jso = new JSONObject();
		jso.put("pdto", pdto);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	
	@RequestMapping(value="/show",method=RequestMethod.POST)
	public void plus_member(String id,HttpServletResponse resp) throws Exception{
		System.out.println("[4] 내 프로젝트 목록 "+ id);
		resp.setContentType("text/html;charset=utf-8");
		
		List<HashMap<String,Object>> list = service.getMyProject(id);
		
		JSONObject jso = new JSONObject();
		jso.put("mine", list);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}

	@RequestMapping(value="/insert_Message",method=RequestMethod.POST)
	public void insert_Message(AlarmDTO alarm,HttpServletResponse resp) throws Exception{
		System.out.println("[5] 메세지전송 "+ alarm);
		resp.setContentType("text/html;charset=utf-8");
		int result = service.insert_Message(alarm);
		System.out.println("결과는? 두구두구:: "+result);
	}
	
	@RequestMapping(value="/profile",method=RequestMethod.POST)
	public void profile(String id,String login_id,HttpServletResponse resp) throws Exception{
		System.out.println("[6] 멤버프로필 "+ id +"~"+ login_id);
		resp.setContentType("text/html;charset=utf-8");
		
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("what", id);
		m.put("colum", "mem_view");
		m.put("table", "member");
		m.put("where", "id");
		int result = service.update_view(m);
		System.out.println("[-]조회수"+result);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("login_id", login_id);
		Map<String,Object> x = service.get_profile(param);
		System.out.println("[-]멤버정보 "+x);
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★\n"+x.get("profile")+"\n★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		JSONObject jso = new JSONObject();
		jso.put("x", x);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}

	@RequestMapping(value="/follow",method=RequestMethod.POST)
	public void follow(String id,String login_id,String status,HttpServletResponse resp) throws Exception{
		System.out.println("[7] 친구등록 "+ id +"~"+ login_id+"~"+status);
		resp.setContentType("text/html;charset=utf-8");
		int result = service.follow(login_id, id, status);
		System.out.println("결과는? 두구두구:: "+result);
	}
	
	@RequestMapping(value="/issue",method=RequestMethod.POST)
	public void issue(String id,String login_id,@RequestParam(defaultValue="0")int pj_num,String is_content,HttpServletResponse resp) throws Exception{
		System.out.println("[8] 멤버신고 "+ id +"~"+ login_id+" ~ "+is_content);
		resp.setContentType("text/html;charset=utf-8");
		
		int result = service.issue(new IssueDTO(login_id,id,pj_num,is_content));
		
		System.out.println("결과는? 두구두구:: "+result);
		JSONObject jso = new JSONObject();
		jso.put("x", result);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	
	public PagingDTO DB(SearchDTO dto,int pageNum) {

		int pageSize = 2;
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


