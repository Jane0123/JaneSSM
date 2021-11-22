package aop;

import org.aspectj.lang.annotation.*;
import org.testng.annotations.Test;


//面向切面编程AOP
@Aspect
@Test
public class Servant {
    /**
     * 通知之前
     */
    @Before(value = "test")
    public void before () {
        System.out.println("通知之前");
    }

    @Pointcut("execution(* *aop.People.test(..))")
    public  void  test(){
        System.out.println("切入点");
    }
    @Around("execution(** aop.People.around(..))")
    public void around(){
        System.out.println("方法执行之前和之后调用的通知");
    }

        /**
         * 通知之后
         */
        @After(value = "test")
        public void after () {
            System.out.println("通知之后");
        }
        @AfterReturning("execution(** aop.People.afterreturning(..))")
        public void afterreturning () {
            System.out.println("方法成功完成后执行的通知");
        }
        @AfterThrowing(value = "execution(** aop.People.afterthrowing(..))")
    public void afterthrowing ( ) {
        System.out.println("方法抛出异常退出时执行的通知");
    }
}

