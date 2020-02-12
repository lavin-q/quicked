package com.quickd.core.util;


import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;

import javax.sql.DataSource;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.nio.charset.Charset;
import java.sql.*;
import java.util.*;
import java.util.regex.Pattern;

import static com.alibaba.druid.util.StringUtils.isEmpty;

@Slf4j
public class DBUtil {

    /**
     * @return 获取conn对象
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static Connection getFHCon() throws SQLException {
        DataSource dataSource = (DataSource) SpringContextUtil.getBean("dataSource");
        return dataSource.getConnection();
    }
    /**
     * @return 获取conn对象
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public  static Connection getCon(String dburl,String username,String password) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return  DriverManager.getConnection(dburl	, username,
                password);

    }
    /**
     * 执行sql脚本文件 使用ScriptRunner
     *
     * @param sqlPath SQL文件的路径：
     */
    public static void runSqlByScriptRunner(  Connection conn,String sqlPath) {
        try {
            ScriptRunner runner = new ScriptRunner(conn);
            Resources.setCharset(Charset.forName("UTF-8")); //设置字符集,不然中文乱码插入错误
            runner.setLogWriter(null);//设置是否输出日志
            Reader read = Resources.getResourceAsReader(sqlPath);
            runner.runScript(read);
            runner.closeConnection();
            conn.close();
            System.out.println("sql脚本执行完毕");
        } catch (Exception e) {
            System.out.println("sql脚本执行发生异常");
            e.printStackTrace();
        }
    }

    /**
     * 执行sql脚本文件 使用ScriptRunner
     *
     * @param path SQL文件的路径：
     */
    public static void runSql(String path)
            throws SQLException, ClassNotFoundException, FileNotFoundException {
        Connection conn = getFHCon();
        InputStream in = new FileInputStream(new File(path));
        Scanner sc = new Scanner(in);
        sc.useDelimiter(";");

        while (sc.hasNext()) {
            String sql = sc.next();
            sql = sql.trim();
            boolean skipSql = isSkip(sql);
            if (!skipSql) {
                log.debug(sql);
                Statement stmt = conn.createStatement();
                stmt.execute(sql);
                stmt.close();
            }
        }
        sc.close();
        log.debug("Executed " + path + " successfully.");
    }

    private static final boolean isSkip(String sql) {
        if (isWhiteSpaceOnly(sql)) {
            return true;
        }
        if (sql.startsWith("--")) {
            return true;
        }
        return false;

    }
    /**
     * 执行sql脚本文件 使用ScriptRunner
     *
     * @param sqlPath SQL文件的路径：
     */
    public static void runSqlByScriptRunner(String dburl,String username,String password,String sqlPath) {
        try {
            Connection conn =getCon(dburl	, username,
                    password);
            ScriptRunner runner = new ScriptRunner(conn);
            Resources.setCharset(Charset.forName("UTF-8")); //设置字符集,不然中文乱码插入错误
            runner.setLogWriter(null);//设置是否输出日志
            Reader read = Resources.getResourceAsReader("sql/mysql.sql");
            runner.runScript(read);
            runner.closeConnection();
            conn.close();
            System.out.println("sql脚本执行完毕");
        } catch (Exception e) {
            System.out.println("sql脚本执行发生异常");
            e.printStackTrace();
        }
    }



    /**
     * 执行 INSERT、UPDATE 或 DELETE
     *
     * @param sql 语句
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static void executeUpdateFH(String dburl,String username,String password,String sql) throws ClassNotFoundException, SQLException {
        Statement stmt = null;
        Connection conn = null;

        try {
             conn =getCon(dburl	, username,
                    password);
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            conn.close();
            stmt.close();
        } finally {
            conn.close();
            stmt.close();
        }
    }
    /**
     * 执行 INSERT、UPDATE 或 DELETE
     *
     * @param sql 语句
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static void executeUpdate(String sql) throws ClassNotFoundException, SQLException {
        Statement stmt = null;
        Connection conn = null;

        try {
            conn = DBUtil.getFHCon();
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            conn.close();
            stmt.close();
        } finally {
            conn.close();
            stmt.close();
        }
    }
    /**
     * 通过sql查询数据,
     * 慎用，会有sql注入问题
     *
     * @param sql
     * @return 查询的数据集合
     * @throws SQLException
     */
    public static List<Map<String, Object>> query(String sql) throws SQLException {
        return executeQuery(sql, null);
    }

