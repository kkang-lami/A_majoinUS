package dao;


import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import controller.JHR.MemberDTO;
import project.DTO.F_jobDTO;
import project.DTO.F_locationDTO;

@Repository //현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class JHR extends SqlSessionDaoSupport{
	 
// login 부분-------------------------------------------------------------------------------	
	//회원 로그인 체크
	public boolean loginCheck(MemberDTO dto) {
		String name = getSqlSession().selectOne("JHR_AUS.loginCheck",dto);
		return(name==null)?false:true;
	}
	//회원 로그인 정보
	public MemberDTO checkMember(MemberDTO dto) {
		return getSqlSession().selectOne("JHR_AUS.checkMember",dto);
	}
	//회원 로그아웃
	public void logout(HttpSession session) {
		
	}
	
// my 부분-------------------------------------------------------------------------------------
	public boolean memberUpdate(MemberDTO dto) {
		return getSqlSession().update("JHR_AUS.memberUpdate", dto) > 0 ? true : false;

	}
	
	public MemberDTO mypage(String id) {
		return getSqlSession().selectOne("JHR_AUS.mypage",id);
	}
	public List<String> my_location(String id) {
		List<String> st = getSqlSession().selectList("JHR_AUS.my_location",id);
		return st;
	}
	public List<String> my_job(String id) {
		List<String> st = getSqlSession().selectList("JHR_AUS.my_job",id);
		return st;
	}
	
	public void delete_job(String id) {
	    getSqlSession().delete("JHR_AUS.delete_job", id);
	   
	}
	public void delete_location(String id) {
	    getSqlSession().delete("JHR_AUS.delete_location", id);
      
	}
	
	
	// 회원 정보 수정 및 삭제를 위한 비밀번호 체크
    public boolean checkPw(String id, String password) {
        boolean result = false;
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", id);
        map.put("password", password);
        int count = getSqlSession().selectOne("JHR_AUS.checkPw", map);
        if(count == 1) result= true;
        return result;
    }
  // 회원 정보 삭제처리
    public void deleteSecession(String id) {
    	getSqlSession().delete("JHR_AUS.deleteSecession", id);
    }
    
// join - find 부분 -------------------------------------------------------

    public MemberDTO findId(MemberDTO dto){  
    	MemberDTO getId = getSqlSession().selectOne("JHR_AUS.findId", dto);
  	  return getId;
    }  
	public MemberDTO findPw(MemberDTO dto){
		return getSqlSession().selectOne("JHR_AUS.findPw", dto);
	}
	public void updatePW(MemberDTO dto) {
		getSqlSession().update("JHR_AUS.updatePW", dto);
	}
	
	
// join 회원가입 부분 -----------------------------------------------------------
	//회원 가입
	public void register(MemberDTO dto) {
	 getSqlSession().insert("JHR_AUS.register",dto);
	}
	
	public int fj_num_job() {
		int fj_num = getSqlSession().selectOne("JHR_AUS.fj_num_job");
		return fj_num;
	}
	public void insert_job(List<Map<String,Object>> dto) {
		getSqlSession().insert("JHR_AUS.insert_job",dto);
	}
	
	public int fl_num_local() {
		int fl_num = getSqlSession().selectOne("JHR_AUS.fl_num_local");
		return fl_num;
	}
	public void insert_local(List<Map<String,Object>> dto) {
		getSqlSession().insert("JHR_AUS.insert_local",dto);
	}
	
	
}
	/*//회원 가입
	@Transactional //트랜잭션 설정 롤백을 위해 사용
	public int register(MemberDTO member) throws Exception{
		return getSqlSession().insert("JHR_AUS.register",member);
	}
	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "NEGABOX 인증 번호 전달";
		String formName = "네가박스 관리자";
		String from = " 보내는 메일의 내용";
		String to1 = email;
		
		String content = "인증번호[" +authNum+ "]";
		
		try {
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smrp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.uer", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("        ",        "        ");
				}
			});
			Message msg1 = new MimeMessage(mailSession);
			msg1.setFrom(new InternetAddress(from, MimeUtility.encodeText(
					formName, "UTF-8","B"))); //보내는 사람 설정
			
			InternetAddress[] address1 = {new InternetAddress(to1) };
			msg1.setRecipients(Message.RecipientType.TO, address1);
			msg1.setSubject(subject);
			msg1.setSentDate(new java.util.Date());
			msg1.setContent(content, " text/html;charset=euc-kr");
			
			Transport.send(msg1);
		}catch (MessagingException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i =0; i<=6; i++) {
			int n = (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}*/
	

	
	/*//로그인 접속일자 변경
	@Transactional
	public int update_log(String id) throws Exception{
		retrun sqlsession.update_log("member.update_log",id);
	}*/


