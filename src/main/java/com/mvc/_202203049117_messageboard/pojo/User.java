package com.mvc._202203049117_messageboard.pojo;
import java.sql.Timestamp;

public class User {
    private int id;
    private String userid;
    private String title;
    private String content;
    private String email;
    private String url;
    private String ip;
    private Timestamp writetime;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }

    public String getIp() {
        return ip;
    }
    public void setIp(String ip) {
        this.ip = ip;
    }

    public Timestamp getWritetime() {
        return writetime;
    }
    public void setWritetime(Timestamp writetime) {
        this.writetime = writetime;
    }
}

