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

    @Override
    public void sendNewPassword(String newPassword, String to) {
        SimpleMailMessage message = new SimpleMailMessage(templateMessage);
        message.setTo(to);
        message.setSubject("Сайт СКБ, новый пароль");
        message.setText("Ваш новый пароль: " + newPassword);
        mailSender.send(message);
    }
}
