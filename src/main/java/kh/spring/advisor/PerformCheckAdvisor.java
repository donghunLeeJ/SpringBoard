package kh.spring.advisor;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class PerformCheckAdvisor {
	
	@Around("execution(* kh.spring.practice.*.*(..)) || execution(* kh.spring.boardservice.*.*(..))")
	public Object perform_check(ProceedingJoinPoint pjp) {
		long startTime = System.currentTimeMillis();		
		Object o = null;
		try {
			o = pjp.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long endTime = System.currentTimeMillis();
		System.out.println((endTime-startTime)/1000.0+"초 만큼 소요됨");
		
		return o;
	}
}
