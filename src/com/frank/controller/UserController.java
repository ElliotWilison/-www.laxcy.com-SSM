//package com.frank.controller;
//
//import com.frank.bean.User;
//import com.frank.service.UserService;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import java.util.List;
//
//
///**
// * Created by 啸 on 2017/4/27.
// */
//@Controller
//@RequestMapping("/user")
//public class UserController {
//    @Autowired
//    private   UserService userService;
//
//    private static final Logger logger= LoggerFactory.getLogger(UserController.class);
//    @RequestMapping("/person")
//    public String getPage(){
//
//        return "/user/add";
//    }
//
//    @RequestMapping(value = "/add",method = RequestMethod.POST)
//    public String addUser(@RequestParam("username") String username, @RequestParam("pwd") String pwd, Model model)
//    {
//
//        User user=new User();
//        user.setUserName(username);
//        user.setPassword(pwd);
//        logger.info(username+"!!!!!!!!!");
//        userService.save(user);
//        return "redirect:/user/list";
//
//    }
//
//
//    @RequestMapping("/list")
//public String getList(Model model){
//
//        List<User> list=userService.findAll();
//
//        if(list!=null){
//            logger.info("list has been filled");
//            logger.info(list.get(0).getUserName());
//        }
//
//        else
//            logger.info("list is null");
//
//        model.addAttribute("list",list);
//        return "/user/userList";
//
//    }
//
//    @RequestMapping("/delete/{id}")
//    public String doDelete(@PathVariable("id") Integer id){
//userService.deleteById(id);
//logger.info("this user has been deleted");
//return "redirect:/user/list";
//
//    }
//
//}
