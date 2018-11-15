package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import project.DTO.*;

public class CEB extends SqlSessionDaoSupport{
	
//	notice board
		public int show_count() {
			int count = getSqlSession().selectOne("CEB_AUS.show_count");
			return count;
		}	
		  
		public List<NoticeDTO> show_list() {
			List<NoticeDTO> list = getSqlSession().selectList("CEB_AUS.show_list");
			return list;
		}
		
		public void add_article(NoticeDTO dto) {

			 getSqlSession().insert("CEB_AUS.insert_list",dto);
		}
		
		public NoticeDTO show_listOne(int num) {

			NoticeDTO dto = getSqlSession().selectOne("CEB_AUS.show_listOne", num);
			 return dto;
		}
		

		public void delete(int num) {

			 getSqlSession().delete("CEB_AUS.delete", num);
		}
		

		
		public void update(NoticeDTO dto) {
			 getSqlSession().update("CEB_AUS.update", dto);
		}
		
		public List<NoticeDTO> show_list1(PageDTO dto) {

			 List<NoticeDTO> list = getSqlSession().selectList("CEB_AUS.get_list",dto);
			 return list;
		}
		
		
		public int show_search_count(String search, String string) {

			PageDTO s = new PageDTO();
			s.setSearch(search);
			s.setString(string);
			
			int count = getSqlSession().selectOne("CEB_AUS.get_search_count",s);
			return count;
		}
		
		public List<NoticeDTO> show_search_list(String search, String string, int startRow, int endRow) {

			PageDTO s = new PageDTO();
			s.setSearch(search);
			s.setString(string);
			s.setEndRow(endRow);
			s.setStartRow(startRow);
			
			List<NoticeDTO> dto1 = getSqlSession().selectList("CEB_AUS.get_search_list",s);
			return dto1;
		}
	  
		
		public int next_num() {

			String num1 = getSqlSession().selectOne("CEB_AUS.next_num");
			int num;
			
			if(num1==null) {
				System.out.println("널임");
				num = 1;
			} else {
				num = Integer.parseInt(num1)+1;
			}
			return num;
		}
		
		
		
		//QnA
		
		public int show_count_1() {
			int count = getSqlSession().selectOne("CEB_AUS.show_count_1");
			return count;
		}	
		
		public List<QnADTO> show_list_1() {
			List<QnADTO> list = getSqlSession().selectList("CEB_AUS.show_list_1");
			return list;
		}
		
		public void add_article_1(QnADTO dto) {

			 getSqlSession().insert("CEB_AUS.insert_list_1",dto);
		}
		  
		public QnADTO show_listOne_1(int num) {

			QnADTO dto = getSqlSession().selectOne("CEB_AUS.show_listOne_1", num);
			 return dto;
		}
		
		
		  

		public void delete_1(int num) {

			 getSqlSession().delete("CEB_AUS.delete_1", num);
		}
		

		
		public void update_1(QnADTO dto) {
			 getSqlSession().update("CEB_AUS.update_1", dto);
		}
		
		public List<QnADTO> show_list1_1(PageDTO dto) {

			 List<QnADTO> list = getSqlSession().selectList("CEB_AUS.get_list_1",dto);
			 return list;
		}
		
		
		public int show_search_count_1(String search, String string) {

			PageDTO s = new PageDTO();
			s.setSearch(search);
			s.setString(string);
			
			int count = getSqlSession().selectOne("CEB_AUS.get_search_count_1",s);
			return count;
		}
		
		public List<QnADTO> show_search_list_1(String search, String string, int startRow, int endRow) {

			PageDTO s = new PageDTO();
			s.setSearch(search);
			s.setString(string);
			s.setEndRow(endRow);
			s.setStartRow(startRow);
			
			List<QnADTO> dto1 = getSqlSession().selectList("CEB_AUS.get_search_list_1",s);
			return dto1;
		}
	  
		
		public int next_num_1() {

			String num1 = getSqlSession().selectOne("CEB_AUS.next_num_1");
			int num;
			
			if(num1==null) {
				System.out.println("널임");
				num = 1;
			} else {
				num = Integer.parseInt(num1)+1;
			}
			return num;
		}
		
		
		//inquiry
		
		public int show_count_2() {
			int count = getSqlSession().selectOne("CEB_AUS.show_count_2");
			return count;
		}	
		
		public int show_count_id(String id) {  
			int count = getSqlSession().selectOne("CEB_AUS.show_count_id", id);
			return count;
		} 
		
		public List<InquiryDTO> show_list_2() {
			List<InquiryDTO> list = getSqlSession().selectList("CEB_AUS.show_list_2");
			return list;
		} 
		
		public void add_article_2(InquiryDTO dto) {

			 getSqlSession().insert("CEB_AUS.insert_list_2",dto);
		}
		
