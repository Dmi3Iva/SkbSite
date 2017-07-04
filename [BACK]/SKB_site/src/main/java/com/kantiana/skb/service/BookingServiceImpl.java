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
    public boolean canBook(List<EquipmentTypeCount> etcList, Date day, int timeMask) {
        List<Booking> bookings;
        int allEquipmentCount;
        final int TIME_RANGES_COUNT = 19; // Размер нужно как-то получать
        int bookedEquipmentsCounts[] = new int[TIME_RANGES_COUNT];
        int timeMask2, timeMask3 = (1 << TIME_RANGES_COUNT) - 1;
        for (EquipmentTypeCount etc : etcList) {
            bookings = bookingRepository.findByDayAndEquipmentType(day, etc.getId());
            allEquipmentCount = equipmentService.countByEquipmentTypeId(etc.getId());
            // Сюда можно написать Димину оптимизацию
            for (int i = 0; i < TIME_RANGES_COUNT; ++i) {
                bookedEquipmentsCounts[i] = 0;
            }
            for (Booking booking : bookings) {
                for (int i = 0; i < TIME_RANGES_COUNT; ++i) {
                    if ((booking.getTimeMask() & (1 << i)) != 0) {
                        ++bookedEquipmentsCounts[i];
                    }
                }
            }
            timeMask2 = 0;
            for (int i = 0; i < TIME_RANGES_COUNT; ++i) {
                if (allEquipmentCount - bookedEquipmentsCounts[i] >= etc.getCount()) {
                    timeMask2 |= (1 << i);
                }
            }
            timeMask3 &= timeMask2;
        }
        return (timeMask & timeMask3) == timeMask;
    }
}