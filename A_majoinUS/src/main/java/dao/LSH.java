package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import controller.LSH.ProfileDTO;
import controller.LSH.ResultDTO;
import controller.LSH.ResultTeamDTO;
import controller.LSH.SearchDTO;
import controller.LSH.SearchTeamDTO;
import project.DTO.AlarmDTO;
import project.DTO.IssueDTO;

@Repository
public class LSH extends SqlSessionDaoSupport{

	public List<String> getCategory1(String mapper,String col){
		List<String> cate1 = getSqlSession().selectList(mapper,col);
		return cate1;
	}
	
	public List<String> getCategory2(String mapper,String col){
		List<String> cate2 = getSqlSession().selectList(mapper,col);
		return cate2;
	}
	
	public List<ResultDTO> getResult(String mapper,SearchDTO dto){
		List<ResultDTO> result = getSqlSession().selectList(mapper,dto);
		return result;
	}
	
	public int getNumber(String mapper,SearchDTO dto){
		int result = getSqlSession().selectOne(mapper,dto);
		return result;
	}
	
	public List<ResultTeamDTO> getTeamResult(String mapper,SearchTeamDTO dto){
		List<ResultTeamDTO> result = getSqlSession().selectList(mapper,dto);
		return result;
	}
	
	public int getTeamNumber(String mapper,SearchTeamDTO dto){
		int result = getSqlSession().selectOne(mapper,dto);
		return result;
	}
	
	public List<HashMap<String,Object>> getMyProject(String mapper,String id){
		List<HashMap<String,Object>> list = getSqlSession().selectList(mapper,id);
		return list;
	}
	
	public int insert_Message(String mapper,AlarmDTO dto){
		int x = getSqlSession().insert(mapper,dto);
		return x;
	}

	public int map_insert(String mapper,Map<String,Object> m){
		int x = getSqlSession().insert(mapper,m);
		return x;
	}
	
	public int map_delete(String mapper,Map<String,Object> m){
		int x = getSqlSession().delete(mapper,m);
		return x;
	}
	
	// 유저 프로필정보 //
	public List<ProfileDTO> getProfile(String mapper,Map<String,Object> ids){
		List<ProfileDTO> x = getSqlSession().selectList(mapper, ids);
		return x;
	}

	// 프로젝트룸 정보 // 
	public Map<String, Object> getProjectRoom(String mapper,String pj_num){
		HashMap<String, Object> x = getSqlSession().selectOne(mapper, pj_num);
		return x;
	}

	public int check_issue(String mapper,IssueDTO dto){
		int x = getSqlSession().selectOne(mapper,dto);
		return x;
	}
	
	public int insert_issue(String mapper,IssueDTO dto){
		int x = getSqlSession().insert(mapper,dto);
		return x;
	}
	
	public int count_issue(String mapper,IssueDTO dto){
		int x = getSqlSession().selectOne(mapper,dto);
		return x;
	}
	public int update_black(String mapper,String id){
		int x = getSqlSession().update(mapper,id);
		return x;
	}
	
	// 뷰 업데이트 // 
	public int update_view(String mapper,Map<String,Object> m){
		int x = getSqlSession().update(mapper,m);
		return x;
	}
	
	// 프로젝트룸  //
	public List<Map<String,Object>> getProgress(String mapper,int n){
		List<Map<String,Object>> x = getSqlSession().selectList(mapper, n);
		return x;
	}	
	
	public int updateLeader(String mapper,Map<String,Object> m) {
		int x = getSqlSession().update(mapper,m);
		return x;
	}
}