    /**
     * 执行sql通过 Map<String, Object>限定查询条件查询
     *
     * @param tableName 表名
     * @param whereMap  where条件
     * @return List<Map<String, Object>>
     * @throws SQLException
     */
    public static List<Map<String, Object>> query(String tableName,
                                                  Map<String, Object> whereMap) throws Exception {
        String whereClause = "";
        Object[] whereArgs = null;
        if (whereMap != null && whereMap.size() > 0) {
            Iterator<String> iterator = whereMap.keySet().iterator();
            whereArgs = new Object[whereMap.size()];
            int i = 0;
            while (iterator.hasNext()) {
                String key = iterator.next();
                whereClause += (i == 0 ? "" : " AND ");
                whereClause += (key + " = ? ");
                whereArgs[i] = whereMap.get(key);
                i++;
            }
        }
        return query(tableName, false, null, whereClause, whereArgs, null, null, null, null);
    }

    /**
     * 执行sql条件参数绑定形式的查询
     *
     * @param tableName   表名
     * @param whereClause where条件的sql
     * @param whereArgs   where条件中占位符中的值
     * @return List<Map<String, Object>>
     * @throws SQLException
     */
    public static List<Map<String, Object>> query(String tableName,
                                                  String whereClause,
                                                  String[] whereArgs) throws SQLException {
        return query(tableName, false, null, whereClause, whereArgs, null, null, null, null);
    }

    /**
     * 执行全部结构的sql查询
     *
     * @param tableName     表名
     * @param distinct      去重
     * @param columns       要查询的列名
     * @param selection     where条件
     * @param selectionArgs where条件中占位符中的值
     * @param groupBy       分组
     * @param having        筛选
     * @param orderBy       排序
     * @param limit         分页
     * @return List<Map<String, Object>>
     * @throws SQLException
     */
    public static List<Map<String, Object>> query(String tableName,
                                                  boolean distinct,
                                                  String[] columns,
                                                  String selection,
                                                  Object[] selectionArgs,
                                                  String groupBy,
                                                  String having,
                                                  String orderBy,
                                                  String limit) throws SQLException {
        String sql = buildQueryString(distinct, tableName, columns, selection, groupBy, having, orderBy, limit);
        return executeQuery(sql, selectionArgs);

    }
    /**
     * 动态读取数据记录
     *
     * @param sql 查询语句
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static List<List<Object>> executeQueryFH(String sql) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = getFHCon();
            List<List<Object>> dataList = new ArrayList<List<Object>>();    //存放数据(从数据库读出来的一条条的数据)


            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            rs = stmt.executeQuery(sql);
            ResultSetMetaData md = rs.getMetaData();
            int columnCount = md.getColumnCount(); //Map rowData;
            while (rs.next()) {
                List<Object> onedataList = new ArrayList<Object>();        //存放每条记录里面每个字段的值
                for (int i = 1; i < columnCount + 1; i++) {
                    onedataList.add(rs.getObject(i));
                }
                dataList.add(onedataList);                                    //把每条记录放list中
            }
            conn.close();
            stmt.close();
            return dataList;
        } catch (Exception e) {
            if (conn != null) {
                conn.rollback();
            }
            e.printStackTrace();
            throw e;
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public static List executeQueryList(String sql, Object[] bindArgs, Class obj) throws SQLException {

        List result = new ArrayList();
        List<Map<String, Object>> datas = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            /**获取数据库连接池中的连接**/
            connection = getFHCon();
            preparedStatement = connection.prepareStatement(sql);
            if (bindArgs != null) {
                /**设置sql占位符中的值**/
                for (int i = 0; i < bindArgs.length; i++) {
                    preparedStatement.setObject(i + 1, bindArgs[i]);
                }
            }
//            System.out.println(getExecSQL(sql, bindArgs));
            /**执行sql语句，获取结果集**/
            resultSet = preparedStatement.executeQuery();
            datas = getDatList(resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        result = parseBeanList(datas, obj);
        return result;
    }

