package com.mvc._202203049117_messageboard.dao;

import com.mvc._202203049117_messageboard.pojo.User;
import com.mvc._202203049117_messageboard.util.DataBaseConnection;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    // 添加信息（增）
    public void insertUser(User user, HttpServletRequest request) {
        String checkSql = "SELECT COUNT(*) FROM note WHERE userid = ?"; // 用与用户名判断
        String maxIdSql = "SELECT MAX(id) FROM note"; // 查询最大id
        String sql = "INSERT INTO note (id, userid, title, content, email, url, ip, writetime) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
        DataBaseConnection dbc = null;
        Connection conn = null;
        PreparedStatement checkPstmt = null;
        PreparedStatement maxIdPstmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ResultSet maxIdRs = null;

        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            conn = dbc.getConnection();

            // 检查用户名是否存在
            checkPstmt = conn.prepareStatement(checkSql);
            checkPstmt.setString(1, user.getUserid());
            rs = checkPstmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                // 用户名已存在，处理逻辑（例如设置错误消息）
                request.setAttribute("useridError", "用户名已存在，请使用其他用户名。");
                return; // 或者抛出一个自定义异常
            }

            // 查询当前最大 id
            maxIdPstmt = conn.prepareStatement(maxIdSql);
            maxIdRs = maxIdPstmt.executeQuery();

            int newId = 1; // 默认 id 从1开始
            if (maxIdRs.next()) {
                newId = maxIdRs.getInt(1) + 1; // 设置新用户的 id 为当前最大 id + 1
            }

            // 插入用户
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, newId); // 设置新用户的 id
            pstmt.setString(2, user.getUserid());
            pstmt.setString(3, user.getTitle());
            pstmt.setString(4, user.getContent());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getUrl());
            pstmt.setString(7, user.getIp());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (checkPstmt != null) checkPstmt.close();
                if (maxIdPstmt != null) maxIdPstmt.close();
                if (pstmt != null) pstmt.close();
                if (rs != null) rs.close();
                if (maxIdRs != null) maxIdRs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            dbc.close();
        }
    }

    //按ID查询
    public User queryUserById(int id) {
        User user = null;
        String sql = "select * from note where id=?";
        DataBaseConnection dbc = null;
        Connection conn = null;
        PreparedStatement pstmt = null;

        //下面是针对数据库的具体操作
        //连接数据库
        dbc = new DataBaseConnection();
        conn = dbc.getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            //进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                //查询到记录，将记录的各个字段的值赋给User对象
                user = new User();
                user.setId(rs.getInt(1));
                user.setUserid(rs.getString(2));
                user.setTitle(rs.getString(3));
                user.setContent(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setUrl(rs.getString(6));
                user.setIp(rs.getString(7));
                user.setWritetime(rs.getTimestamp("writetime"));
                rs.close();
                pstmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbc.close();
            return user;
        }
    }

    // 删除记录
    public void deleteById(int id) {
        String deleteSql = "DELETE FROM note WHERE id = ?";
        String selectAllSql = "SELECT id FROM note ORDER BY id"; // 查询所有用户的 ID
        String updateSql = "UPDATE note SET id = ? WHERE id = ?"; // 更新 ID 的 SQL

        DataBaseConnection dbc = null;
        Connection conn = null;
        PreparedStatement deletePstmt = null;
        PreparedStatement selectPstmt = null;
        PreparedStatement updatePstmt = null;

        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            conn = dbc.getConnection();

            // 删除用户
            deletePstmt = conn.prepareStatement(deleteSql);
            deletePstmt.setInt(1, id);
            deletePstmt.executeUpdate();

            // 查询所有用户 ID
            selectPstmt = conn.prepareStatement(selectAllSql);
            ResultSet rs = selectPstmt.executeQuery();

            int newId = 1; // 从 1 开始重新编号
            while (rs.next()) {
                int currentId = rs.getInt("id");
                if (currentId != newId) {
                    // 如果当前 ID 不等于新 ID，更新当前 ID
                    updatePstmt = conn.prepareStatement(updateSql);
                    updatePstmt.setInt(1, newId);
                    updatePstmt.setInt(2, currentId);
                    updatePstmt.executeUpdate();
                }
                newId++; // 新 ID 自增
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (deletePstmt != null) deletePstmt.close();
                if (selectPstmt != null) selectPstmt.close();
                if (updatePstmt != null) updatePstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            dbc.close();
        }
    }

    //修改信息操作
    public void updateUser(User user) {
        String sql = "update note set content=? where id=?";
        DataBaseConnection dbc = null;
        Connection conn = null;
        PreparedStatement pstmt = null;

        // 下面是针对数据库的具体操作
        dbc = new DataBaseConnection();
        conn = dbc.getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getContent());
            pstmt.setInt(2, user.getId());
            //进行数据库更新操作
            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //关闭数据库连接
            dbc.close();
        }
    }

    // 查询所有信息
    public List<User> queryAll() {
        List<User> listAll = new ArrayList<User>();
        String sql = "select * from note";
        DataBaseConnection dbc = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        //下面是针对数据库的具体操作
        try {
            dbc = new DataBaseConnection();
            conn = dbc.getConnection();
            pstmt = conn.prepareStatement(sql);

            //进行数据库查询操作
            rs = pstmt.executeQuery();
            while (rs.next()) {
                //查询出所有记录，通过循环将每一条记录各个字段的值赋给user对象
                User user = new User();
                user.setId(rs.getInt(1));
                user.setUserid(rs.getString(2));
                user.setTitle(rs.getString(3));
                user.setContent(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setUrl(rs.getString(6));
                user.setIp(rs.getString(7));
                user.setWritetime(rs.getTimestamp("writetime"));
                //将user对象添加到List对象中
                listAll.add(user);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbc.close();
        }
        return listAll;
    }
}
