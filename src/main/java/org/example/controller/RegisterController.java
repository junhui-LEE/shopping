package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.example.domain.User;

import java.net.URLDecoder;
import java.net.URLEncoder;

@Controller
@RequestMapping("/register")
public class RegisterController{
    @RequestMapping (value="/add", method={RequestMethod.GET, RequestMethod.POST})
    public String register(){
        return "registerForm";
    }
    @PostMapping("/save")
    public String save(User user, Model m) throws Exception{
        // 1. 유효성 검사
        if(!isValid(user)){
            String msg = URLEncoder.encode("id를 잘못 입력 하셨습니다.", "utf-8");
            m.addAttribute("msg", msg);
            return "forward:/register/add";
           // return "redirect:/register/add?msg="+msg;

        }
        return "registerInfo";
        // 2. DB에 신규 회원 정보를 저장
    }
    private static boolean isValid(User user){
        return false;
    }


}