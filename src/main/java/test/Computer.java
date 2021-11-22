package test;




import javax.print.DocFlavor;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.attribute.HashPrintRequestAttributeSet;
import java.awt.*;
import java.io.*;

import java.net.InetAddress;

import java.util.Map;
import java.util.Properties;




public class Computer {


    public static void main(String[] args) throws IOException {
        try {
            PrintStream out = System.out;// 保存原输出流
            PrintStream ps = new PrintStream("C:\\Users\\Asus\\Desktop\\Jane\\JaneSSM\\打印.txt");// 创建文件输出流
            // System信息，从jvm获取
             property();

            System.setOut(ps);// 设置使用新的输出流
            System.out.println("新的输出流将输出到文件打印.txt\n"+"1+2=3");
            System.setOut(out);// 恢复原有输出流
            System.out.println("程序运行完毕，恢复为原输出流。");
        } catch (FileNotFoundException e) {
            e.printStackTrace();

    } catch(
    Exception e)

    {
        e.printStackTrace();
    }

}

    private static void property() throws IOException {
        Properties p = System.getProperties();//获取当前的系统属性
        p.list(System.out);//将属性列表输出
        System.out.print("CPU个数:");//Runtime.getRuntime()获取当前运行时的实例
        System.out.println(Runtime.getRuntime().availableProcessors());//availableProcessors()获取当前电脑CPU数量
        System.out.print("虚拟机内存总量:");
        System.out.println(Runtime.getRuntime().totalMemory());//totalMemory()获取java虚拟机中的内存总量
        System.out.print("虚拟机空闲内存量:");
        System.out.println(Runtime.getRuntime().freeMemory());//freeMemory()获取java虚拟机中的空闲内存量
        System.out.print("虚拟机使用最大内存量:");
        System.out.println(Runtime.getRuntime().maxMemory());//maxMemory()获取java虚拟机试图使用的最大内存量
        Runtime r = Runtime.getRuntime();
        Properties props = System.getProperties();
        InetAddress addr;
        addr = InetAddress.getLocalHost();
        String ip = addr.getHostAddress();
        Map<String, String> map = System.getenv();
        String userName = map.get("USERNAME");// 获取用户名
        String computerName = map.get("COMPUTERNAME");// 获取计算机名
        String userDomain = map.get("USERDOMAIN");// 获取计算机域名
        System.out.println("用户名:    " + userName);
        System.out.println("计算机名:    " + computerName);
        System.out.println("计算机域名:    " + userDomain);
        System.out.println("本地ip地址:    " + ip);
        System.out.println("本地主机名:    " + addr.getHostName());
        System.out.println("JVM可以使用的总内存:    " + r.totalMemory());
        System.out.println("JVM可以使用的剩余内存:    " + r.freeMemory());
        System.out.println("JVM可以使用的处理器个数:    " + r.availableProcessors());
        System.out.println("Java的运行环境版本：    " + props.getProperty("java.version"));
        System.out.println("Java的运行环境供应商：    " + props.getProperty("java.vendor"));
        System.out.println("Java供应商的URL：    " + props.getProperty("java.vendor.url"));
        System.out.println("Java的安装路径：    " + props.getProperty("java.home"));
        System.out.println("Java的虚拟机规范版本：    " + props.getProperty("java.vm.specification.version"));
        System.out.println("Java的虚拟机规范供应商：    " + props.getProperty("java.vm.specification.vendor"));
        System.out.println("Java的虚拟机规范名称：    " + props.getProperty("java.vm.specification.name"));
        System.out.println("Java的虚拟机实现版本：    " + props.getProperty("java.vm.version"));
        System.out.println("Java的虚拟机实现供应商：    " + props.getProperty("java.vm.vendor"));
        System.out.println("Java的虚拟机实现名称：    " + props.getProperty("java.vm.name"));
        System.out.println("Java运行时环境规范版本：    " + props.getProperty("java.specification.version"));
        System.out.println("Java运行时环境规范供应商：    " + props.getProperty("java.specification.vender"));
        System.out.println("Java运行时环境规范名称：    " + props.getProperty("java.specification.name"));
        System.out.println("Java的类格式版本号：    " + props.getProperty("java.class.version"));
        System.out.println("Java的类路径：    " + props.getProperty("java.class.path"));
        System.out.println("加载库时搜索的路径列表：    " + props.getProperty("java.library.path"));
        System.out.println("默认的临时文件路径：    " + props.getProperty("java.io.tmpdir"));
        System.out.println("一个或多个扩展目录的路径：    " + props.getProperty("java.ext.dirs"));
        System.out.println("操作系统的名称：    " + props.getProperty("os.name"));
        System.out.println("操作系统的构架：    " + props.getProperty("os.arch"));
        System.out.println("操作系统的版本：    " + props.getProperty("os.version"));
        System.out.println("文件分隔符：    " + props.getProperty("file.separator"));
        System.out.println("路径分隔符：    " + props.getProperty("path.separator"));
        System.out.println("行分隔符：    " + props.getProperty("line.separator"));
        System.out.println("用户的账户名称：    " + props.getProperty("user.name"));
        System.out.println("用户的主目录：    " + props.getProperty("user.home"));
        System.out.println("用户的当前工作目录：    " + props.getProperty("user.dir"));
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println("系统内存");

        Runtime runtime = Runtime.getRuntime();
        // 剩余内存 kb
        long freeMemoery = runtime.freeMemory();
        // 可使用内存 kb
        long totalMemory = runtime.totalMemory();
        // 最大可使用内存 kb
        long maxMemory = runtime.maxMemory();
        //已用内存
        long usedMemory = totalMemory - freeMemoery;
        // 剩余内存
        long useableMemory = maxMemory - totalMemory + freeMemoery;
        System.out.println("剩余内存 (kb):" + freeMemoery +
                "可使用内存 (kb):" + totalMemory +
                "最大可使用内存( kb):" + maxMemory +
                "已用内存( kb):" + usedMemory +
                "剩余内存( kb):" + useableMemory);
        System.out.println("*************************************************");
        File file = new File("C:");
        long totalSpace = file.getTotalSpace();
        long freeSpace = file.getFreeSpace();
        long usedSpace = totalSpace - freeSpace;
        System.out.println("系统" + file + "盘符");
        System.out.println("总空间大小 : " + totalSpace / 1024 / 1024 / 1024 + "G");
        System.out.println("剩余空间大小 : " + freeSpace / 1024 / 1024 / 1024 + "G");
        System.out.println("已用空间大小 : " + usedSpace / 1024 / 1024 / 1024 + "G");
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int screenWidth = (int) screenSize.getWidth();
        int screenHeight = (int) screenSize.getHeight();
        System.out.println("屏幕分辨率：" + "屏幕宽度：" + screenWidth + "，屏幕高度：" + screenHeight);
        System.out.println("_____________________________________________");
        HashPrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();
        DocFlavor flavor = DocFlavor.INPUT_STREAM.AUTOSENSE;
        //查找所有的可用的打印服务
        PrintService[] printService = PrintServiceLookup.lookupPrintServices(flavor, pras);

        for (int i = 0; i < printService.length; i++) {
            System.out.println(printService[i].getName());
        }
    }
}







