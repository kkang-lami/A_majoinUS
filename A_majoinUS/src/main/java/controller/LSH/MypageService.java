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

	public int updateFin(String num){
		int x = 0;
		try {
			x = dao.updateFin("LSH_AUS.updateFin",num);
		}catch (Exception e) {
			System.out.println("[에러] updateFin서비스실패 ::"+e.toString());
		}
		return x;
	}
	
	public int deleteFin(String num){
		int x = 0;
		try {
			System.out.println("실행");
			x = dao.deleteFin("LSH_AUS.deleteFin",num);
			System.out.println(x);
		}catch (Exception e) {
			System.out.println("[에러] deleteFin서비스실패 ::"+e.toString());
		}
		return x;
	}
	
	public int deleteTodo(List<String> num){
		int x = 0;
		try {
			x = dao.deleteTodo("LSH_AUS.deleteTodo",num);
		}catch (Exception e) {
			System.out.println("[에러] deleteTodo서비스실패 ::"+e.toString());
		}
		return x;
	}

	
}
