package test;

import java.util.Random;

public class Randomnumber {
    public static void main(String[] args) {
        Random rand = new Random();
        for (int i = 0; i < 4; i++) {
            //int randNumber =rand.nextInt(MAX - MIN + 1) + MIN;
            // randNumber 将被赋值为一个 MIN 和 MAX 范围内的随机数
            System.out.println(rand.nextInt(100) + 1);
        }
        System.out.println("^^^^^^^^^^^^^^(๑′ᴗ‵๑)^^^^^^^^^^^^^^^");
        int[] arr = gennerateArray(4, 100);
        for (int i = 0; i < arr.length; i++) {
            System.out.println(arr[i]);
        }


    }

    //    随机生成数组
    public static int[] gennerateArray(int len, int max) {
        int[] arr = new int[len];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = (int) (Math.random() * max);
        }
        return arr;
    }

}
