package dao.LSHdao;

import java.util.List;

import project.DTO.Todo_listDTO;

public interface TodoDAO {
	
	public List<Todo_listDTO> getTodo(String id);
	
	public void insertTodo(Todo_listDTO dto);
	
	public void deleteTodo(List<String> num);

	public void updateFin(String action,String dto);

}
