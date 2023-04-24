package com.whut.controller;

import com.whut.pojo.User;
import com.whut.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/")
    public ModelAndView loginstart(){
        ModelAndView modol = new ModelAndView("/WebContent/start.jsp");
        return modol;
    }

    @RequestMapping(value = "login")
    public ModelAndView login(){
        ModelAndView modol = new ModelAndView("/WebContent/start.jsp");
        return modol;
    }

    @RequestMapping(value = "logindo")
    public String logindo(User user, Model model){
        if(userService.userLogin(user)) {
            model.addAttribute("users",userService.getUserByName(user.getUsername()));
            return "/WebContent/main.jsp";
        }
        else {
            return "/WebContent/start.jsp";
        }
    }

    @RequestMapping(value = "sign")
    public ModelAndView sign(){
        ModelAndView modol = new ModelAndView("/WebContent/sign.jsp");
        return modol;
    }


    @RequestMapping(value = "signdo")
    public ModelAndView signdo(User user, Model model){
        ModelAndView modelAndView = new ModelAndView();
        if(userService.addUser(user)) {
            modelAndView.setViewName("/WebContent/start.jsp");
        }
        else {
            modelAndView.setViewName("/WebContent/sign.jsp");
        }
        return modelAndView;
    }

    @RequestMapping(value = "changepwd")
    public ModelAndView changepwd(){
        ModelAndView modol = new ModelAndView("/WebContent/changepwd.jsp");
        return modol;
    }

    @RequestMapping(value = "changepwddo")
    public ModelAndView changepwddo(User user){
        ModelAndView model = new ModelAndView("/WebContent/changepwd.jsp");
        User userDB= userService.getUserByName(user.getUsername());
        if(userDB!=null){
            userDB.setUserpwd(user.getUserpwd());
            userService.updateUser(userDB);
            model.setViewName("/WebContent/start.jsp");
        }else{
            model.setViewName("/WebContent/changepwd.jsp");
        }
        return model;
    }

}


