package com.kantiana.skb.service;

import com.kantiana.skb.model.User;

public interface MailService {
    void sendTo(String content, String to);
}
