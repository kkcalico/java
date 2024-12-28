package com.mvc._202203049117_messageboard.util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DataBaseConnection {

    private final String DBDRIVER = "com.mysql.cj.jdbc.Driver";

    // serverTimezone=UTC 下载包mysql-connector-java-8.0.29
    // url
    private final String DBURL = "jdbc:mysql://localhost:3306/202203049117_messageboard?" +
            "userSSL=false&serverTimezone=UTC&" +
            "useUnicode=true&characterEncoding=utf-8";
    // user
    private final String DBUSER = "root";
    // 密码
    private final String DBPASSWORD = "kiana1207";
    // 连接对象
    public Connection connection = null;

    // 构造方法，加载驱动
    public DataBaseConnection() {
        try {
            Class.forName(DBDRIVER);
            connection = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
        } catch (Exception e) {
            System.out.println("加载驱动失败！");
        }
    }

    // 取得数据库连接对象
    public Connection getConnection() {
        return connection;
    }

    // 关闭连接
    public void close() {
        try {
            connection.close();
        } catch (Exception e) {
            System.out.println("关闭数据库连接失败！");
        }
    }
}


