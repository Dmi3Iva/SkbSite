package com.kantiana.skb.service;

import com.kantiana.skb.model.Booking;
import com.kantiana.skb.model.EquipmentTypeCount;

import java.sql.Date;
import java.util.List;

public interface BookingService {
    void save(Booking booking);

    List<Booking> findByDayAndEquipmentType(Date day, Long equipmentTypeId);

    List<Booking> findByRequestId(Long requestId);

    void removeById(Long id);
}
