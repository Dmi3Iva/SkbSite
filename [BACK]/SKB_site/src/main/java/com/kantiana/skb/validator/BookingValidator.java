package com.kantiana.skb.validator;

import com.kantiana.skb.model.EquipmentType;
import com.kantiana.skb.model.RequestEquipment;
import org.springframework.validation.Errors;

import java.util.Set;

public interface BookingValidator {
    void validateAddingToBasket(EquipmentType chosenEquipment, Set<EquipmentType> basket, Errors errors);

    void validateBooking(RequestEquipment requestEquipment, Errors errors);
}
