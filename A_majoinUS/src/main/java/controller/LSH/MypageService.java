package controller.LSH;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LSH;
import project.DTO.Todo_listDTO;

@Service
public class MypageService {

	private LSH dao;

	@Autowired	
	public void setDao(LSH dao) {
		this.dao = dao;
	}
	
	public List<Todo_listDTO> getTodo(String id){
		List<Todo_listDTO> list = null;
		try {
			list = dao.getTodo("LSH_AUS.getTodo",id);
		}catch (Exception e) {
			System.out.println("[에러] Level1서비스실패 ::"+e.toString());
		}
		return list;
	}
	
	public int insertTodo(Todo_listDTO dto){
		int x = 0;
		try {
			x = dao.insertTodo("LSH_AUS.insertTodo",dto);
		}catch (Exception e) {
			System.out.println("[에러] insertTodo서비스실패 ::"+e.toString());
		}
		return x;
	}

	public int updateTodo(Todo_listDTO dto){
		int x = 0;
		try {
			x = dao.updateTodo("LSH_AUS.updateTodo",dto);
		}catch (Exception e) {
			System.out.println("[에러] updateTodo서비스실패 ::"+e.toString());
		}
		return x;
	}
	
	public int deleteTodo(String num){
		int x = 0;
		try {
			x = dao.deleteTodo("LSH_AUS.deleteTodo",num);
		}catch (Exception e) {
			System.out.println("[에러] deleteTodo서비스실패 ::"+e.toString());
		}
		return x;
	}

	
}
