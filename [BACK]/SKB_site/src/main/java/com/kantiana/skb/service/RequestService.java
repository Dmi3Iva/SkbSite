package com.kantiana.skb.service;

import com.kantiana.skb.model.Request;

import java.util.List;


public interface RequestService {
    void save(Request request);

    List<Request> findByUserId(Long userId);
}
