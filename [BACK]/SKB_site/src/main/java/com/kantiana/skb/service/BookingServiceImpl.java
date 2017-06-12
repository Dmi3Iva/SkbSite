package com.kantiana.skb.service;

import com.kantiana.skb.model.Booking;
import com.kantiana.skb.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingServiceImpl implements BookingService {
    @Autowired
    BookingRepository bookingRepository;

    public void save(Booking booking){
        bookingRepository.save(booking);
    }

}