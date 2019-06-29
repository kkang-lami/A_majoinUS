package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import controller.PHE.ProjectAlarmListDTO;
import controller.PHE.ProjectListDTO;
import project.DTO.AlarmDTO;
import project.DTO.Category_2DTO;
import project.DTO.HolidayDTO;
import project.DTO.IssueDTO;
import project.DTO.MemberDTO;
import project.DTO.PageDTO;
import project.DTO.PaymentDTO;
import project.DTO.Point_statDTO;
import project.DTO.ProjectroomDTO;
import project.DTO.Review_adminDTO;
import project.DTO.ScheduleDTO;
import project.DTO.Visit_statDTO;

public class JEJ extends SqlSessionDaoSupport{
	//회원 마이페이지 메인	
	// 프로젝트 참가+초대 알림
	public List<ProjectAlarmListDTO> getProjectApplyAlarm(String receiver, String a_type) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("receiver", receiver);
		parameters.put("a_type", a_type);

//		System.out.println("초대알림DAO");
//		System.out.println("parameters : " + parameters);
		return getSqlSession().selectList("JEJ_AUS.projectApplyAlarm", parameters);
	}
	
	//진행중인 프로젝트
	public List<ProjectListDTO> ongoing_getListData(String id) {
		List<ProjectListDTO> dto = getSqlSession().selectList("JEJ_AUS.ongoing_projectList", id);
		return dto;
	}
	
	//프로젝트 스케줄	
	public int get_h_num() {
		int h_num = getSqlSession().selectOne("JEJ_AUS.h_num");
		return h_num;
	}

	
	public HolidayDTO insert_holiday(String holiday_name, String holiday_start, String holiday_end, int pj_num) {
		HolidayDTO holiday = new HolidayDTO();
		holiday.setPj_num(pj_num);
		holiday.setH_name(holiday_name);
		holiday.setH_start(holiday_start);
		holiday.setH_end(holiday_end);
		
		getSqlSession().insert("JEJ_AUS.holiday_add",holiday);
		return holiday;
	}
	
	public void insert_schedule(ScheduleDTO dto) {		
		getSqlSession().insert("JEJ_AUS.schedule_add", dto);
	}
	
	public void Addschedule(int pj_num, String s_start, String s_end, String s_content) {
		HolidayDTO dto = new HolidayDTO();
		dto.setH_num(pj_num);
		dto.setH_start(s_start);
		dto.setH_end(s_end);
		dto.setH_name(s_content);
		
		getSqlSession().insert("JEJ_AUS.holiday_add", dto);
	}
	
	public List<ScheduleDTO> select_schedule(int pj_num) {
		System.out.println(pj_num);
		List<ScheduleDTO> schedule = getSqlSession().selectList("JEJ_AUS.select_schedule",pj_num);
		return schedule;
	}
	
	
	//통계
	public int inquiry_stat() {
		int inquiry = getSqlSession().selectOne("JEJ_AUS.static_inquiry");
		return inquiry;
	}
	
	public int inquiry_stat_match() {
		int inquiry = getSqlSession().selectOne("JEJ_AUS.static_inquiry_ok");
		return inquiry;
	}
	
	public List<Visit_statDTO> visit_stat() {
		List<Visit_statDTO> visit = getSqlSession().selectList("JEJ_AUS.static_visit");
		return visit;
	}
	
	public List<Point_statDTO> pay_stat() { 
        List<Point_statDTO> pay = getSqlSession().selectList("JEJ_AUS.static_pay_stat");
        return pay;
     }
	 public int paysum(String day) { 
		 int paysum = 0;
		 String pay = getSqlSession().selectOne("JEJ_AUS.pay_count", day);
	     if(pay != null) {
	    	 paysum = Integer.parseInt(pay);
	     }
	     return paysum;
	 }
	   
	   public Point_statDTO insert_point(String pay_date, int pay_price) { 
	      Point_statDTO point = new Point_statDTO();
	      point.setPay_date(pay_date);
	      point.setPay_price(pay_price);
	      
	      getSqlSession().insert("JEJ_AUS.pay_stat",point);
	      return point;
	   }

	
	public List<Integer> count_project() {
		List<Integer> count = getSqlSession().selectList("JEJ_AUS.count_project");
		return count;
	}
	
	public int all_project() {
		int allProject = getSqlSession().selectOne("JEJ_AUS.static_project");
		return allProject;
	}
	
	public int match_project(int pj_num) {		
		Map<String, Integer> params = new HashMap();
		params.put("pj_num", pj_num);
		params.put("pj_num1", pj_num);
		
		//System.out.println("하이"+pj_num);
		
		int matchProject = getSqlSession().selectOne("JEJ_AUS.static_project_match",params);
		//System.out.println("matchproject"+matchProject);
		return matchProject;
	}
	
	//결제 내역	
	public List<PaymentDTO> getPaymentList(int d_yy, int d_mm) {
		Map<String, Integer> params = new HashMap();
		params.put("d_yy", d_yy);
		params.put("d_mm", d_mm);
		
		List<PaymentDTO> payment_list =  getSqlSession().selectList("JEJ_AUS.payment_list", params);
		return payment_list;
	}
	
	
	//카테고리 관리
	public List<Category_2DTO> getCategoryList() {
		List<Category_2DTO> category_list = getSqlSession().selectList("JEJ_AUS.select_cate");
		return category_list;
	}
	
	 public List<Category_2DTO> getCategoryList2() {
	      List<Category_2DTO> category_list = getSqlSession().selectList("JEJ_AUS.select_cate_1");
	      return category_list;
	   }

	
	public void deleteCate(int c_2_num) {
		getSqlSession().delete("JEJ_AUS.delete_cate",c_2_num);				
	}
	
	public List<Category_2DTO> selectoneCate(int c_2_num) {
		List<Category_2DTO> category = getSqlSession().selectList("JEJ_AUS.select_one_cate", c_2_num);
		return category;
	}
	
	public void updateCate(int cate_1_num, String c_1_name, String c_2_name, int c_2_num) {
		Category_2DTO cate = new Category_2DTO();
		cate.setCate_1_num(cate_1_num);
		cate.setC_1_name(c_1_name);
		cate.setC_2_name(c_2_name);
		cate.setC_2_num(c_2_num);
		
		getSqlSession().update("JEJ_AUS.update_cate1",cate);
		getSqlSession().update("JEJ_AUS.update_cate2",cate);
	}
	
	public void updateFavorite(String table, String column, String c_1_name, String c_2_name, String c_1_past, String c_2_past) {
		Map<String, String> params = new HashMap();
		params.put("table", table);
		params.put("column", column);
		params.put("c_1_name", c_1_name);
		params.put("c_2_name", c_2_name);
		params.put("c_1_past", c_1_past);
		params.put("c_2_past", c_2_past);
		
		getSqlSession().update("JEJ_AUS.update_favorite",params);
	}
	
