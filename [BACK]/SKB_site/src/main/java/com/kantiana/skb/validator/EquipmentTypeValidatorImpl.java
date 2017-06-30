package com.kantiana.skb.validator;

import com.kantiana.skb.model.EquipmentType;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class EquipmentTypeValidatorImpl implements EquipmentTypeValidator {
    @Override
    public void validate(EquipmentType equipmentType, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.equipmentType.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "about", "NotEmpty.equipmentType.about");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "features", "NotEmpty.equipmentType.features");
    }
}
