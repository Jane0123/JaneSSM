package test;




import org.springframework.context.annotation.Configuration;

import java.math.BigInteger;
import java.util.Date;


@Configuration
public class Gold {
//    计算黄金比例


    public static void main(String[] args) {

        Long t = new Date().getTime();
        BigInteger firstNum = BigInteger.ONE;//1
        BigInteger secNum = BigInteger.ONE;
        BigInteger res = BigInteger.ZERO;//0
        BigInteger TEN = BigInteger.TEN;//10
        //BigInteger的斐波那契数列
        for (int i = 0; i < 10000; i++) {
            if (i == 0 || i == 1) {
                res = BigInteger.ONE;
            }
            res = secNum.add(firstNum); //两个BigInteger相加
            firstNum = secNum;
            secNum = res;
        }
        System.out.println("黄金比例");
        System.out.print("0.");
        //for循环实现了模拟手算除法
        for (int i = 0; i < 101; i++) {
            //选择斐波那契里两个连续的数，小的做被除数，大的做除数
            //每一位是两者的商值
            BigInteger ans = firstNum.divide(secNum);
            //除数不变，被除数=余数*10
            firstNum = (firstNum.mod(secNum)).multiply(TEN);
            if (i != 0) {  //只输出后面的100位小数点
                System.out.print(ans);
            }
        }
        System.out.println();
        Long t4 = new Date().getTime();
        System.out.println("方法用时：" + (t4 - t) + "毫秒");

    }}

