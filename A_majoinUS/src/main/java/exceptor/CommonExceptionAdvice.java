package exceptor;

import java.sql.SQLException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {
	
	@ExceptionHandler(SQLException.class)				
	public String commonException(Exception e) {
		System.out.println("에러페이지 이동");
		return "/KMJ/error";
	}
	
	
}
