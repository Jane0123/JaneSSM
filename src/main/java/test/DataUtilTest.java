package test;


import java.sql.*;

public class DataUtilTest {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        String user = "root";
        String password = "root";
        String jdbcDriver = "com.mysql.cj.jdbc.Driver";
        String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
        Connection conn = null;
        Class.forName(jdbcDriver);
        conn = DriverManager.getConnection(jdbcUrl, user, password);

        PreparedStatement pst = null;
        try {
            pst = conn.prepareStatement("select * from flow where 1=2");
            ResultSetMetaData rsd1 = pst.executeQuery().getMetaData();
            System.out.println("表：flow");
            for(int i = 0; i < rsd1.getColumnCount(); i++) {
                System.out.println("java类型：" + rsd1.getColumnClassName(i + 1));
                System.out.print("  数据库类型:" + rsd1.getColumnTypeName(i + 1));
                System.out.print("  字段名称:" + rsd1.getColumnName(i + 1));
                System.out.println("字段长度:" + rsd1.getColumnDisplaySize(i + 1));
            }

            } catch(SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    pst.close();
                    pst = null;
                } catch(SQLException e) {
                    throw new RuntimeException(e);
                }
            conn = DriverManager.getConnection(jdbcUrl, user, password);
            PreparedStatement pst2 = null;
            try {
            pst = conn.prepareStatement("select * from leaved where 1=2");
            ResultSetMetaData rsd2 = pst.executeQuery().getMetaData();
                System.out.println("表：leaved");
            for(int a = 0; a < rsd2.getColumnCount(); a++) {
                System.out.println("java类型："+rsd2.getColumnClassName(a + 1));
                System.out.print("  数据库类型:"+rsd2.getColumnTypeName(a+ 1));
                System.out.print("  字段名称:"+rsd2.getColumnName(a + 1));
                System.out.print("  字段长度:"+rsd2.getColumnDisplaySize(a + 1));
            }

            } catch(SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    pst.close();
                    pst = null;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            }
        }
    }
}



