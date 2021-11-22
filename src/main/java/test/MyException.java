package test;

/**
 * 自定义异常类

 */
public class MyException extends Exception {
    // 保存错误信息
    private String message;

    public MyException(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
