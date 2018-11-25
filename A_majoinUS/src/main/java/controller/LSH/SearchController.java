package controller.LSH;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
@RequestMapping("/aus")
public class SearchController {
	
	private SearchService service;
	
	@Autowired	
	public void setSearchService(SearchService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/SearchUserForm",method=RequestMethod.GET)
	public String form(@ModelAttribute("command") SearchDTO dto,HttpServletRequest req,Model model) {		
		String id = req.getSession().getAttribute("id").toString();
		System.out.println("[프로젝트룸]▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼"+id);

		dto.setSort("joindate");
		dto.setSort_way("DESC");
		
		model.addAttribute("recomend",getRecomendUser(id));
		return "LSH/SearchUser";
	}
	
	public List<ResultDTO> getRecomendUser(String id){
		List<ResultDTO> Recomend_User = new ArrayList<ResultDTO>();
		if(!id.equals("amajoinus@gmail.com")) {
			Map<String,Object> map = service.getMy_fav(id);
			Recomend_User = service.recommend_User(map);			
		}
		for(ResultDTO m : Recomend_User) {System.out.println(m);}
		return Recomend_User;
	} 
	
	
	@RequestMapping(value="/SearchUserForm",method=RequestMethod.POST)
	public String post(@ModelAttribute("command") SearchDTO dto,HttpServletRequest req,Model model) {
		System.out.println("[멤버] 포스트실행"+dto);

		PagingDTO pdto = DB(dto,0);
		model.addAttribute("pdto",pdto);
		model.addAttribute("recomend",getRecomendUser(req.getSession().getAttribute("id").toString()));
		return "LSH/SearchUser";
	}
	
	@RequestMapping(value="/first_List_LSH",method=RequestMethod.POST)
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
	
	@RequestMapping(value="/second_List_LSH",method=RequestMethod.POST)
	public void second_List(HttpServletResponse resp,@RequestParam(defaultValue="0")int pageNum,String hint) throws Exception{
		System.out.println("[2] second_List실행");
		resp.setContentType("text/html;charset=utf-8");
		
		List<String> step2 = service.getLevel2(hint);
		JSONObject jso = new JSONObject();
		jso.put("list", step2);
		
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}

	@RequestMapping(value="/UserSort",method=RequestMethod.POST)
	public void sort(SearchDTO dto,@RequestParam(defaultValue="0")int pageNum,HttpServletResponse resp) throws Exception{
		System.out.print("[멤버](∩ 'ω')⊃━♡°.*・｡♡° sort실행 ::"+pageNum);
		resp.setContentType("text/html;charset=utf-8");
		
		PagingDTO pdto = DB(dto,pageNum);
		JSONObject jso = new JSONObject();
		jso.put("pdto", pdto);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	
	@RequestMapping(value="/show",method=RequestMethod.POST)
	public void plus_member(String id,HttpServletResponse resp) throws Exception{
		System.out.println("[멤버] 내 프로젝트 목록 "+ id);
		resp.setContentType("text/html;charset=utf-8");
		
		List<HashMap<String,Object>> list = service.getMyProject(id);
		JSONObject jso = new JSONObject();
		jso.put("mine", list);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}

	@RequestMapping(value="/insert_Message",method=RequestMethod.POST)
	public void insert_Message(AlarmDTO alarm,HttpServletResponse resp) throws Exception{
		System.out.println("[통합] 메세지전송 ::"+ alarm.getA_type());
		resp.setContentType("text/html;charset=utf-8");
		int result = service.insert_Message(alarm);
		System.out.println("결과는? 두구두구:: "+result);
	}
	
	@RequestMapping(value="/UserProfile",method=RequestMethod.POST)
	public void profile(String id,String login_id,HttpServletResponse resp) throws Exception{
		System.out.println("[멤버] 상세보기 "+ id +"~"+ login_id);
		resp.setContentType("text/html;charset=utf-8");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("login_id", login_id);
		Map<String,Object> x = service.get_profile(param);
		System.out.println("[-]멤버정보 "+x);
		
		if(!login_id.equals("amajoinus@gmail.com")) {
			updateView(id);
		}
		
		JSONObject jso = new JSONObject();
		jso.put("x", x);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}

	@RequestMapping(value="/follow",method=RequestMethod.POST)
	public void follow(String id,String login_id,String status,HttpServletResponse resp) throws Exception{
		System.out.println("[멤버] 친구 등록&삭제 "+ id +"~"+ login_id+"~"+status);
		resp.setContentType("text/html;charset=utf-8");
		int result = service.follow(login_id, id, status);
		System.out.println("결과는? 두구두구:: "+result);
	}
	
	@RequestMapping(value="/issue",method=RequestMethod.POST)
	public void issue(String id,String login_id,@RequestParam(defaultValue="0")int pj_num,String is_content,HttpServletResponse resp) throws Exception{
		System.out.println("[통합] 신고 "+ id +"~"+ login_id+" ~ "+is_content+"!!!!! "+pj_num);
		resp.setContentType("text/html;charset=utf-8");
		
		int result = service.issue(new IssueDTO(login_id,id,pj_num,is_content));
		
		System.out.println("결과는? 두구두구:: "+result);
		JSONObject jso = new JSONObject();
		jso.put("x", result);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	
	public void updateView(String id) {
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("what", id);
		m.put("colum", "mem_view");
		m.put("table", "member");
		m.put("where", "id");
		int result = service.update_view(m);
		System.out.println("[-]조회수"+result);
	}
	
	public PagingDTO DB(SearchDTO dto,int pageNum) {
		if(pageNum == 0) {
			pageNum = 1;
		}

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


