package test;

import java.math.BigDecimal;

public  class Calculate_π {
//    计算π值
    private static int n = 100;//小数点后100位

    public static void main(String[] args) {

        BigDecimal part1 = arctan(57).multiply(new BigDecimal(176));
        BigDecimal part2 = arctan(239).multiply(new BigDecimal(28));
        BigDecimal part3 = arctan(682).multiply(new BigDecimal(-48));
        BigDecimal part4 = arctan(12943).multiply(new BigDecimal(96));

        BigDecimal part = part1.add(part2).add(part3).add(part4);
        System.out.println("π后面"+n+"小数："+part.toString());
    }

    public static BigDecimal arctan(int x){
        int n2 = n+2;//为了防误差

        BigDecimal result = BigDecimal.ZERO;
        BigDecimal xsquare = new BigDecimal(x*x);
        BigDecimal bigx = new BigDecimal(x);
        BigDecimal temp;
        BigDecimal res = BigDecimal.ONE.divide(bigx , n2, BigDecimal.ROUND_HALF_EVEN);

        boolean b = true;
        for(int i=1;;i+=2){
            temp = res.divide(new BigDecimal(i), n2, BigDecimal.ROUND_HALF_EVEN);
            if(temp.compareTo(BigDecimal.ZERO)==0){//根据莱布尼兹级数结果=0时返回
                break;
            }
            if(b){
                result = result.add(temp);//加
            }else{
                result = result.subtract(temp);//减
            }
            b = !b;
            res = res.divide(xsquare, n2, BigDecimal.ROUND_HALF_EVEN);
        }
        return result;
    }

    }

