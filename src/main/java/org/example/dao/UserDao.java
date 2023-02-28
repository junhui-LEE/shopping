package org.example.dao;

import org.example.domain.User;

public interface UserDao {
    int deleteUser(String id);
    User selectUser(String id);
    int insertUser(User user);
    int updateUser(User user);
    int count() throws Exception;
    void deleteAll() throws Exception;
}
