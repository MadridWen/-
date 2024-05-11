package cn.edu.hrbu.mall.aop;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

// 切面类
@Component
@Aspect // 声明当前类是一个切面类
public class Fbi {
    // 切面类中的方法通常称为通知
    // 前置通知
    @Before("execution(* cn..Man.eat(*))") // 切入点表达式
    public void beforeAdvice(){
        System.out.println("执行前置通知，FBI正在调查");
    }

    // 后置通知,连接点之后执行
    @After("within(cn..Man)")
    public void afterAdvice(){
        System.out.println("执行后置通知，FBI正在记录");
    }

    // 返回后通知，返回后通知是在目标方法执行之后（Return）执行的
    @AfterReturning(pointcut = "execution(* cn..Man.call())", returning = "ret")
    public void afterReturningAdvice(Object ret){
        System.out.printf("执行返回后通知，FBI发现了，截获情报(%s)\t" , ret);
    }

    // 异常通知，异常通知是在目标方法执行过程中出现异常时执行的
    @AfterThrowing(pointcut = "execution(* cn..Man.drive())", throwing = "exception")
    public void afterThrowingAdvice(Exception exception){
        System.out.println("执行异常通知，FBI发现了异常：" + exception.getMessage());
    }

    // 环绕通知，环绕通知是在目标方法执行之前和之后执行的，可以包裹连接点代码，是唯一可以控制目标方法（连接点）执行的通知
    @Around("within(cn..Man)")
    public Object aroundAdvice(ProceedingJoinPoint joinpoint) throws Throwable{
        System.out.println("执行环绕通知(前半部分)，FBI正在调查");
        Object[] args = joinpoint.getArgs();
        Object ret = joinpoint.proceed();
        System.out.println("执行环绕通知(后半部分)，FBI正在记录");
        return ret;
    }
}
