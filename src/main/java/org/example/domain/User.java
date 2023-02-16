package org.example.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.Objects;

public class User {
    public User(){

    }
    public User(String id, String pwd, String name, String email, Date birth, String sns, Date reg_date) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.birth = birth;
        this.sns = sns;
        this.reg_date = reg_date;
    }

    private String id;
    private String pwd;
    private String name;
    private String email;
    @DateTimeFormat(pattern="yyyy/MM/dd")
    private Date birth;
    private String sns;
    private Date reg_date;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id.equals(user.id) && Objects.equals(pwd, user.pwd) && Objects.equals(name, user.name) && Objects.equals(email, user.email) && Objects.equals(birth, user.birth) && Objects.equals(sns, user.sns);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pwd, name, email, birth, sns);
    }

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
    public void setReg_date(Date reg_date){
        this.reg_date = reg_date;
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
    public Date getReg_date(){
        return this.reg_date;
    }
    // toString 설정 --> 연습겸 직접 만들었다.
    @Override
    public String toString(){
        return "USER [ id="+ id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", birth=" + birth + ", sns=" + sns + ", reg_date=" + reg_date + "]";
    }

}
