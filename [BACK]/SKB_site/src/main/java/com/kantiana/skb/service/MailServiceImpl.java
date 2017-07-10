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

    @Autowired
    private MessageService messageService;

    @Override
    public void sendNewPassword(String username, String newPassword, String email) {
        SimpleMailMessage message = new SimpleMailMessage(templateMessage);
        message.setTo(email);
        message.setSubject(messageService.getMessage("Mail.newPassword.subject", username));
        message.setText(messageService.getMessage("Mail.newPassword.text", newPassword));
        mailSender.send(message);
    }
}