/*	public void updateFavorite_job(String c_1_name, String c_2_name, String c_1_past, String c_2_past) {
		Map<String, String> params = new HashMap();
		params.put("c_1_name", c_1_name);
		params.put("c_2_name", c_2_name);
		params.put("c_1_past", c_1_past);
		params.put("c_2_past", c_2_past);
		
		getSqlSession().update("JEJ_AUS.update_favoriteJob",params);
	}*/
	
	//회원 관리
	public List<MemberDTO> excel_member() {
		List<MemberDTO> member = getSqlSession().selectList("JEJ_AUS.excel_member");
		return member;
	}
	
	public int count_member() {
		int count = getSqlSession().selectOne("JEJ_AUS.count_member");
		return count;
	}
	
	public List<MemberDTO> getMember(PageDTO dto) {
		List<MemberDTO> member = getSqlSession().selectList("JEJ_AUS.admin_member",dto);
		return member;
	}
	
	public int member_search_count(String search, String string) {		
		PageDTO s = new PageDTO();
		s.setSearch(search);
		s.setString(string);
		
		int count = getSqlSession().selectOne("JEJ_AUS.member_search_count",s);
		return count;
	}
	
	public List<MemberDTO> member_search_list(String search, String string, int startRow, int endRow) {
		PageDTO s = new PageDTO();
		s.setSearch(search);
		s.setString(string);
		s.setEndRow(endRow);
		s.setStartRow(startRow);
		
		List<MemberDTO> dto = getSqlSession().selectList("JEJ_AUS.member_search_list",s);
		return dto;
	}
	
	public void updateBlackList(String id) {
		getSqlSession().update("JEJ_AUS.update_blackList",id);
	}
	
	public void autoBlackList() {
		getSqlSession().update("JEJ_AUS.auto_blackList");
	}

	
	//블랙리스트 관리
	public List<MemberDTO> getBlackList() {
		List<MemberDTO> blackList = getSqlSession().selectList("JEJ_AUS.view_blackList");
		return blackList;
	}
	
	public void updateBlackListBack(String id) {
		getSqlSession().update("JEJ_AUS.update_blackList_Back",id);				
	}
	
	
	//프로젝트룸 관리
	public int count_projectroom() {
		int count = getSqlSession().selectOne("JEJ_AUS.count_projectroom");
		return count;
	}
	
	public int projectroom_search_count(String search, String string) {
		
		PageDTO s = new PageDTO();
		s.setSearch(search);
		s.setString(string);
		
		int count = getSqlSession().selectOne("JEJ_AUS.projectroom_search_count",s);
		return count;
	}
	
	public List<ProjectroomDTO> projectroom_search_list(String search, String string, int startRow, int endRow) {
		PageDTO s = new PageDTO();
		s.setSearch(search);
		s.setString(string);
		s.setEndRow(endRow);
		s.setStartRow(startRow);
		
		List<ProjectroomDTO> dto = getSqlSession().selectList("JEJ_AUS.projectroom_search_list",s);
		return dto;
	}
	
	public List<ProjectroomDTO> getProjectroom(PageDTO dto) {
		List<ProjectroomDTO> projectroom = getSqlSession().selectList("JEJ_AUS.admin_projectroom",dto);
		return projectroom;
	}
	
	//신고 관리
	public int countMemberIssue() {
		int issue = getSqlSession().selectOne("JEJ_AUS.count_member_issue");
		return issue;
	}
	
	public int countRoomIssue() {
		int issue = getSqlSession().selectOne("JEJ_AUS.count_room_issue");
		return issue;
	}
	
	public List<IssueDTO> getMemberIssuePage(PageDTO dto) {
		List<IssueDTO> issue = getSqlSession().selectList("JEJ_AUS.admin_issue_page_mem", dto);
		return issue;
	}
	
	public List<IssueDTO> getRoomIssuePage(PageDTO dto) {
		List<IssueDTO> issue = getSqlSession().selectList("JEJ_AUS.admin_issue_page_room",dto);
		return issue;
	}
	
	public List<IssueDTO> getMemberIssue() {
		List<IssueDTO> member_issue = getSqlSession().selectList("JEJ_AUS.admin_issue_member");
		return member_issue;
	}
	
	public List<IssueDTO> getProjectIssue() {
		List<IssueDTO> project_issue = getSqlSession().selectList("JEJ_AUS.admin_issue_project");
		return project_issue;
	}
	
	//평가 관리
	
	public int countReview() {
		int review = getSqlSession().selectOne("JEJ_AUS.count_review_admin");
		return review;
	}
	
	public List<Review_adminDTO> getReviewList() {
		List<Review_adminDTO> admin_review = getSqlSession().selectList("JEJ_AUS.admin_reviewList");
		return admin_review;
	}
	
	public List<Review_adminDTO> getReviewPage(PageDTO dto) {
		List<Review_adminDTO> admin_review = getSqlSession().selectList("JEJ_AUS.admin_review_page", dto);
		return admin_review;
	}
	
	  public List<Review_adminDTO> getReviewName() {
	      List<Review_adminDTO> admin_review_name = getSqlSession().selectList("JEJ_AUS.select_review_name");
	      return admin_review_name;
	   }
	  
	  
	  
	  
	  public int countVisit(String visit12) {
	      int visit = getSqlSession().selectOne("JEJ_AUS.count_visit_1",visit12);
	      return visit;
	   }
	   
	   public void insertVisit(String visit_date) {
	      getSqlSession().insert("JEJ_AUS.insert_visit",visit_date);
	   }
	   
	   public void updateVisit(String visit_date) {
	      
	      getSqlSession().update("JEJ_AUS.update_visit",visit_date);
	   }

}
