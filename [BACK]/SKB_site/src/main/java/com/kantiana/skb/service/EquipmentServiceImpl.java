package com.kantiana.skb.service;

import com.kantiana.skb.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EquipmentServiceImpl implements EquipmentService {
    @Autowired
    BookingRepository bookingRepository;

}