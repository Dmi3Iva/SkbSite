package com.kantiana.skb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private SimpleMailMessage templateMessage;

    //TODO: Текст письма хранить в отдельном файле, откуда он читается при вызове данной функции
    @Override
    public void sendNewPassword(String username, String newPassword, String email) {
        SimpleMailMessage message = new SimpleMailMessage(templateMessage);
        message.setTo(email);
        message.setSubject("Сайт СКБ, новый пароль для пользователя " + username);
        message.setText("Ваш новый пароль: " + newPassword);
        mailSender.send(message);
    }
}
