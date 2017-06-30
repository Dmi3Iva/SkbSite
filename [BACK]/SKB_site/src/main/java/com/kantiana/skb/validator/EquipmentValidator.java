package com.kantiana.skb.validator;

import com.kantiana.skb.model.Equipment;
import org.springframework.validation.Errors;

import java.util.List;
import java.util.Map;

public interface EquipmentValidator {
    void validate(Equipment equipment, Errors errors);

    void validate(String uniqueNumber, List<String> errors);
}
