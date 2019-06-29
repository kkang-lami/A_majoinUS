package controller.LSH;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import controller.LSH.DTO.ProfileDTO;
import controller.LSH.DTO.ResultDTO;
import controller.LSH.DTO.ResultTeamDTO;
import controller.LSH.DTO.SearchDTO;
import controller.LSH.DTO.SearchTeamDTO;
import dao.LSH;
import project.DTO.AlarmDTO;
import project.DTO.IssueDTO;
import project.DTO.PortfolioDTO;
import project.DTO.ProjectroomDTO;

@Service
public class SearchService {

	private LSH dao;

	@Autowired	
	public void setDao(LSH dao) {
		this.dao = dao;
	}
	
	public List<String> getLevel1(String col){
		List<String> list = null;
		try {
			list = dao.getCategory1("LSH_AUS.select1",col);
		}catch (Exception e) {
			System.out.println("[에러] Level1서비스실패 ::"+e.toString());
		}
		return list;
	}

	public List<String> getLevel2(String col){
		List<String> list = null;
		
		try {
			list = dao.getCategory1("LSH_AUS.select2",col);
		}catch (Exception e) {
			System.out.println("[에러] Level2서비스실패 ::"+e.toString());
		}
		return list;
	}

	public List<ResultDTO> getResult(SearchDTO dto){
		List<ResultDTO> list = null;
		try {
			list = dao.getResult("LSH_AUS.search",dto);
		}catch (Exception e) {
			System.out.println("[에러] Result서비스실패 ::"+e.toString());
		}
		return list;
	}
	
	public int getNumber(SearchDTO dto){
		int count = 0;
		try {
			count = dao.getNumber("LSH_AUS.searchNumber",dto);
		}catch (Exception e) {
			System.out.println("[에러] Number 서비스실패 ::"+e.toString());
		}
		return count;
	}
	
	public List<ResultTeamDTO> getResultTeam(SearchTeamDTO dto){
		List<ResultTeamDTO> list = null;
		try {
			list = dao.getTeamResult("LSH_AUS.searchTeam",dto);
		}catch (Exception e) {
			System.out.println("[에러] Result Team서비스실패 ::"+e.toString());
		}
		return list;
	}
	
	public int getNumberTeam(SearchTeamDTO dto){
		int count = 0;
		try {
			count = dao.getTeamNumber("LSH_AUS.searchTeamNumber",dto);
		}catch (Exception e) {
			System.out.println("[에러] Number Team서비스실패 ::"+e.toString());
		}
		return count;
	}

	public List<HashMap<String,Object>> getMyProject(String id){
		List<HashMap<String,Object>> list = null;
		try {
			list = dao.getMyProject("LSH_AUS.myProject", id);
		}catch (Exception e) {
			System.out.println("[에러] Number Team서비스실패 ::"+e.toString());
		}
		return list;
	}
	
	public int insert_Message(AlarmDTO dto){
		int x = 0;
		try {
			x = dao.insert_Message("LSH_AUS.insert_A", dto);
		}catch (Exception e) {
			System.out.println("[에러] 메세지 인서트 서비스 실패 ::"+e.toString());
		}
		return x;
	}

	public int follow(String id, String friend_id,String status){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("id", id);
		m.put("friend_id", friend_id);
		
		int x = 0;
		try {
			if(status.equals("add")) {
				x = dao.map_insert("LSH_AUS.follow", m);
				m.put("num", 1);
			}else {
				x = dao.map_delete("LSH_AUS.unfollow", m);
				m.put("num", -1);
			}
			x = dao.map_update("LSH_AUS.follow_update", m);
		}catch (Exception e) {
			System.out.println("[에러] 팔로우 서비스 실패 ::"+e.toString());
		}
		return x;
	}
	
	public int favorite(int pj_num,String id,String status){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("pj_num", pj_num);
		m.put("id",id);
		
		int x = 0;
		try {
			if(status.equals("add")) {
				x = dao.map_insert("LSH_AUS.star", m);
			}else {
				x = dao.map_delete("LSH_AUS.unstar", m);
			}
		}catch (Exception e) {
			System.out.println("[에러] 팔로우 서비스 실패 ::"+e.toString());
		}
		return x;
	}

	@Transactional										//Exception 발생시 rollback
	public int issue(IssueDTO dto){
		
		int count = 0;
		
		try {
			count = dao.check_issue("LSH_AUS.check_issue",dto);
			
			if(count<3) {
				dao.insert_issue("LSH_AUS.insert_issue",dto);
				count = dao.count_issue("LSH_AUS.count_issue",dto);
				System.out.println("[누적신고횟수]"+count);
				
				if(count>10) {
					System.out.println("[블랙리스트 추가]");
					dao.update_black("LSH_AUS.update_black",dto.getIssue_id());
				}
			}else {
				count = -1;
			}
			
		}catch (Exception e) {
			System.out.println("[에러] 신고 서비스 실패 ::"+e.toString());
		}
		return count;
	}
	
	@Transactional
	public Map<String, Object> get_project_profile(Map<String, Object> param) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();

		if(param.containsKey("view_count") && (boolean)param.get("view_count")) {
			update_view(new String[]{"project",(String)param.get("pj_num")});
		}
		
