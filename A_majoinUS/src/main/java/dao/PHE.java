package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import controller.PHE.ProjectListDTO;
import controller.PHE.ReviewByMeDTO;
import project.DTO.AlarmDTO;
import project.DTO.FollowDTO;
import project.DTO.Pj_jobDTO;
import project.DTO.Pj_locationDTO;
import project.DTO.Port_detailDTO;
import project.DTO.PortfolioDTO;
import project.DTO.ProjectroomDTO;
import project.DTO.ReviewDTO;

public class PHE extends SqlSessionDaoSupport {

	// create
	public int createProject(ProjectroomDTO prDTO) {
		int x = getSqlSession().insert("PHE_AUS.createProject", prDTO);
		return x;
	}

	public int createProjectJob(Pj_jobDTO jobDTO) {

		int y = getSqlSession().insert("PHE_AUS.createProjectJob", jobDTO);
		return y;
	}

	public int createProjectLocation(Pj_locationDTO locDTO) {

		int z = getSqlSession().insert("PHE_AUS.createProjectLocation", locDTO);
		return z;
	}

	// list
	public List<ProjectroomDTO> getListData() {
		List<ProjectroomDTO> dto = getSqlSession().selectList("PHE_AUS.projectList");
		return dto;
	}

	// 진행중
	public List<ProjectListDTO> ongoing_getListData(String id) {
		List<ProjectListDTO> dto = getSqlSession().selectList("PHE_AUS.ongoing_projectList", id);
		return dto;
	}
	//완료
	public List<ProjectListDTO> finish_getListData(String id) {
		System.out.println("완료된 프로젝트 리스트 ");
		List<ProjectListDTO> dto = getSqlSession().selectList("PHE_AUS.finish_projectList", id);
		return dto;
	}

	// read
	public ProjectroomDTO read(int pj_num) {
		return getSqlSession().selectOne("PHE_AUS.projectContent", pj_num);
	}

	public Pj_jobDTO read2(int pj_num) {
		return getSqlSession().selectOne("PHE_AUS.projectContent_job", pj_num);
	}

	public Pj_locationDTO read3(int pj_num) {
		return getSqlSession().selectOne("PHE_AUS.projectContent_location", pj_num);
	}

	// delete
	public int deleteProject(int pj_num) {
		int x = getSqlSession().delete("PHE_AUS.projectDelete", pj_num);
		return x;
	}

	public int deleteProject_job(int pj_num) {
		int x = getSqlSession().delete("PHE_AUS.projectDelete_job", pj_num);
		return x;
	}

	public int deleteProject_location(int pj_num) {
		int x = getSqlSession().delete("PHE_AUS.projectDelete_location", pj_num);
		return x;
	}

	// modify
	public int projectModify(ProjectroomDTO dto) {
		int x = getSqlSession().update("PHE_AUS.projectModify", dto);
		System.out.println("projectModify");

		return x;
	}

	public int projectModify_job(Pj_jobDTO dto) {
		int x = getSqlSession().update("PHE_AUS.projectModify_job", dto);
		System.out.println("projectModify_job");

		return x;
	}

	public int projectModify_location(Pj_locationDTO dto) {
		int x = getSqlSession().update("PHE_AUS.projectModify_location", dto);
		System.out.println("projectModify_location");

		return x;
	}

	/********************************* 후기 게시판 *************************************/

	// 나에 대한 후기
	public List<ReviewDTO> getReviewListForMe(String id) {
		List<ReviewDTO> dto = getSqlSession().selectList("PHE_AUS.reviewListForMe", id);
		return dto;
	}

	// 내가 쓴 후기
	public List<ReviewByMeDTO> getReviewListByMe(String id) {
		List<ReviewByMeDTO> dto = getSqlSession().selectList("PHE_AUS.reviewListByMe", id);
		return dto;
	}

	/********************************* 팔로우 *************************************/
	public List<FollowDTO> getFollowList(String id) {
		List<FollowDTO> dto = getSqlSession().selectList("PHE_AUS.followList", id);
		return dto;
	}

	/********************************* 포트폴리오 *************************************/
	// 포트폴리오 리스트
	public List<PortfolioDTO> getPortfolioList(String id) {
		List<PortfolioDTO> dto = getSqlSession().selectList("PHE_AUS.portfolioList", id);
		return dto;
	}

	// 포트폴리오 상세보기
	public PortfolioDTO getPortfolioContent(int port_num) {
		System.out.println("portfolioContent(int port_num)" + port_num);
		return getSqlSession().selectOne("PHE_AUS.portfolioContent", port_num);
	}

	// 포트폴리오 상세보기2(이미지와 설명)
	public List<Port_detailDTO> getPortfolioContent_detail(int port_num) {
		System.out.println("getPortfolioContent_detail(int port_num) " + port_num);
		return getSqlSession().selectList("PHE_AUS.portfolioContent_detail", port_num);
	}

