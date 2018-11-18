package controller.LSH;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import net.sf.json.JSONObject;
import project.DTO.ProjectroomDTO;

@Controller
@RequestMapping("/aus")
public class SearchTeamController {
	
	private SearchService service;
	
	@Autowired	
	public void setSearchService(SearchService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/SearchTeamForm",method=RequestMethod.GET)
	public String form(@ModelAttribute("command") SearchTeamDTO dto,HttpServletRequest req,Model model) {
		System.out.println("[프로젝트룸] ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");

		String id = req.getSession().getAttribute("id").toString();
		
		dto.setSort("regdate");
		dto.setSort_way("DESC");
		
		model.addAttribute("cart",getCart(req));
		model.addAttribute("recomend",getRecomendTeam(id));
		return "LSH/SearchTeam"; 
	}
	
	public List<ResultTeamDTO> getRecomendTeam(String id){
		List<ResultTeamDTO> Recomend_Team = new ArrayList<ResultTeamDTO>();
		if(!id.equals("amajoinus@gmail.com")) {
			Map<String,Object> map = service.getMy_fav(id);
			Recomend_Team = service.recommend_Team(map);			
		}
/*		for(ResultTeamDTO m : Recomend_Team) {System.out.println(m);}*/		
		return Recomend_Team;
	} 
	
	@RequestMapping(value="/SearchTeamForm",method=RequestMethod.POST)
	public String post(@ModelAttribute("command") SearchTeamDTO dto,HttpServletRequest req,Model model) {
		System.out.println("[프로젝트룸] 포스트실행"+dto);
		PagingDTO pdto = DB(dto,0);
		model.addAttribute("pdto",pdto);
		model.addAttribute("cart",getCart(req));
		model.addAttribute("recomend",getRecomendTeam(req.getSession().getAttribute("id").toString()));
		return "LSH/SearchTeam";
	}
	
	@RequestMapping(value="/TeamSort",method=RequestMethod.POST)
	public void sort(SearchTeamDTO dto,int pageNum,HttpServletResponse resp) throws Exception{

		System.out.println("[프로젝트룸](∩ 'ω')⊃━♡°.*・｡♡° 정렬 :: "+ dto);
		resp.setContentType("text/html;charset=utf-8");
		Date today = new Date();
		String str = "";
		
		if(dto.getChecking().equals("y")) {
			if(dto.getStart_d().isEmpty()) {
				str = new SimpleDateFormat("yyyy-MM-dd").format(today);
				dto.setStart_d(str);
				System.out.println("비어있음"+str);
			}else {
				Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dto.getStart_d());
				if(date.before(today)) {
					str = new SimpleDateFormat("yyyy-MM-dd").format(today);
					dto.setStart_d(str);
					System.out.println("현재보다작음"+str);
				}			
			}
		}
		
		PagingDTO pdto = DB(dto,pageNum);
		JSONObject jso = new JSONObject();
		jso.put("pdto", pdto);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}

	@RequestMapping(value="/ProjectProfile",method=RequestMethod.POST)
	public void profile(String pj_num,HttpServletResponse resp,HttpServletRequest req) throws Exception{

		System.out.println("[프로젝트룸] 상세보기 "+ pj_num);
		resp.setContentType("text/html;charset=utf-8");
		
		Map<String, Object> x = service.get_ProjectRoom(pj_num);
		
		if(!req.getSession().getAttribute("id").toString().equals("amajoinus@gmail.com")) {
			updateView(pj_num);
		}
		JSONObject jso = new JSONObject();
		jso.put("x", x);
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	
	@RequestMapping(value="/favorite",method=RequestMethod.POST)
	public void favorite(int pj_num,String login_id,String status,HttpServletResponse resp) throws Exception{

		System.out.println("[프로젝트룸] 스크랩 추가&삭제 "+ pj_num +"~"+ login_id+"~"+status);
		resp.setContentType("text/html;charset=utf-8");
		
		int result = service.favorite(pj_num,login_id,status);
		System.out.println("결과는? 두구두구:: "+result);
	}
	
	public void updateView(String pj_num) {

		Map<String,Object> m = new HashMap<String,Object>();
		m.put("what", pj_num);
		m.put("colum", "pj_view");
		m.put("table", "projectroom");
		m.put("where", "pj_num");
		int result = service.update_view(m);
		System.out.println("[-]조회수"+result);
	}
	
	public List<ProjectroomDTO> getCart(HttpServletRequest req) {
		List<ProjectroomDTO> list = service.getCart(req.getSession().getAttribute("id").toString());
		return list;
	}
	
	public PagingDTO DB(SearchTeamDTO dto,int pageNum) {

		if(pageNum == 0) {
			pageNum = 1;
		}

		int pageSize = 2;
		int pageBlock = 3;
		
		int rowCount = service.getNumberTeam(dto);
		int pageCount = (int) Math.ceil(rowCount/(double) pageSize);
		
		if(pageNum > pageCount) {
			pageNum = 1;
		}
		
		int endPage = (int) Math.ceil(pageNum/(double) pageBlock) * pageBlock;
		int startPage = (endPage - pageBlock) + 1;

		if(pageCount < endPage) {
			endPage = pageCount;
		}
		
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		
/*		System.out.print("::현재페이지"+pageNum+"::전체"+rowCount+"~첫글 번호"+startRow+"~끝글번호"+endRow);
		System.out.println("::페이지수 "+pageCount+" ::시작페이지 "+startPage+" ::끝페이지 "+endPage);
*/		
		dto.setStartRow(startRow);
		dto.setEndRow(endRow);
		List<ResultTeamDTO> list = service.getResultTeam(dto);
		
		for(ResultTeamDTO mm : list) {
			if(mm.getFavs() != null) {
				String[] strarr = mm.getFavs().split(",");
				for(String str : strarr) {
					if(str.equals(mm.getPj_num()+"")) {
						mm.setFavs("YES");
					}
				}
			}
		}
		
		PagingDTO pdto = new PagingDTO(pageNum,rowCount,pageCount,startPage,endPage,list,pageBlock);
		
		return pdto;
	}

	
}
