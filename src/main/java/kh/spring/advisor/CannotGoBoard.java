package kh.spring.advisor;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.DTO.MemberDTO;

@Component
@Aspect
public class CannotGoBoard {
	@Autowired
	private HttpSession session;
	
	@Around("execution(* kh.spring.practice.BoardController.goBoard*())")
	public Object ctGoBoard(ProceedingJoinPoint pjp) {
		MemberDTO dto = (MemberDTO)session.getAttribute("mem");
		Object o = null;
		if(dto==null) {
			return "home";
		}
		try {
			o = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return o;
	}

}