		public InquiryDTO show_listOne_2(int num) {

			InquiryDTO dto = getSqlSession().selectOne("CEB_AUS.show_listOne_2", num);
			 return dto;
		}
		
		public int show_count_answer() {
			int count = getSqlSession().selectOne("CEB_AUS.show_count_answer");
			return count;  
		}      
		
		public void update_2(InquiryDTO dto) {

			 getSqlSession().update("CEB_AUS.update_2", dto);
		}
		
		public List<InquiryDTO> show_list1_2(PageDTO dto) {

			 List<InquiryDTO> list = getSqlSession().selectList("CEB_AUS.get_list_2",dto);
			 return list;
		}
		
		
		public List<InquiryDTO> show_list1_id(int startRow, int endRow, String id) {
		    
			PageDTO s = new PageDTO();
			MemberDTO s1 = new MemberDTO(); 
			
			s.setEndRow(endRow);
			s.setStartRow(startRow);
			s1.setId(id);
			 
			 
			 Map<String,Object> dto = new HashMap<String,Object>();
				
				dto.put("endRow", endRow);
				dto.put("startRow", startRow);    
				dto.put("id", id);
				
				List<InquiryDTO> list = getSqlSession().selectList("CEB_AUS.show_list1_id",dto);
				
				return list;
				
		}
		
		
		
		public int show_search_count_2(String search, String string) {

			PageDTO s = new PageDTO();
			s.setSearch(search);
			s.setString(string);
			
			int count = getSqlSession().selectOne("CEB_AUS.get_search_count_2",s);
			return count;
		}
		
		public int show_search_count_id(String search, String string, String id) {

			PageDTO s = new PageDTO();
			MemberDTO s1 = new MemberDTO();
			
			s.setSearch(search);  
			s.setString(string);
			s1.setId(id);
			
			 Map<String,Object> dto = new HashMap<String,Object>();
				
				dto.put("search", search);    
				dto.put("string", string);    
				dto.put("id", id);
			
			int count = getSqlSession().selectOne("CEB_AUS.get_search_count_id",dto);
			return count;
		}
		
		public List<InquiryDTO> show_search_list_2(String search, String string, int startRow, int endRow) {

			PageDTO s = new PageDTO();
			s.setSearch(search);
			s.setString(string);
			s.setEndRow(endRow);
			s.setStartRow(startRow);
			
			List<InquiryDTO> dto1 = getSqlSession().selectList("CEB_AUS.get_search_list_2",s);
			return dto1;
		}
		
		public List<InquiryDTO> show_search_list_id(String search, String string, int startRow, int endRow, String id) {

			PageDTO s = new PageDTO();
			MemberDTO s1 = new MemberDTO();
			
			s.setSearch(search);  
			s.setString(string);
			s.setEndRow(endRow);
			s.setStartRow(startRow);
			s1.setId(id);
			
			 Map<String,Object> dto = new HashMap<String,Object>();
				
				dto.put("search", search);    
				dto.put("string", string);  
				dto.put("endRow", endRow);
				dto.put("startRow", startRow);    
				dto.put("id", id);
			
			List<InquiryDTO> dto1 = getSqlSession().selectList("CEB_AUS.get_search_list_id",dto);
			return dto1;
		}
		

		public int next_num_2() {

			String num1 = getSqlSession().selectOne("CEB_AUS.next_num_2");
			int num;
			
			if(num1==null) {
				System.out.println("널임");
				num = 1;
			} else {
				num = Integer.parseInt(num1)+1;
			}
			return num;
		}
		
//point
		
		
		public int show_listOne_3(String id) {

			int total_point = getSqlSession().selectOne("CEB_AUS.show_listOne_3", id);
			 return total_point;
		}
		
		
//payment
	 //결제전
		public MemberDTO get_member(String id) {

			MemberDTO dto = getSqlSession().selectOne("CEB_AUS.get_member", id);
			 return dto;
		}
		
		public void insert_paylist(PaymentDTO dto) {

			 getSqlSession().insert("CEB_AUS.insert_paylist",dto);
		}
		
		public int next_num_3() {

			String pay_no = getSqlSession().selectOne("CEB_AUS.next_num_3");
			int num;
			
			if(pay_no==null) {
				System.out.println("들어가라");
				num = 1;
			} else {
				num = Integer.parseInt(pay_no);
			}
			return num;
		}
		
		public int next_num_5() {

			String pay_no = getSqlSession().selectOne("CEB_AUS.next_num_5");
			int num;
			
			if(pay_no==null) {
				System.out.println("들어가라");
				num = 1;
			} else {
				num = Integer.parseInt(pay_no);
			}
			return num;
		}
		      
		
		
