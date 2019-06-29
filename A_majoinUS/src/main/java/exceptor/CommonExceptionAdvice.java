package exceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice							//컨트롤러 익셉션 처리 클래스 명시
public class CommonExceptionAdvice {

	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	@ExceptionHandler					
	public ModelAndView commonException(Exception e) {

		logger.info(e.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception",e);
		mav.setViewName("/LSH/error/common_error");
		
		return mav;
	}
	
	
}
