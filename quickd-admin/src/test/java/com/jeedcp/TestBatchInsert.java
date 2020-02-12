package com.jeedcp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Properties;

/**
 * @project: quickd
 * @description: TestBatchInsert
 * @author: caochaofeng
 * @create: 2020-01-07 16:33
 */
public class TestBatchInsert {
    public static void main(String[] args) {
        Connection conn = null;
        try {
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://127.0.0.1:3306/demo?serverTimezone=Hongkong&useUnicode=true&characterEncoding=UTF-8";
            String user = "root";
            String pwd = "123456";
            Properties props = new Properties();
            props.put("remarksReporting", "true");
            props.put("user", user);
            props.put("password", pwd);
            Class.forName(driver);
            conn = DriverManager.getConnection(url, props);
            int size = 1000;
            System.out.println("The data size is :"+size);
            testSingleInsertAuto(conn,size);
//            testSingleInsert(conn,size);
            testBatchInsert(conn,size);
//            testInsertValues(conn,size);
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 单条sql执行，自动提交事务
     * @param conn
     * @param size
     * @throws Exception
     */
    private static void testSingleInsertAuto(Connection conn,int size) throws Exception{
        try {
            conn.setAutoCommit(true);
            long startTime = System.currentTimeMillis();
            Statement state = conn.createStatement();
            for (int i=0;i<size;i++) {
                String sql = "insert into test_insert values ('########"+i+"')";
                state.execute(sql);
            }
//			conn.commit();
            long endTime = System.currentTimeMillis();
            System.out.println("testSingleInsertAuto用时：" + (endTime - startTime));
            state.close();
//			conn.close();
        } catch (Exception e) {
            throw e;
        }
    }

    /***
     * 单条sql执行，手动提交事务
     * @param conn
     * @param size
     * @throws Exception
     */
    private static void testSingleInsert(Connection conn,int size) throws Exception{
        try {
            // 关闭事务自动提交
            conn.setAutoCommit(false);
            long startTime = System.currentTimeMillis();
            Statement state = conn.createStatement();
            for (int i=0;i<size;i++) {
                String sql = "insert into test_insert values ('########"+i+"')";
                state.execute(sql);
            }
            conn.commit();
            long endTime = System.currentTimeMillis();
            System.out.println("testSingleInsert用时：" + (endTime - startTime));
            state.close();
//			conn.close();
        } catch (Exception e) {
            throw e;
        }
    }
    /**
     * 单条ql执行，拼Values
     * @param conn
     * @param size
     * @throws Exception
     */
    private static void testInsertValues(Connection conn,int size) throws Exception{
        try {
            StringBuffer sql = new StringBuffer("insert into test_insert values");
            conn.setAutoCommit(true);
            long startTime = System.currentTimeMillis();
            for (int i=0;i<size;i++) {
                if (i != 0) {
                    sql.append(",");
                }
                sql.append("('-----" + i + "')");
            }
//			System.out.println(sql);
            Statement state = conn.createStatement();
            state.execute(sql.toString());
            // 语句执行完毕，提交本事务
//			conn.commit();
            long endTime = System.currentTimeMillis();
            System.out.println("testInsertValues用时：" + (endTime - startTime));
            state.close();
//			conn.close();
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * 批量sql执行，手动提交事务
     * @param conn
     * @param size
     * @throws Exception
     */
    private static void testBatchInsert(Connection conn,int size) throws Exception{
        try {
            String sql = "insert into test_insert values (?)";
            // 关闭事务自动提交
            conn.setAutoCommit(false);
            long startTime = System.currentTimeMillis();
            PreparedStatement pst = conn.prepareStatement(sql);
            for (int i=0;i<size;i++) {
                pst.setString(1,"xxxxxxxxx"+i);
                // 把一个SQL命令加入命令列表
                pst.addBatch();
            }
            // 执行批量更新
            pst.executeBatch();
            // 语句执行完毕，提交本事务
            conn.commit();
            long endTime = System.currentTimeMillis();
            System.out.println("testBatchInsert用时：" + (endTime - startTime));
            pst.close();
//			conn.close();
        } catch (Exception e) {
            throw e;
        }
    }


}
