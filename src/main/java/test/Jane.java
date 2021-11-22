package test;


import gnu.trove.list.array.TDoubleArrayList;
import org.apache.commons.math3.util.FastMath;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;




@Component("b")
@Scope("singleton")
public class Jane {



    public static void main(String[] args) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("mapper.xml");
        TestController testController = applicationContext.getBean(TestController.class);
        testController.page();
        testController.t();
        //   prototype（多例）：对这个bean的每次请求都会创建一个新的bean实例，类似于new。
        Object object1 = applicationContext.getBean("a");
        Object object2 = applicationContext.getBean("a");
        System.out.println(object1);
        System.out.println(object2);
//        singleton（单例）：只有一个共享的实例存在，所有对这个bean的请求都会返回这个唯一的实例
        Object object3 = applicationContext.getBean("b");
        Object object4 = applicationContext.getBean("b");
        System.out.println(object3);
        System.out.println(object4);

        //圆周率
        System.out.println(FastMath.log(FastMath.PI));
        //10正弦值 排序
        TDoubleArrayList tDoubleArrayList = new TDoubleArrayList();
        for (int i = 1; i <=10; i++) {
            tDoubleArrayList.add(sin(i));
        }
        System.out.println("排序前" + tDoubleArrayList);

    }

    private static double sin(int i) {
        return 0;


}
}


