package test;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.File;

public class ListenerTest implements ServletContextListener {
    // 销毁监听器
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        System.out.println("date20161020095500 :" + servletContextEvent.getServletContext());
    }
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        try{
            // 获取项目跟路径
            String basePath = servletContextEvent.getServletContext().getRealPath("/");
            // C:\Users\Asus\Desktop\Jane\JaneSSM\src\main\webapp\ 绝对路径
            System.out.println("basePath20161020094700 :" + basePath);
            if (!(basePath.endsWith(File.separator))){
                basePath = basePath + File.separator;
            }
            basePath = basePath + "WEB-INF" + File.separator + "classes" + File.separator;
            new TransactionDeployer(basePath).deploy();
            // C:\Users\Asus\Desktop\Jane\JaneSSM\src\main\webapp\WEB-INF\classes\
            System.out.println("basePath20161020094701 :" + basePath);
        }
        catch (Exception e){
            e.printStackTrace();
            System.exit(-1);
        }

}

}
