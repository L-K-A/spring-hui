package com.lxq.serviceImp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lxq.dao.UserDao;
import com.lxq.model.User;
import com.lxq.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service("userService")
public class UserServiceImp implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    public List<User> queryUserLogin(User user) {
        return userDao.getUserLogin(user);
    }

    @Override
    public Page queryUserList(Map<String, Object> map) {
        Page page =new Page();
        page.setTotal(userDao.getUserCount(map));
        System.out.println(userDao.getUserCount(map));
        int pagesize=Integer.parseInt(String.valueOf(map.get("pageSize")));
        page.setPageSize(pagesize);

        int pagenum=Integer.parseInt(String.valueOf(map.get("pageNum")));
        page.setPageNum(pagenum);
        page= PageHelper.startPage(pagenum,pagesize);
        userDao.getUserList(map);
        System.out.println(userDao.getUserList(map));
        return page;
    }

    @Override
    public int  queryUserdelete(int pid) {
       return userDao.getUserDelete(pid);
    }

    @Override
    public List<User> queryAdminInfo(int pid) {

        return userDao.getAdminInfo(pid);
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
