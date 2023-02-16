package org.example.controller;

import org.example.domain.User;
import org.example.domain.UserValidator;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController{
    @InitBinder
    public void toDate(WebDataBinder binder){
        ConversionService conversionService = binder.getConversionService();
        System.out.println("conversionService = " + conversionService);

        binder.registerCustomEditor(String[].class, "hobby", new StringArrayPropertyEditor("#"));


        List<Validator> validatorList = binder.getValidators();
        System.out.println("validatorList = " + validatorList);
    }
    @RequestMapping (value="/add", method={RequestMethod.GET, RequestMethod.POST})
    public String register(){
        return "registerForm";
    }
    @PostMapping("/save")
    public String save(@Valid User user, BindingResult result, Model m) throws Exception{
        System.out.println("result = " + result);
        System.out.println("user = "+user);


        if(result.hasErrors()){
            return "registerForm";
        }

// 2. DB에 신규회원 정보를 저장
        return "registerInfo";
    }
    private static boolean isValid(User user){
        return false;
    }


}