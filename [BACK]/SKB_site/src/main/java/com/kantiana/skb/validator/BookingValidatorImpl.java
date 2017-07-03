package com.kantiana.skb.validator;

import com.kantiana.skb.model.EquipmentType;
import com.kantiana.skb.model.RequestEquipment;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

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

    }
}
