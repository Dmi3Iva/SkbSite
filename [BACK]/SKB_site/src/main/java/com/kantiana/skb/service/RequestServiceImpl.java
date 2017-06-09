package com.kantiana.skb.service;

import com.kantiana.skb.repository.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RequestServiceImpl {
    @Autowired
    RequestRepository requestRepository;
}
