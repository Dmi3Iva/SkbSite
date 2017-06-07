package com.kantiana.skb.service;

import com.kantiana.skb.model.EquipmentType;
import com.kantiana.skb.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EquipmentTypeServiceImpl implements EquipmentTypeService {
    @Autowired
    BookingRepository bookingRepository;

}