		try {
			map = dao.get_project_profile("LSH_AUS.getProjectRoom",(String)param.get("pj_num"));
			
			map.replace("START_D", map.get("START_D").toString().split(" ")[0]);
			map.replace("END_D", map.get("END_D").toString().split(" ")[0]);
			if(map.get("END_D").toString().split("-")[0].equals("2099")) {
				map.replace("END_D", "무기한");
			}
			
			
		}catch (Exception e) {
			System.out.println("[에러] 프로젝트룸 서비스 실패 ::"+e.toString());
			throw new Exception();
		} 
		return map;
	}
		
	@Transactional
	public Map<String,Object> get_user_profile(Map<String,Object> param) throws Exception{
		List<ProfileDTO> x = null;
		
		List<PortfolioDTO> port =  new ArrayList<PortfolioDTO>();		
		HashSet<String> count = new HashSet<String>();
		HashSet<String> review = new HashSet<String>();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(param.containsKey("view_count") && (boolean)param.get("view_count")) {
			update_view(new String[]{"user",(String)param.get("id")});
		}
		
		
		try {
			x = dao.getProfile("LSH_AUS.getProfile", param);
			
			for(ProfileDTO m : x) {
				if(m.getPort_num() != 0 && !count.contains(m.getPort_num()+"")) {
					port.add(new PortfolioDTO(m.getPort_num(),m.getSubject(),m.getStart_d(),m.getEnd_d(),m.getP_private()));
					count.add(""+m.getPort_num());
				}
				if(m.getReview_content() != null && !review.contains(m.getReview_content())){
					review.add(m.getReview_content());					
				}
			}
			
			map.put("profile", x.get(0));
			map.put("port", port);
			map.put("review", review);
			

		}catch (Exception e) {
			System.out.println("[에러] 프로필 가져오기 서비스 실패 ::"+e.toString());
			throw new Exception();
		}
		return map;
	}
	
	public void update_view(String[] arr){
		
		System.out.println("조회수 증가");

		Map<String,Object> m = new HashMap<String,Object>();
		
		if(arr[0].equals("user")) {
			
			m.put("what", arr[1]);
			m.put("colum", "mem_view");
			m.put("table", "member");
			m.put("where", "id");

		}else if(arr[0].equals("project")) {
			
			m.put("what", arr[1]);
			m.put("colum", "pj_view");
			m.put("table", "projectroom");
			m.put("where", "pj_num");
		}

		dao.update_view("LSH_AUS.update_view",m);
	}
	
	public List<ProjectroomDTO> getCart(String id){
		List<ProjectroomDTO> list = new ArrayList<ProjectroomDTO>();
		try {
			list = dao.getCart("LSH_AUS.getCart",id);
		}catch (Exception e) {
			System.out.println("[에러] 장바구니 서비스 실패 ::"+e.toString());
		}
		return list;	
	}
	
	public byte[] getportfolioImage(String imagePath) throws IOException {
		//위에서 정의한 변수명을 갖고와서 사용
		String rpath = "D:\\item\\"+imagePath; // 파일명의 전체 경로를 정의(그냥 문자열)
		Path path = Paths.get(rpath);			 // 정의한 경로(문자열)를 경로(절대경로)로 읽어들임
		byte[] data = Files.readAllBytes(path);  // 절대경로에있는 파일을 byte로 읽어온다
		return data;
	}
	
	public Map<String,Object> getMy_fav(String id){
		Map<String,Object> map= new HashMap<String,Object>();
		List<String> list = new ArrayList<String>();
		String[] arr = {};
		map.put("id", id);
		try {
			ResultDTO dto = dao.getMy_fav("LSH_AUS.getMy_fav",id);
			
			arr = dto.getF_cate().split(", ");
			for(int i=0 ; i<arr.length; i+=1) {
				list.add(arr[i]);
			}
			map.put("job", list);

			list = new ArrayList<String>();
			
			arr = dto.getF_loc().split(", ");
			for(int i=0 ; i<arr.length; i+=1) {
				list.add(arr[i]);
			}
			map.put("local", list);
		}catch (Exception e) {
			System.out.println("[에러] getMy_fav 서비스 실패 ::"+e.toString());
		}
		return map;
	}
	
	List<ResultTeamDTO> recommend_Team(Map<String,Object> map){
		List<ResultTeamDTO> list = new ArrayList<ResultTeamDTO>();
		try {
			list = dao.recommend_Team("LSH_AUS.recommend_Team",map);
			int len = list.size();
			if(len<3) {
				for(int i = 0; i < 3-len; i+=1) {
					list.add(new ResultTeamDTO());
				}
			}
			
		}catch (Exception e) {
			System.out.println("[에러] 팀추천 서비스 실패 ::"+e.toString());
		}
		return list;		
	}
	
	List<ResultDTO> recommend_User(Map<String,Object> map){
		List<ResultDTO> list = new ArrayList<ResultDTO>();
		try {
			list = dao.recommend_User("LSH_AUS.recommend_User",map);
			int len = list.size();
			if(len<3) {
				for(int i = 0; i < 3-len; i+=1) {
					list.add(new ResultDTO());
				}
			}
			
		}catch (Exception e) {
			System.out.println("[에러] 멤버추천 서비스 실패 ::"+e.toString());
		}
		return list;		
	}
}