   //결제중
		
		public PaymentDTO check_insert(int pay_no) {

			PaymentDTO dto = getSqlSession().selectOne("CEB_AUS.check_insert", pay_no);
			 return dto;
		}
		
	
		
   //결제후
		
		public void insert_impuid(Map<String,Object> dto) {
			 getSqlSession().update("CEB_AUS.insert_impuid", dto);
		}
		
		public void insert_state(Map<String,Object> dto) {
			 getSqlSession().update("CEB_AUS.insert_state", dto);
		}
	
		public void update_allpoint(Map<String,Object> dto) {
			 getSqlSession().update("CEB_AUS.update_allpoint", dto);
		}
		
		
		public int get_impuid(int pay_no) {

			int imp_uid = getSqlSession().selectOne("CEB_AUS.show_listOne_3", pay_no);
			 return imp_uid;
		}
		
		public void insert_pointlist(PointDTO dto) {

			 getSqlSession().insert("CEB_AUS.insert_pointlist",dto);
		}
		  
		public void insert_pointlist_2(PointDTO dto) {

			 getSqlSession().insert("CEB_AUS.insert_pointlist_2",dto);
		}
		      
		
		    
		
		
//ticket  
		
		
		public TicketDTO get_ticket(String id) {
			
			TicketDTO dto = getSqlSession().selectOne("CEB_AUS.get_ticket", id);
			return dto;
		}
		  
		public void buying_ticket(TicketDTO dto) {

			 getSqlSession().insert("CEB_AUS.buying_ticket",dto);
		}
		
		public void using_ticket(TicketDTO dto) {
			 getSqlSession().update("CEB_AUS.update_allpoint", dto);
		}

		public PaymentDTO selectpay_no(int pay_no) {
			PaymentDTO dto = getSqlSession().selectOne("CEB_AUS.selectPayment",pay_no);
			
			return dto;
		}
		public PointDTO selectp_num(int p_num) {
			PointDTO dto = getSqlSession().selectOne("CEB_AUS.selectPoint",p_num);
			    
			return dto;
		}


		
		public void update_ticketpoint(Map<String, Object> dto) {
			 getSqlSession().update("CEB_AUS.update_ticketpoint", dto);
		}
		
		
		  
		public TicketDTO select_Ticket(int t_num) {
			TicketDTO dto = getSqlSession().selectOne("CEB_AUS.selecTicket",t_num);
			  
			return dto;    
		}
		

		public MemberDTO get_member_modal(String id) {

			MemberDTO dto = getSqlSession().selectOne("CEB_AUS.get_member_modal", id);
			 return dto;
		}
		
		
		public int show_count_3(String id) {
			int count = getSqlSession().selectOne("CEB_AUS.show_count_3", id);
			return count;
		}  
		
		public int show_count_ticket(String string) {
			int count = getSqlSession().selectOne("CEB_AUS.show_count_ticket",string);
			return count;  
		}  
		  
		
		
		
 
		public List<PointDTO> show_list_point(int startRow, int endRow, String id) {
    
			PageDTO s = new PageDTO();
			MemberDTO s1 = new MemberDTO(); 
			
			s.setEndRow(endRow);
			s.setStartRow(startRow);
			s1.setId(id);
			 
			 
			 Map<String,Object> dto = new HashMap<String,Object>();
				
				dto.put("endRow", endRow);
				dto.put("startRow", startRow);  
				dto.put("id", id);
				
				List<PointDTO> list = getSqlSession().selectList("CEB_AUS.show_list_point",dto);
				
				return list;
				
		}

		public int show_search_count_point(String search, String string) {

			PageDTO s = new PageDTO();
			s.setSearch(search);
			s.setString(string);
			
			int count = getSqlSession().selectOne("CEB_AUS.get_search_count_point",s);
			return count;
		}
		
		public PointDTO show_listOne_point(int num) {

			PointDTO dto = getSqlSession().selectOne("CEB_AUS.show_listOne_point", num);
			 return dto;
		}
		
		
		
		
		public List<PointDTO> show_search_list_point(String search, String string, int startRow, int endRow ,String id) {

			PageDTO s = new PageDTO();
			MemberDTO s1 = new MemberDTO();  
			
			s.setSearch(search);
			s.setString(string);
			s.setEndRow(endRow);
			s.setStartRow(startRow);
			s1.setId(id);
			  
			
			Map<String,Object> dto = new HashMap<String,Object>();
			dto.put("search", search);
			dto.put("string", string);
			dto.put("endRow", endRow);
			dto.put("startRow", startRow);  
			dto.put("id", id);
			
			
			
			List<PointDTO> dto1 = getSqlSession().selectList("CEB_AUS.get_search_list_point",dto);
			return dto1;
		}
}
