package test;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterceptor extends HandlerInterceptorAdapter {
   @Override
    public  boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler)throws  Exception{
       System.out.println( "MyInterceptor#preHandle()");
       request.getSession();
       return  true;
   }
}
