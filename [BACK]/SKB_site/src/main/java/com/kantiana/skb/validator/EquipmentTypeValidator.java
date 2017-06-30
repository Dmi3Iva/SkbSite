package com.kantiana.skb.validator;

import com.kantiana.skb.model.EquipmentType;
import org.springframework.validation.Errors;

public interface EquipmentTypeValidator {
    void validate(EquipmentType equipmentType, Errors errors);
}
