package com.kantiana.skb.service;

import com.kantiana.skb.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import sun.java2d.pipe.SpanShapeRenderer;

@Service
public class MailServiceImpl implements MailService {
    @Autowired
    JavaMailSender mailSender;

    @Override
    public void sendTo(String content, String to) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("skb.noreply@mail.ru");
        message.setTo(to);
        message.setSubject("SKB");
        message.setText(content);
        mailSender.send(message);
    }
}
