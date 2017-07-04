package com.kantiana.skb.service;

import com.kantiana.skb.model.Booking;
import com.kantiana.skb.model.EquipmentTypeCount;
import com.kantiana.skb.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class BookingServiceImpl implements BookingService {
    @Autowired
    BookingRepository bookingRepository;

    @Autowired
    EquipmentService equipmentService;

    public void save(Booking booking){
        bookingRepository.save(booking);
    }

    @Override
    public List<Booking> findByDayAndEquipmentType(Date day, Long equipmentTypeId) {
        return bookingRepository.findByDayAndEquipmentType(day, equipmentTypeId);
    }
}