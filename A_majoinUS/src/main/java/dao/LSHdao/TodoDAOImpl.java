package dao.LSHdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import project.DTO.Todo_listDTO;

@Repository
public class TodoDAOImpl implements TodoDAO{

	private static String namespace = "LSH_AUS.";
	private final SqlSession sqlSession;
	
	@Override
	public List<Todo_listDTO> getTodo(String id) {
		return sqlSession.selectList(namespace+"getTodo",id);
	}

	@Override
	public void insertTodo(Todo_listDTO dto) {
		sqlSession.selectList(namespace+"insertTodo",dto);
	}

	@Override
	public void deleteTodo(List<String> num) {
		sqlSession.selectList(namespace+"deleteTodo",num);
	}

	@Override
	public void updateFin(String action,String dto) {
		sqlSession.selectList(namespace+action,dto);
	}

	//@Inject
	public TodoDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
}
