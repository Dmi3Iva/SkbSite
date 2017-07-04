package com.kantiana.skb.service;

import com.kantiana.skb.model.Booking;
import com.kantiana.skb.model.EquipmentTypeCount;

import java.sql.Date;
import java.util.List;

public interface BookingService {
    public void save(Booking booking);

    boolean canBook(List<EquipmentTypeCount> etcList, Date day, int timeMask);
}
