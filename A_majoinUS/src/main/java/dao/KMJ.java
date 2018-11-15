package dao;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import project.DTO.*;

public class KMJ extends SqlSessionDaoSupport{
	
	
	/*            fileboard            */
	
	public int memcheck(Pj_memDTO pm) {
		
		int check = getSqlSession().selectOne("KMJ_AUS.memCheck", pm);
		
		return check;
	}
	
	public void fileupload(FileboardDTO fdto) {
		getSqlSession().insert("KMJ_AUS.fileboardInsert",fdto);
	}
	
	public List<FileboardDTO> fileboardlist(int pj_num) {
		
		List<FileboardDTO> f_list = getSqlSession().selectList("KMJ_AUS.fileboardlist",pj_num);
		
		return f_list;
	}
	
	public FileboardDTO fileselect(int fb_num) {
		FileboardDTO fdb = getSqlSession().selectOne("KMJ_AUS.selectfile",fb_num);
		return fdb;
	}
	
	public void filedelete(int fb_num) {
		getSqlSession().delete("KMJ_AUS.deletefile",fb_num);
	}
	
	//////////////////////////////////////////////////////////////////
	/*       workboard         */
	
	
	public void update_workstate(int pj_num) {
		getSqlSession().update("KMJ_AUS.updatestate",pj_num);
	}
	
	public List<Project_workboardDTO> workboard(int pj_num){
		
		List<Project_workboardDTO> board = getSqlSession().selectList("KMJ_AUS.workboardlist",pj_num);
		
		return board;
		
	}
	
	public List<Project_workboardDTO> workboard(Project_workboardDTO pwdto){
		List<Project_workboardDTO> board = getSqlSession().selectList("KMJ_AUS.memberwork",pwdto);
		
		return board;
	}
	
	
	public String searchMaster(int pj_num) {
		
		String master = getSqlSession().selectOne("KMJ_AUS.projectMaster",pj_num);
		
		return master;
	}
	
	public List<MemberWorkCountDTO> workcount(int pj_num){
		List<MemberWorkCountDTO> mwc = getSqlSession().selectList("KMJ_AUS.MemberWorkCount",pj_num);
		return mwc;
		
	}
	
	public List<Pj_memDTO> selectMember(int pj_num) {
		
		List<Pj_memDTO> pjmdto = getSqlSession().selectList("KMJ_AUS.selectMember",pj_num);
		return pjmdto;
		
	}
	
	public void workboardwrite(Project_workboardDTO pwdto) {
		
		getSqlSession().insert("KMJ_AUS.insertworkboard",pwdto);
	}
	
	public Project_workboardDTO workdetail(int pw_num) {
		Project_workboardDTO pwdto = getSqlSession().selectOne("KMJ_AUS.workdetail",pw_num);
		
		return pwdto;
	}
	
	public void completstate(int pw_num) {
		getSqlSession().update("KMJ_AUS.complet",pw_num);
	}
	
	public void editwork(Project_workboardDTO pwdto) {
		getSqlSession().update("KMJ_AUS.editmemberwork",pwdto);
	}
	
	public void deletework(int pw_num) {
		getSqlSession().delete("KMJ_AUS.deleteMemberwork",pw_num);
	}
	
	public void insertComment(Workboard_commentDTO wcdto) {
		getSqlSession().insert("KMJ_AUS.insertcomment",wcdto);
	}
	
	public List<Workboard_commentDTO> commentList(int pw_num){
		List<Workboard_commentDTO> wc = getSqlSession().selectList("KMJ_AUS.selectcomment",pw_num);
		return wc;
	}
	
	public int commentCount(int pw_num) {
		int count = getSqlSession().selectOne("KMJ_AUS.commentcount",pw_num);
		
		return count;
	}
	
	public Workboard_commentDTO getNewComment(Map<String,Integer> map) {
		Workboard_commentDTO wcdto = getSqlSession().selectOne("KMJ_AUS.newComment",map);
		
		return wcdto;
	}
	
	public void deletecomment(int wc_num) {
		getSqlSession().delete("KMJ_AUS.delcomment",wc_num);
	}
	
	
	/////////////////////////////////////////////////////////////////////////
	/*         chatting          */
	
