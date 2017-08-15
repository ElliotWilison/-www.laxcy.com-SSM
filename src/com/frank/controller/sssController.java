package com.frank.controller;//package com.frank.controller;
//
//import com.frank.bean.User;
//import javafx.beans.binding.ObjectExpression;
//import org.apache.commons.io.FileUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import javax.servlet.http.HttpServletRequest;
//import java.io.File;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//5
//
///**
// * Created by 啸 on 2017/4/26.
// */
//@Controller
//@RequestMapping("/home")
//public class HomeController {
//    private static final Logger logger=LoggerFactory.getLogger(HomeController.class);
//    @RequestMapping("/mvc")
//    public String hello()
//    {
//        logger.info("this is my first controller");
//       return "home";
//    }
//    @RequestMapping("item")
//    public String goItem()
//    {
//        logger.info("this is my first item");
//        return "item";
//    }
//    //方法一  利用RequetParam 进行页面跳转
//    @RequestMapping(value = "/action",method = RequestMethod.GET)
//    public String getAction(@RequestParam("id") Integer id, Model model)
//    {
//        Object x=id;
//        User user=new User(111,"frank");
//        model.addAttribute(user);
//        logger.info("i have got the id:"+id);
//        return  "action";
//    }
//
//    //方法二 利用PathVariable 获取参数 跳转 better
//    @RequestMapping(value = "/action2/{id}",method = RequestMethod.GET)
//    public String getAction1(@PathVariable("id") Integer id , Map<String,Object> model)
//    {
//        User user=new User(555,"jeson");
//  model.put("user",user);
// logger.info("i have got thi id 2:"+id);
// return  "action1";
//    }
//
//    //方法三 根据servlet 进行页面跳转
//    @RequestMapping("/action3")
//    public String getAction2(HttpServletRequest request)
//    {
//        int x=Integer.valueOf(request.getParameter("id"));
//        logger.info(String.valueOf(x));
//        request.setAttribute("asd",x);
//        return "action1";
//    }
//@RequestMapping(value = "/upload/result",method=RequestMethod.POST)
//    public String uploadFile(@RequestParam("file")MultipartFile file) {
//        logger.info("file name is :"+file.getOriginalFilename());
//    try {
//        FileUtils.copyInputStreamToFile(file.getInputStream(),new File("D:\\images",System.currentTimeMillis()+file.getOriginalFilename()));
//    } catch (IOException e) {
//        e.printStackTrace();
//    }
//return "action1";
//}
//    @RequestMapping(value="/upload")
//    public String  uload()
//    {
//        logger.info("got into uploadPage");
//        return  "/upload/load";
//    }
//
//
//@RequestMapping("/xmlJason")
//@ResponseBody
//    public Map<String,Object> getJason()
//{
//    List<User> list=new ArrayList<User>();
//    User user=new User(111,"frank");
//    User user1=new User(132,"hector");
//    list.add(user);
//    list.add(user1);
//    Map<String, Object> map = new HashMap<String, Object>();
//    map.put("list",list);
//    return  map;
//
//}
//}
