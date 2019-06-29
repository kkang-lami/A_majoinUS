package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		
		if(!(handler instanceof HandlerMethod)) {
			System.out.println("Current Request Handler: {"+handler.getClass().getCanonicalName()+"}");
		}
		
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		//NoLoginCheck noCheck = handlerMethod.getMethodAnnotation(NoLoginCheck.class); //메소드범위
		NoLoginCheck noCheck = handlerMethod.getMethod().getDeclaringClass().getAnnotation(NoLoginCheck.class); //클래스범위
		
		if(noCheck == null) {
			if(request.getSession().getAttribute("id") == null) {
				
				if(isAjaxRequest(request)) {
					System.out.println("[세션아웃]ajax 미실행");
					response.sendError(400);							// Ajax 요청
				}else {	
					System.out.println("[세션아웃]요청 미실행");
					response.sendRedirect("/A_majoinUS/aus/main");		
				}
				
				return false;
			}
		}		
		return true;
	}

	private boolean isAjaxRequest(HttpServletRequest req) {
		System.out.println(req.getHeader("AJAX"));
		return ("true".equals(req.getHeader("AJAX"))? true : false);
	}
}