	public List<Project_chatDTO> chatList(int pj_num){
		
		List<Project_chatDTO> chatlist = getSqlSession().selectList("KMJ_AUS.chatlist",pj_num);
		
		return chatlist;
	}
	
	public void chatdatainsert(Project_chatDTO chatdto) {
		getSqlSession().insert("KMJ_AUS.chatinsert",chatdto);
	}
	
	public String searchname(Map<String, Object> map) {
		
		String name = getSqlSession().selectOne("KMJ_AUS.searchName",map);
		
		return name;
	}
	
	public void insertchat(Project_chatDTO chatdata) {
		
		getSqlSession().insert("KMJ_AUS.insertChat",chatdata);
	}
	
	/////////////////////////////////////////////////////////////////////////////////////
	/*			portfolioWriteForm			*/
	
	public Map<String,String> Project_Date(int pj_num){
		
		Map<String,String> date = getSqlSession().selectOne("KMJ_AUS.projectDate",pj_num);
		
		return date;
	}
	
	public void portfolioInsert(PortfolioDTO pf) {
		getSqlSession().insert("KMJ_AUS.portfolioinsert",pf);
		
	}
	
	public int pf_detail_seq() {
		
		int seq = 1;
		String sequence = getSqlSession().selectOne("KMJ_AUS.pf_detail_seq");
		
		if(sequence != null)
			seq = Integer.parseInt(sequence) + 1;

		return seq;
	
	}
	
	public int portfolioDetailInsert(Map<String,Object> map) {
		
		int i = getSqlSession().insert("KMJ_AUS.pofolDetail",map);
		
		return i;
	}
	
	public PortfolioDTO myportfolio(Map<String,Object> map){
		
		PortfolioDTO dto = getSqlSession().selectOne("KMJ_AUS.searchpofol",map);
		
		return dto;
	}
	
	public List<Port_detailDTO> pofolDetail(int port_num){
		
		List<Port_detailDTO> detail = getSqlSession().selectList("KMJ_AUS.search_pfDetail",port_num);
		
		return detail;
		
	}
	
	public void pf_detail_delete(Map<String,Object> del) {
		getSqlSession().delete("KMJ_AUS.delete_pf_Detail", del);
	}
	
	public void pf_detail_update(Map<String,Object> update_map) {
		getSqlSession().update("KMJ_AUS.update_pf_Detail", update_map);
	}
	
	public void portfolioUpdate(PortfolioDTO pf) {
		getSqlSession().update("KMJ_AUS.updatepf", pf);
	}
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////
	/*			Eval N Review			*/
	
	public List<Pj_memDTO> selectMember(Map<String,Object> map) {
		
		List<Pj_memDTO> memberlist = getSqlSession().selectList("KMJ_AUS.memberlist", map);
		
		return memberlist;
	}
	
	public int reviewcount() {
		int count = getSqlSession().selectOne("KMJ_AUS.countReview");
		
		return count;
	}
	
	public void MemberReview(Map<String,List<ReviewDTO>> map) {
		
		int check = getSqlSession().insert("KMJ_AUS.memberReview",map);
		
	}
	
	public void Review2Admin(Review_adminDTO admin) {
		
		getSqlSession().insert("KMJ_AUS.review2Admin",admin);
	}
	
	public void presentPoint(PointDTO point) {
		
		getSqlSession().insert("KMJ_AUS.presentPoint",point);
		
		getSqlSession().update("KMJ_AUS.memberTP",point);
		
		System.out.println("포인트 지급 완료");
		
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////
	
	public int ReviewWriteCheck(Map<String,Object> map) {
		
		int check = getSqlSession().selectOne("KMJ_AUS.ReviewWriteCheck",map);
		
		return check;
	}
	
	public int PortfolioWriteCheck(Map<String,Object> map) {
		
		int check = getSqlSession().selectOne("KMJ_AUS.PortfolioWriteCheck",map);
		
		return check;
	}
	
	public int getpjm_num(int pj_num,String id) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pj_num", pj_num);
		
		int pjm_num = getSqlSession().selectOne("KMJ_AUS.getpjm_num",map);
		
		return pjm_num;
	}
	
	
	public int idconfirm(String id) {
		int count = getSqlSession().selectOne("KMJ_AUS.idconfirm",id);
		return count;
	}
	
}