    /**
     * 将结果集对象封装成List<Map<String, Object>> 对象
     *
     * @param resultSet 结果多想
     * @return 结果的封装
     * @throws SQLException
     */
    private static List<Map<String, Object>> getDatList(ResultSet resultSet) throws SQLException {
        List<Map<String, Object>> datas = new ArrayList<>();
        /**获取结果集的数据结构对象**/
        ResultSetMetaData metaData = resultSet.getMetaData();
        while (resultSet.next()) {
            Map<String, Object> rowMap = new HashMap<>();
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                //将key中大写字符转为_大写
                String key = camelCaseName(metaData.getColumnName(i));
                rowMap.put(key, resultSet.getObject(i));
            }
            datas.add(rowMap);
        }
////        System.out.println("成功查询到了" + datas.size() + "行数据");
//        for (int i = 0; i < datas.size(); i++) {
//            Map<String, Object> map = datas.get(i);
////            System.out.println("第" + (i + 1) + "行：" + map);
//        }
        return datas;
    }

    /**
     * Map转换层Bean，使用泛型免去了类型转换的麻烦。
     *
     * @param <T>
     * @param map
     * @param class1
     * @return
     */
    public static <T> T map2Bean(Map<String, Object> map, Class<T> class1) {
        T bean = null;
        try {
            bean = class1.newInstance();
            BeanUtils.populate(bean, map);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return bean;
    }
    public static List parseBeanList(List list, Class obj) {
        //生成集合
        ArrayList ary = new ArrayList();
        //遍历集合中的所有数据
        for (int i = 0; i < list.size(); i++) {
            try {
                ////生成对象实历 将MAP中的所有参数封装到对象中
                Object o = map2Bean((Map) list.get(i), obj);
                //把对象加入到集合中
                ary.add(o);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //返回封装好的集合
        return ary;
    }

    /**
     * 转换为驼峰
     *
     * @param underscoreName
     * @return
     */
    public static String camelCaseName(String underscoreName) {
        StringBuilder result = new StringBuilder();
        if (underscoreName != null && underscoreName.length() > 0) {
            boolean flag = false;
            for (int i = 0; i < underscoreName.length(); i++) {
                char ch = underscoreName.charAt(i);
                if ("_".charAt(0) == ch) {
                    flag = true;
                } else {
                    if (flag) {
                        result.append(Character.toUpperCase(ch));
                        flag = false;
                    } else {
                        result.append(ch);
                    }
                }
            }
        }
        return result.toString();
    }
    /**
     * 将结果集对象封装成List<Map<String, Object>> 对象
     *
     * @param resultSet 结果多想
     * @return 结果的封装
     * @throws SQLException
     */
    private static List<Map<String, Object>> getDatas(ResultSet resultSet) throws SQLException {
        List<Map<String, Object>> datas = new ArrayList<>();
        /**获取结果集的数据结构对象**/
        ResultSetMetaData metaData = resultSet.getMetaData();
        while (resultSet.next()) {
            Map<String, Object> rowMap = new HashMap<>();
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                rowMap.put(metaData.getColumnName(i), resultSet.getObject(i));
            }
            datas.add(rowMap);
        }
        System.out.println("成功查询到了" + datas.size() + "行数据");
        for (int i = 0; i < datas.size(); i++) {
            Map<String, Object> map = datas.get(i);
            System.out.println("第" + (i + 1) + "行：" + map);
        }
        return datas;
    }


    /**
     * After the execution of the complete SQL statement, not necessarily the actual implementation of the SQL statement
     *
     * @param sql      SQL statement
     * @param bindArgs Binding parameters
     * @return Replace? SQL statement executed after the
     */
    private static String getExecSQL(String sql, Object[] bindArgs) {
        StringBuilder sb = new StringBuilder(sql);
        if (bindArgs != null && bindArgs.length > 0) {
            int index = 0;
            for (int i = 0; i < bindArgs.length; i++) {
                index = sb.indexOf("?", index);
                sb.replace(index, index + 1, String.valueOf(bindArgs[i]));
            }
        }
        return sb.toString();
    }

    public static List<String> executeQueryStr(String sql) throws Exception {
        Connection conn = null;
        Statement stmt = null;
        try {
            List<String> dataList = new ArrayList<String>();    //存放数据(从数据库读出来的一条条的数据)
            conn = getFHCon();
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            ResultSetMetaData md = rs.getMetaData();
            int columnCount = md.getColumnCount(); //Map rowData;
            while (rs.next()) {
                for (int i = 1; i < columnCount + 1; i++) {
                    if (columnCount == 1) {
                        dataList.add((String) rs.getObject(i));
                    } else {
                        if (i < columnCount) {
                            dataList.add((String) rs.getObject(i + 1));
                        }
                    }
                }
            }
            conn.close();
            return dataList;
        } catch (Exception ex) {
            ex.printStackTrace();
            stmt.close();
            conn.close();
            return null;
        } finally {
            stmt.close();
            conn.close();
        }
    }

    /**
     * 执行查询
     *
     * @param sql      要执行的sql语句
     * @param bindArgs 绑定的参数
     * @return List<Map<String, Object>>结果集对象
     * @throws SQLException SQL执行异常
     */
    public static List<Map<String, Object>> executeQuery(String sql, Object[] bindArgs) throws SQLException {
        List<Map<String, Object>> datas = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            /**获取数据库连接池中的连接**/
            connection = getFHCon();
            preparedStatement = connection.prepareStatement(sql);
            if (bindArgs != null) {
                /**设置sql占位符中的值**/
                for (int i = 0; i < bindArgs.length; i++) {
                    preparedStatement.setObject(i + 1, bindArgs[i]);
                }
            }
            System.out.println(getExecSQL(sql, bindArgs));
            /**执行sql语句，获取结果集**/
            resultSet = preparedStatement.executeQuery();
            datas = getDatas(resultSet);
            System.out.println();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return datas;
    }

    /**
     * Build an SQL query string from the given clauses.
     *
     * @param distinct true if you want each row to be unique, false otherwise.
     * @param tables   The table names to compile the query against.
     * @param columns  A list of which columns to return. Passing null will
     *                 return all columns, which is discouraged to prevent reading
     *                 data from storage that isn't going to be used.
     * @param where    A filter declaring which rows to return, formatted as an SQL
     *                 WHERE clause (excluding the WHERE itself). Passing null will
     *                 return all rows for the given URL.
     * @param groupBy  A filter declaring how to group rows, formatted as an SQL
     *                 GROUP BY clause (excluding the GROUP BY itself). Passing null
     *                 will cause the rows to not be grouped.
     * @param having   A filter declare which row groups to include in the cursor,
     *                 if row grouping is being used, formatted as an SQL HAVING
     *                 clause (excluding the HAVING itself). Passing null will cause
     *                 all row groups to be included, and is required when row
     *                 grouping is not being used.
     * @param orderBy  How to order the rows, formatted as an SQL ORDER BY clause
     *                 (excluding the ORDER BY itself). Passing null will use the
     *                 default sort order, which may be unordered.
     * @param limit    Limits the number of rows returned by the query,
     *                 formatted as LIMIT clause. Passing null denotes no LIMIT clause.
     * @return the SQL query string
     */
    private static String buildQueryString(
            boolean distinct, String tables, String[] columns, String where,
            String groupBy, String having, String orderBy, String limit) {
        if (isEmpty(groupBy) && !isEmpty(having)) {
            throw new IllegalArgumentException(
                    "HAVING clauses are only permitted when using a groupBy clause");
        }
        if (!isEmpty(limit) && !SLimitPattern.matcher(limit).matches()) {
            throw new IllegalArgumentException("invalid LIMIT clauses:" + limit);
        }

        StringBuilder query = new StringBuilder(120);

        query.append("SELECT ");
        if (distinct) {
            query.append("DISTINCT ");
        }
        if (columns != null && columns.length != 0) {
            appendColumns(query, columns);
        } else {
            query.append(" * ");
        }
        query.append("FROM ");
        query.append(tables);
        appendClause(query, " WHERE ", where);
        appendClause(query, " GROUP BY ", groupBy);
        appendClause(query, " HAVING ", having);
        appendClause(query, " ORDER BY ", orderBy);
        appendClause(query, " LIMIT ", limit);
        return query.toString();
    }
    /**
     * the pattern of limit
     */
    private static final Pattern SLimitPattern =
            Pattern.compile("\\s*\\d+\\s*(,\\s*\\d+\\s*)?");

    /**
     * Add the names that are non-null in columns to s, separating
     * them with commas.
     */
    private static void appendColumns(StringBuilder s, String[] columns) {
        int n = columns.length;

        for (int i = 0; i < n; i++) {
            String column = columns[i];

            if (column != null) {
                if (i > 0) {
                    s.append(", ");
                }
                s.append(column);
            }
        }
        s.append(' ');
    }

    /**
     * addClause
     *
     * @param s      the add StringBuilder
     * @param name   clauseName
     * @param clause clauseSelection
     */
    private static void appendClause(StringBuilder s, String name, String clause) {
        if (!isEmpty(clause)) {
            s.append(name);
            s.append(clause);
        }
    }


    public static boolean isWhiteSpaceOnly(String str) {
        boolean result = false;
        if (isEmpty(str)) {
            result = true;
        } else {
            str = str.replace('\n', ' ');
            str = str.replace('\t', ' ');
            str = str.replace('\b', ' ');
            str = str.trim();
            if (isEmpty(str)) {
                result = true;
            }
        }
        return result;
    }

}




