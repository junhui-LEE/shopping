package org.example.controller;

import org.example.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DBConnectionTest2Test {
    @Autowired
    DataSource ds;

    @Test
    public void insertUserTest() throws Exception{
        User user = new User("asdf", "1234", "abc", "aaa@aaa.com", new Date(), "fb", new Date());
        deleteAll();
        int rowCnt = insertUser(user);

        assertTrue(rowCnt == 1);
    }
    @Test
    public void deleteUserTest() throws Exception{
        deleteAll();
        assertTrue(0 == deleteUser("asdf2"));
        User user = new User("asdf2", "1234", "abc", "aaa@aaa.com", new Date(), "fb", new Date());
        insertUser(user);
        assertTrue(1 == deleteUser("asdf2"));
        assertTrue(selectUser("asdf2") == null);
    }

    @Test
    public void updateUserTest() throws Exception{
        deleteAll(); // 다 지우고
        User user = new User("asdf", "1234", "abc", "aaa@aaa.com", new Date(), "fb", new Date());
        int rowCnt = insertUser(user); // 한개의 행 넣었다.
        assertTrue(rowCnt == 1); // 한개의 행 넣은것 테스트
        int rowCnt2 = updateUser(user); // 기존의 한개의 행의 pwd 바꿨다.
        assertTrue(rowCnt == rowCnt2); // 기존의 한개의 행의 pwd 바꾼것 테스트
        User user2 = selectUser(user.getId()); // 바꾼 한개의 행을 user2에 넣었다.
        assertTrue(user2.getPwd().equals("7777")); // 바꾼 한개의 행의 pwd가 7777인지 테스트

    }

    @Test
    public void selectUserTest() throws Exception{
        deleteAll();
        User user = new User("asdf2", "1234", "abc", "aaa@aaa.com", new Date(), "fb", new Date());
        int rowCnt = insertUser(user);
        User user2 = selectUser("asdf2"); // user2 : DB에 id가 asdf2인 row의 정보가 담긴 객체
        assertTrue(user2.getId().equals(user.getId()));//db로 부터 가져온 user2의 id와 db에 넣기전의 user의 id와 같니?
    }
    public User selectUser(String id) throws Exception{
        Connection conn = ds.getConnection();
        String sql = "select * from user_info where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            User user = new User();
            user.setId(rs.getString(1));
            user.setPwd(rs.getString(2));
            user.setName(rs.getString(3));
            user.setEmail(rs.getString(4));
            user.setBirth(new Date(rs.getDate(5).getTime()));
            user.setSns(rs.getString(6));
            user.setReg_date(new Date(rs.getDate(7).getTime()));
            return user;
        }
        return null;
    }
    public int updateUser(User user) throws Exception {
        Connection conn = ds.getConnection();
        String sql = "update user_info set pwd=7777 where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, user.getId());
        return pstmt.executeUpdate();
    }


    public int deleteUser(String id) throws Exception{
        Connection conn = ds.getConnection();
        String sql = "delete from user_info where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        return pstmt.executeUpdate();
    }
    // 사용자 정보를 user_info테이블에 저장하는 메서드
    public void deleteAll() throws Exception{
        Connection conn = ds.getConnection();

        String sql = "delete from user_info";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
    }
    public int insertUser(User user) throws Exception{
        Connection conn = ds.getConnection();

        String sql = "insert into user_info values (?, ?, ?, ?, ?, ?, now())";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, user.getId());
        pstmt.setString(2, user.getPwd());
        pstmt.setString(3, user.getName());
        pstmt.setString(4, user.getEmail());
        pstmt.setDate(5, new java.sql.Date(user.getBirth().getTime()));
        pstmt.setString(6, user.getSns());

        int rowCnt = pstmt.executeUpdate();

        return rowCnt;
    }

    @Test
    public void springJdbcConnectionTest() throws Exception{
        Connection conn = ds.getConnection();
        System.out.println("conn = " + conn);
        assertTrue(conn!=null);
    }
}