	/********************************* 알람 리스트 *************************************/

	// 알람 리스트
	public List<AlarmDTO> getProjectAlarmList(String receiver) {
		List<AlarmDTO> dto = getSqlSession().selectList("PHE_AUS.projectAlarmList", receiver);
		return dto;
	}

	// 프로젝트 참가+초대 알림
	public List<AlarmDTO> getProjectApplyAlarm(String receiver, String a_type) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("receiver", receiver);
		parameters.put("a_type", a_type);

		System.out.println("초대알림DAO");
		System.out.println("parameters : " + parameters);
		return getSqlSession().selectList("PHE_AUS.projectApplyAlarm", parameters);
	}

	// 참가 하고있는지 확인
	public int searchMember(String id, int pj_num) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("id", id);
		parameters.put("pj_num", pj_num);
		int x = getSqlSession().selectOne("PHE_AUS.searchMember", parameters);
		System.out.println("pj_mem search : "+x);
		return x;
	}
	
	public int projectMember(int pj_num) {
		int x = getSqlSession().selectOne("PHE_AUS.projectMember", pj_num);
		return x;
	}
	
	public int project_Max_count(int pj_num) {
		int x = getSqlSession().selectOne("PHE_AUS.project_Max_count", pj_num);
		return x;
	}
	
	// 프로젝트 참가 수락 -초대/제안 모두-
	public int acceptMember(String id, int pj_num) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("id", id);
		parameters.put("pj_num", pj_num);
		System.out.println("참가신청 수락DAO-Pj_mem에 insert");
		System.out.println("parameters : " + parameters);
		int x = getSqlSession().insert("PHE_AUS.acceptMember", parameters);
		System.out.println("pj_mem에 insert"+x);
		return x;
	}

	// 알람테이블에서 제거 -참가-
	public int removeFromAlarm_apply(String sender, int pj_num) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("sender", sender);
		parameters.put("pj_num", pj_num);
		System.out.println("참가신청 수락DAO-Alarm에서 delete");
		System.out.println("parameters : " + parameters);
		int x = getSqlSession().delete("PHE_AUS.removeFromAlarm_apply", parameters);
		System.out.println("alarm테이블에서 삭제 x : "+ x);
		return x;
	}

	// 알람테이블에서 제거 -초대-
	public int removeFromAlarm_invitation(String receiver, int pj_num) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("receiver", receiver);
		parameters.put("pj_num", pj_num);

		System.out.println("참가신청 수락DAO-Alarm에서 delete");
		System.out.println("parameters : " + parameters);
		int x = getSqlSession().delete("PHE_AUS.removeFromAlarm_invitation", parameters);
		return x;
	}

	/**************************** 프로젝트 리스트 ***********************************/
	// 내가 신청한 프로젝트
	public List<AlarmDTO> apply_getListData(String sender, String a_type) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("sender", sender);
		parameters.put("a_type", a_type);
		System.out.println(parameters);
		return getSqlSession().selectList("PHE_AUS.apply_projectList", parameters);
	}

	// 날짜
	public Map<String, String> Project_Date(int pj_num) {

		Map<String, String> date = getSqlSession().selectOne("PHE_AUS.project_Date", pj_num);
		System.out.println("date : " + date);
		return date;
	}

	// 프로젝트 생성 pj_mem 삽입
	public int insertToPjMem(String id) {
		System.out.println("dao : " + id);
		return getSqlSession().insert("PHE_AUS.insertToPjMem", id);
	}

	// 멤버 총원 카운트
	public int memberCount(int pj_num) {
		System.out.println(" 멤버 총원 카운트 DAO : pj_num" + pj_num);
		return getSqlSession().selectOne("PHE_AUS.memberCount", pj_num);
	}

	// 최대 멤버
	public int memberLimit(int pj_num) {
		System.out.println(" 최대 멤버DAO : pj_num" + pj_num);
		return getSqlSession().selectOne("PHE_AUS.memberLimit", pj_num);
	}

	// 프로젝트에 이미 참여중인지 아닌지
	public String memberCheck(String id, int pj_num) {

		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("id", id);
		parameters.put("pj_num", pj_num);
		System.out.println("해당 프로젝트에 참여중인가? DAO : " + parameters);

		return getSqlSession().selectOne("PHE_AUS.memberCheck", parameters);
	}

	/********************************* Ticket *************************************/

	public int ticketCount(String t_status, String id) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("t_status", t_status);
		parameters.put("id", id);
		System.out.println("ticket 카운트 DAO :" + parameters);
		return getSqlSession().selectOne("PHE_AUS.ticketCount", parameters);
	}

	public int useTicket(String id) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("t_status1", "사용완료");
		parameters.put("t_status2", "미사용");
		parameters.put("id", id);
		System.out.println("티켓사용 : " + parameters);
		int x = getSqlSession().update("PHE_AUS.useTicket", parameters);
		return x;
	}

}
