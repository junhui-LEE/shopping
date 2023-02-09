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
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController{
    @InitBinder
    public void toDate(WebDataBinder binder){
        ConversionService conversionService = binder.getConversionService();
      //  System.out.println("conversionService = " + conversionService);
        //    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
      //  binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
        binder.registerCustomEditor(String[].class, "hobby", new StringArrayPropertyEditor("#"));
        binder.setValidator(new UserValidator()); // UserValidator을 WebDataBinder의 로컬 validator로 등록
     //   binder.addValidators(new UserValidator()); // UserValidator을 WebDataBinder의 로컬 validator로 등록
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

        // 수동검증 - Validator을 직접 생성하고, Validator을 직접 호출
//        UserValidator userValidator = new UserValidator();
//        userValidator.validate(user, result); // BindingResult 는 Errors의 자손이다.
//                                              // 그래서 이렇게 써도 된다.
        // 이렇게 검증한 다음에 확인을 해야 겠다.
        // User객체를 검증한 결과 에러가 있으면, registerForm을 이용해서 에러를 보여준다.
        if(result.hasErrors()){
            return "registerForm";
        }

//        // 1. 유효성 검사
//        if(!isValid(user)){
//            String msg = URLEncoder.encode("id를 잘못 입력 하셨습니다.", "utf-8");
//
//            m.addAttribute("msg", msg);
//            return "forward:/register/add";
//           // return "redirect:/register/add?msg="+msg;
//
//        }
// 2. DB에 신규회원 정보를 저장
        return "registerInfo";
    }
    private static boolean isValid(User user){
        return false;
    }


}