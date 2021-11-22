package test;


import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 这个异常解析器会在遇到异常的时候
 * 会被处理器适配器来调用
 */

public class MyExceptionResolver implements HandlerExceptionResolver {
    /*
        判断异常的信息: 如果是我们自定义的异常就直接获取异常信息
        然后跳转到错误页面:
        如果不是自定义异常, 那么给出一个未知错误的提示
     */
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        ModelAndView mv = new ModelAndView();
        MyException me = null;
        // 判断捕获到的异常是否为自定义异常
        if (e instanceof MyException) {
            // 将异常强转为MyException类型
            me = (MyException) e;
            // 获取异常信息
            String errorMessage = me.getMessage();
            mv.addObject("errorMessage", errorMessage);
            System.out.println(errorMessage);

        } else {
            mv.addObject("errorMessage", "出现错误, 请检查!");
        }
        // 这里配置了视图解析器
        mv.setViewName("/error");
        return mv;
    }


}
