package com.kantiana.skb.service;

import com.kantiana.skb.model.Request;
import com.kantiana.skb.repository.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RequestServiceImpl implements RequestService {
    @Autowired
    RequestRepository requestRepository;

    public void save(Request request){
        requestRepository.save(request);
    }

    @Override
    public List<Request> findByUserId(Long userId) {
        return requestRepository.findByUserId(userId);
    }
}
