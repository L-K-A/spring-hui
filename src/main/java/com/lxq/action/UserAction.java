package com.lxq.action;

import com.github.pagehelper.Page;
import com.lxq.model.User;
import com.lxq.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserAction {

    @Resource
    private UserService userService;

    @RequestMapping("/gologin.action")
    public ModelAndView adminlogin(User user) {
        List userslist = userService.queryUserLogin(user);
        if (userslist.size() > 0) {
            return new ModelAndView("index","userinfo",userslist);
        }
        return new ModelAndView("login");
    }

    @RequestMapping("/userlist.action")
    public Map userlist(int pageSize, int pageNum, User user) {
        Map map = new HashMap();
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);
        map.put("user", user);

        Page page = userService.queryUserList(map);
        map.put("pagelist", page);
        map.put("totalPage", page.getPages());
        return map;
    }

    @RequestMapping("/userdelete.action")
    public Map deleteuserlist(int pid) {
        int a = userService.queryUserdelete(pid);
        Map map = new HashMap();
        map.put("resu", a);
        return map;
    }

    @RequestMapping("/getadmininfo.action")
    public ModelAndView getadmin(int pid){

        List adminlist=userService.queryAdminInfo(pid);

        return new ModelAndView("admininfo","adminlist",adminlist);
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
