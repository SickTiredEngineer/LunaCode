package com.itwillbs.luna_code.handler;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

/* 에러 터지거나 뭐 하면 여기로 이동함 */
@ControllerAdvice
public class ExceptionsHandler {
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error_page/error_page_500";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String noHandlerFoundException(NoHandlerFoundException e) {
		e.printStackTrace();
		return "error_page/error_page_404";
	}
	
	
	
}
