package com.kantiana.skb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageSource messageSource;

    @Override
    public String getMessage(String messageCode, Object ... arg) {
        return messageSource.getMessage(messageCode, arg, LocaleContextHolder.getLocale());
    }
}
