package com.lxq.service;

import com.github.pagehelper.Page;
import com.lxq.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    List<User> queryUserLogin(User user);
    Page queryUserList(Map<String,Object> map);
    int queryUserdelete(int pid);
    List<User> queryAdminInfo(int pid);
}
