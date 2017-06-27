package com.kantiana.skb.service;


import com.kantiana.skb.model.User;

public interface SecurityService {
    // Возвращает зарегистрированного пользователя
    User findLoggedUser();

    // Возвращает имя зарегистрированного пользователя
    String findLoggedInUsername();

    void login(String username, String password);

    void relogin(String username, String password);
}
