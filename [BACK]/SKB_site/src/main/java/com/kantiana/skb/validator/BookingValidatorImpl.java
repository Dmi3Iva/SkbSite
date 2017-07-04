package com.kantiana.skb.validator;

import com.kantiana.skb.model.EquipmentType;
import com.kantiana.skb.model.EquipmentTypeCount;
import com.kantiana.skb.model.RequestEquipment;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import java.sql.Date;
import java.util.List;
import java.util.Set;

@Component
public class BookingValidatorImpl implements BookingValidator {
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
        int chosenTime = requestEquipment.getChosenTimeMask();
        for (EquipmentTypeCount etc : chosenEquipments) {
            if (!canBook(etc, chosenDay, chosenTime)) {
                errors.rejectValue("")
            }
        }
    }
}
