package com.frank.controller;

import com.frank.bean.Fan;
import com.frank.bean.Subscribe;
import com.frank.bean.User;
import com.frank.service.Subs_fanService;
import com.frank.service.UserService;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.web.multipart.MultipartFile;


/**
 * Created by 啸 on 2017/6/7.
 */
@Controller
@RequestMapping("/my")
public class MyController {
    @Autowired
    private Subs_fanService subs_fanService;
    @Autowired
    private UserService userService;
    private static final Logger logger = LoggerFactory.getLogger(MyController.class);
    int mobile_code = (int)((Math.random()*9+1)*100000);
    @RequestMapping("/info")
    public String userInfo(HttpSession session, Model model) throws ParseException {
        User user = (User) session.getAttribute("login_user");
        if (user != null) {
            int fans_count = subs_fanService.countUserFans(user.userName);
            int subs_count = subs_fanService.countUserSubscribe(user.userName);
            model.addAttribute("fans_c", fans_count);
            model.addAttribute("subs_c", subs_count);
            model.addAttribute("c_user", user);
            return "my/user_info";
        } else
            return "error";
    }

    @RequestMapping("/msg")
    public String getMsg() {
        return "my/user_msg";
    }
    @RequestMapping(value = "/user_save", method = RequestMethod.POST)
    public String userSave(@RequestParam("u_sex") String userSex,
                           @RequestParam("u_bir") String userBirth,
                           @RequestParam("u_pho") String userPhone,
                           @RequestParam("u_mal") String userMail,
                           @RequestParam("u_sig") String userSignature,
                           @RequestParam("u_loc") String userLocation, HttpSession session) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
//        java.util.Date dateTest = null;
//            dateTest = simpleDateFormat.parse(userBirth);
//        java.sql.Date date = new java.sql.Date(dateTest.getTime());
        User user = (User) session.getAttribute("login_user");
        user.setSex(userSex);
        user.setBirth(simpleDateFormat.parse(userBirth));
        user.setUserPhone(userPhone);
        user.setUserMail(userMail);
        user.setLocation(userLocation);
        user.setSignature(userSignature);
        userService.updatePersonalInfo(user);
        return "redirect:/my/info";
    }

@RequestMapping(value = "/get_path",method = RequestMethod.POST)
public String getImgPath(@RequestParam("user_file")MultipartFile file,HttpSession session){
    User u=(User)session.getAttribute("login_user");
        logger.info("file name is :"+file.getOriginalFilename());
    try {
        String path="D:\\IntelliJ IDEA Project\\Lacxy\\src\\main\\webapp\\resource\\user\\"+u.userName+"\\img";
        FileUtils.copyInputStreamToFile(file.getInputStream(),new File(path,file.getOriginalFilename()));
        userService.updatePersonalImg(u.userName,"/resource/user/"+u.userName+"/img/"+file.getOriginalFilename());
        u.userImg="/resource/user/"+u.userName+"/img/"+file.getOriginalFilename();
        session.setAttribute("login_user",u);

    } catch (IOException e) {
        e.printStackTrace();
    }

        return "redirect:/my/info";
}


    @RequestMapping("/phone_bind")
    public String userPhoneBind(){
      return "my/user_bindpho";
    }
    @RequestMapping(value = "/phone_binded",method = RequestMethod.POST)
    public String userPhoneBinded(@RequestParam("pho")String phone_num,@RequestParam("check")String check, HttpSession session){
        User u=(User)session.getAttribute("login_user");
        if(Integer.parseInt(check)==mobile_code) {
            userService.bindUserPhone(u.userName, phone_num);
            u.bindPhone=phone_num;
            session.setAttribute("login_user",u);
            return "success";
        }
        else
        {
            return "error";
        }
    }

    @RequestMapping(value = "/get_phone",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String userGetPhone(@RequestBody User user,HttpSession session){
        User us=(User)session.getAttribute("login_user");
         String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
        String pho=user.userPhone;
        HttpClient client = new HttpClient();
        PostMethod method = new PostMethod(Url);
        client.getParams().setContentCharset("GBK");
        method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");
        String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
        if(us!=null) {
            NameValuePair[] data = {//提交短信
                    new NameValuePair("account", "C48949664"), //APPID C48949664
                    new NameValuePair("password", "943555f83ed77aa83f974a3372eb423a"), //查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
                    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
                    new NameValuePair("mobile", pho),
                    new NameValuePair("content", content),
            };
            method.setRequestBody(data);
            try {
                client.executeMethod(method);
                String SubmitResult = method.getResponseBodyAsString();
                Document doc = DocumentHelper.parseText(SubmitResult);
                Element root = doc.getRootElement();
                String code = root.elementText("code");
                String msg = root.elementText("msg");
                String smsid = root.elementText("smsid");
                System.out.println(code);
                System.out.println(msg);
                System.out.println(smsid);

                if ("2".equals(code)) {
                    System.out.println("短信提交成功");
                }

            } catch (HttpException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (DocumentException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return "success";
        }
        else
            return "error";
    }


    @RequestMapping("/mail_bind")
    public String userMailBind(){
        return "my/user_bindmail";
    }

    @RequestMapping(value = "/my_fans",method = RequestMethod.POST,produces = "application/json;charset=utf-8")

    public  @ResponseBody  List<Fan> userFans(@RequestBody Fan fan) {
        List<Fan> fan_list=subs_fanService.showUserFans(fan.user_name);
         return fan_list;
    }

    @RequestMapping(value = "/my_subs",method = RequestMethod.POST,produces = "application/json;charset=utf-8")

    public @ResponseBody  List<Subscribe> userSubs(@RequestBody Subscribe subscribe){
        List<Subscribe> subs_list=subs_fanService.showUserSubscribe(subscribe.user_name);
        return subs_list;
    }

    @RequestMapping("/write")
    public String userWrite(HttpSession session,Model model)
    {
        User user=(User)session.getAttribute("login_user");
if(user!=null)
{
    model.addAttribute("user",user);
        return "my/user_write";
}
else
    return  "error";
    }


    @RequestMapping("/phone_change")
    public String userPhoneChange(){
        return "my/user_changepho";
    }

    @RequestMapping("/mail_change")
    public String userMailChange(){
        return "my/user_changemal";
    }


}