package com.kantiana.skb.validator;

import com.kantiana.skb.model.Booking;
import com.kantiana.skb.model.EquipmentType;
import com.kantiana.skb.model.EquipmentTypeCount;
import com.kantiana.skb.model.RequestEquipment;
import com.kantiana.skb.service.BookingService;
import com.kantiana.skb.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

@Component
public class BookingValidatorImpl implements BookingValidator {
    @Autowired
    BookingService bookingService;
    @Autowired
    EquipmentService equipmentService;

    @Override
    public void validateAddingToBasket(EquipmentType chosenEquipment, Set<EquipmentType> basket, Errors errors) {
        if (basket.contains(chosenEquipment)) {
            errors.rejectValue("id", "Duplicate.basket.equipment");
        }
    }

    @Override
    public void validateBooking(RequestEquipment requestEquipment, Errors errors) {
        List<EquipmentTypeCount> chosenEquipments = requestEquipment.getEquipmentTypeCountList();
        Date chosenDay = requestEquipment.getSqlDate();
        int chosenTimeMask = requestEquipment.getChosenTimeMask();
        validateChosenDay(chosenDay, errors);
        validateChosenTime(chosenTimeMask, errors);
        validateCount(chosenEquipments, errors);
        if (errors.hasErrors()) {
            return;
        }
        validateChosenEquipments(chosenEquipments, chosenDay, chosenTimeMask, errors);
    }

    private void validateChosenDay(Date chosenDay, Errors errors) {
        if (chosenDay == null) {
            errors.rejectValue("date", "NotEmpty.booking.date");
            return;
        }
        Date today = getToday();
        if (chosenDay.compareTo(today) < 0) {
            errors.rejectValue("date", "NotValid.booking.date");
        }
    }

    private void validateChosenTime(int chosenTimeMask, Errors errors) {
        if (chosenTimeMask == 0) {
            errors.rejectValue("chosenTime", "NotEmpty.booking.chosenTime");
        }
    }

    private void validateCount(List<EquipmentTypeCount> chosenEquipments, Errors errors) {
        for (EquipmentTypeCount etc : chosenEquipments) {
            if (etc.getCount() == null) {
                errors.rejectValue("equipmentTypeCountList", "NotEmpty.equipment.count");
                return;
            }
            if (etc.getCount() <= 0) {
                errors.rejectValue("equipmentTypeCountList", "NotValid.equipment.count.notPositive");
            }
            else if (etc.getCount() > equipmentService.countByEquipmentTypeId(etc.getId())) {
                Object[] arg = {etc.getCount(), etc.getName()};
                errors.rejectValue("equipmentTypeCountList", "NotValid.equipment.count.tooMany", arg, "");
            }
        }
    }

    private int getTimeMaskWhenEquipmentIsFree(EquipmentTypeCount chosenEquipment, Date chosenDay) {
        final int TIME_RANGES_COUNT = RequestEquipment.makeTimeList().size();
        int bookedEquipmentsCounts[] = new int[TIME_RANGES_COUNT];
        List<Booking> bookings = bookingService.findByDayAndEquipmentType(chosenDay, chosenEquipment.getId());
        int allEquipmentCount = equipmentService.countByEquipmentTypeId(chosenEquipment.getId());
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
        int freeTimeMask = 0;
        for (int i = 0; i < TIME_RANGES_COUNT; ++i) {
            if (allEquipmentCount - bookedEquipmentsCounts[i] >= chosenEquipment.getCount()) {
                freeTimeMask |= (1 << i);
            }
        }
        return freeTimeMask;
    }

    private void validateChosenEquipments(List<EquipmentTypeCount> chosenEquipments, Date chosenDay, int chosenTimeMask, Errors errors) {
        int commonFreeTimeMask = (1 << RequestEquipment.makeTimeList().size()) - 1;
        for (EquipmentTypeCount e : chosenEquipments) {
            int freeTimeMask = getTimeMaskWhenEquipmentIsFree(e, chosenDay);
            commonFreeTimeMask &= freeTimeMask;
            if ((chosenTimeMask & freeTimeMask) != chosenTimeMask) {
                Object[] arg = {e.getName()};
                errors.rejectValue("equipmentTypeCountList", "NotFree.equipment", arg, "");
                Object[] arg1 = {e.getName(), e.getCount(), getTimeString(freeTimeMask)};
                errors.rejectValue("equipmentTypeCountList", "Booking.time.recommendation", arg1, "");
            }
        }
        if (errors.hasErrors()) {
            Object[] arg = {getTimeString(commonFreeTimeMask)};
            errors.rejectValue("equipmentTypeCountList", "Booking.set.recommendation", arg, "");
        }
    }

    //ВНИМАНИЕ!!! ФУНКЦИЯ РАБОТАЕТ, ЕСЛИ ОТРЕЗКИ ВРЕМЕНИ ХРАНЯТСЯ В ФОРМАТЕ hh.mm-hh.mm
    private String getTimeString(int timeMask) {
        List<String> timeList = RequestEquipment.makeTimeList();
        StringBuilder sb = new StringBuilder();
        int i = -1;
        String leftTime = null, rightTime = null;
        for (String timeRange : timeList) {
            ++i;
            if ((timeMask & (1 << i)) == 0) {
                if (leftTime != null) {
                    sb.append(leftTime.substring(0, leftTime.indexOf('-')));
                    sb.append('-');
                    sb.append(rightTime.substring(rightTime.indexOf('-') + 1, rightTime.length()));
                    sb.append(", ");
                }
                leftTime = rightTime = null;
            }
            else {
                if (leftTime == null) {
                    leftTime = rightTime = timeRange;
                }
                else {
                    rightTime = timeRange;
                }
            }
        }
        if (leftTime != null) {
            sb.append(leftTime.substring(0, leftTime.indexOf('-')));
            sb.append('-');
            sb.append(rightTime.substring(rightTime.indexOf('-') + 1, rightTime.length()));
            sb.append(", ");
        }
        sb.delete(sb.length() - 2, sb.length());
        return sb.toString();
    }

    private Date getToday() {
        Date today = new Date(System.currentTimeMillis());
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date utilDate = format.parse(today.toString());
            today.setTime(utilDate.getTime());
        }
        catch (ParseException pEx) {
            pEx.printStackTrace();
        }
        return today;
    }
}
