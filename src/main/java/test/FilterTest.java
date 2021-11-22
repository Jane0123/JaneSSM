package test;

import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FilterTest extends OncePerRequestFilter {

    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        //在DispatcherServlet之前执行
        System.out.println("Ｉ Lᵒᵛᵉᵧₒᵤ############FilterTest doFilterInternal executed############Ｉ Lᵒᵛᵉᵧₒᵤ");
        filterChain.doFilter(request, response);
        //在视图页面返回给客户端之前执行，但是执行顺序在Interceptor之后
        System.out.println("Ｉ Lᵒᵛᵉᵧₒᵤ################FilterTest doFilter after#################Ｉ Lᵒᵛᵉᵧₒᵤ");
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
    }

}

