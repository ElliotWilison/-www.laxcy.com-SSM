package com.frank.controller;

import com.frank.bean.User;
import com.frank.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Created by 啸 on 2017/5/20.
 */
@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    private UserService userService;
    private static final Logger logger= LoggerFactory.getLogger(HomeController.class);
    @RequestMapping("/")
    public String show_home(){
//
//logger.info("hello");
        return "home";
    }

    @RequestMapping(value = "/register")
    public String register()
    {
        return  "register";
    }

    @RequestMapping(value = "/register_success",method = RequestMethod.POST)
    public String re_success(@RequestParam("uname")String username, @RequestParam("password")String password ){

        userService.registerSave(username,password);
        return "success";
    }

    @RequestMapping("/show2")
    public String show2(HttpSession session)
    {
//        session.setMaxInactiveInterval();
//        session.invalidate();
        return  "index";
    }


    @RequestMapping(value = "/name_check",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String name_check(@RequestBody User user){
//        logger.info("this is the name:"+user.userName+"!!!!!!!!!!!!!!!!!!");
if(userService.findUserByName(user.userName)!=null)
            return "success";
        else
            return "err";
}

   @RequestMapping(value = "/user_login",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    public @ResponseBody User userLogin(@RequestBody User user,HttpSession session){
        User u=userService.userLogin(user.getUserName(),user.getPwd());
    if(u!=null){
        logger.info("login success");
        session.setAttribute("login_user",u);
        session.setMaxInactiveInterval(60*60*5);
//        User us=(User)session.getAttribute("login_user");
//        logger.info(us.getUserName());
        return  u;
    }
    else
    return null;
}

@RequestMapping(value="/login_check",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    public @ResponseBody User loginCheck(HttpSession session){
        User  user=(User)session.getAttribute("login_user");
        if(user!=null){
            return user;
        }else
            return  null;
}

@RequestMapping("/user_loginout")
    public String loginout(HttpSession session)
{
session.invalidate();
return "redirect:/";
}
}
