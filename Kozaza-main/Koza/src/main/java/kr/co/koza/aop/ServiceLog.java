package kr.co.koza.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class ServiceLog {
	@Pointcut("execution(* com.ja.springex.service..*Impl.*(..))")
	public void servicePointCut() {}
	
	@Around("servicePointCut()")
	public Object printlog(ProceedingJoinPoint pjp) {
		Object obj = null;
		
		System.out.println("======" + pjp.getSignature().getName()+": 시작======");
		
		try {
			obj = pjp.proceed();
		}catch(Throwable e) {
			e.printStackTrace();
		}
		
		System.out.println("======" + pjp.getSignature().getName()+": 끝======");
		
		
		return obj;
	}
}
