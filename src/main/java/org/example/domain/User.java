package org.example.domain;

import java.util.Date;

public class User {
    private String id;
    private String pwd;
    private String name;
    private String email;
    private Date birth;
    private String sns;
// setter 설정 --> 연습겸 직접 만들었다.
    public void setId(String id){
        this.id = id;
    }
    public void setPwd(String pwd){
        this.pwd = pwd;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public void setBirth(Date birth){
        this.birth = birth;
    }
    public void setSns(String sns){
        this.sns = sns;
    }
    // getter 설정 --> 연습겸 직접 만들었다.
    public String getId(){
        return this.id;
    }
    public String getPwd(){
        return this.pwd;
    }
    public String getName(){
        return this.name;
    }
    public String getEmail(){
        return this.email;
    }
    public Date getBirth(){
        return this.birth;
    }
    public String getSns(){
        return this.sns;
    }
    // toString 설정 --> 연습겸 직접 만들었다.
    @Override
    public String toString(){
        return "USER [ id="+ id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", birth=" + birth + ", sns=" + sns + "]";
    }

}
