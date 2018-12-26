package com.lxq.dao;

import com.lxq.model.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    List<User> getUserLogin(User user);
    List<Object> getUserList(Map<String, Object> user);
    int getUserCount(Map<String, Object> user);
    int getUserDelete(int pid);
    List<User> getAdminInfo(int pid);
}
