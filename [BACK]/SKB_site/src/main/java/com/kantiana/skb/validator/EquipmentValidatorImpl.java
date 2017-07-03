package com.kantiana.skb.validator;

import com.kantiana.skb.model.Equipment;
import com.kantiana.skb.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.MapBindingResult;
import org.springframework.validation.ValidationUtils;

import java.util.List;
import java.util.Locale;
import java.util.Map;

@Component
public class EquipmentValidatorImpl implements EquipmentValidator {
    @Autowired
    EquipmentService equipmentService;
    @Autowired
    MessageSource messageSource;

    @Override
    public void validate(Equipment equipment, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "uniqueNumber", "NotEmpty.equipment.uniqueNumber");
        if (equipmentService.findByUniqueNumber(equipment.getUniqueNumber()) != null) {
            errors.rejectValue("uniqueNumber", "Duplicate.equipment.uniqueNumber");
        }
    }

    @Override
    public void validate(String uniqueNumber, List<String> errors) {
        if (uniqueNumber == null || uniqueNumber.trim().equals("")) {
            errors.add(messageSource.getMessage("NotEmpty.equipment.uniqueNumber", null, Locale.ROOT));
            return;
        }
        if (equipmentService.findByUniqueNumber(uniqueNumber.trim()) != null) {
            errors.add(messageSource.getMessage("Duplicate.equipment.uniqueNumber", null, Locale.ROOT));
        }
    }
}
