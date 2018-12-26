package com.lxq.model;

import java.io.Serializable;

public class User implements Serializable {
    private  int pid;
    private  String personname;
    private String personpwd;
    private int personage;
    private int persontel;
    private  int flate;
    private  String createdate;

    @Override
    public String toString() {
        return "User{" +
                "pid=" + pid +
                ", personname='" + personname + '\'' +
                ", personpwd='" + personpwd + '\'' +
                ", personage=" + personage +
                ", persontel=" + persontel +
                ", flate=" + flate +
                ", createdate='" + createdate + '\'' +
                '}';
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPersonname() {
        return personname;
    }

    public void setPersonname(String personname) {
        this.personname = personname;
    }

    public String getPersonpwd() {
        return personpwd;
    }

    public void setPersonpwd(String personpwd) {
        this.personpwd = personpwd;
    }

    public int getPersonage() {
        return personage;
    }

    public void setPersonage(int personage) {
        this.personage = personage;
    }

    public int getPersontel() {
        return persontel;
    }

    public void setPersontel(int persontel) {
        this.persontel = persontel;
    }

    public int getFlate() {
        return flate;
    }

    public void setFlate(int flate) {
        this.flate = flate;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public User(int pid, String personname, String personpwd, int personage, int persontel, int flate, String createdate) {
        this.pid = pid;
        this.personname = personname;
        this.personpwd = personpwd;
        this.personage = personage;
        this.persontel = persontel;
        this.flate = flate;
        this.createdate = createdate;
    }

    public User() {
    }
}
