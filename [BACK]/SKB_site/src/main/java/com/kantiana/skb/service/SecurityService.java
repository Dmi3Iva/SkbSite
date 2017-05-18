package com.kantiana.skb.service;


import com.kantiana.skb.model.User;

public interface SecurityService {
    // Возвращает зарегистрированного пользователя
    public User findLoggedUser();

    // Возвращает имя зарегистрированного пользователя
    public String findLoggedInUsername();

    public void autologin(String username, String password);
}
